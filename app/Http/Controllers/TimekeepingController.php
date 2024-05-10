<?php

namespace App\Http\Controllers;
use App\Models\Timekeeping;
use App\Models\EmployeeProfile;
use App\Models\SchedulingHead;
use App\Models\LeaveApplication;
use App\Models\Holidays;
use Illuminate\Http\Request;
use DateTime;
use DateInterval;
use DatePeriod;

class TimekeepingController extends Controller
{
    public function get_daily_hours(Request $request, $from, $to, $employee){
     
        $data=array();
        $begin = new DateTime($from);
        $end = new DateTime($to);

        $interval = DateInterval::createFromDateString('1 day');
        $period = new DatePeriod($begin, $interval, $end);
        $leave_applied=0;
        $holiday=0;
        foreach ($period as $dt) {

            $date= $dt->format("Y-m-d");

            if($employee == 'record'){
                $query=EmployeeProfile::query();
            } else {
                $query=EmployeeProfile::where('id','=', $employee);
            }

            $query->whereHas('job_profile', function ($query) {
                $query->where('active','=','1')->where('saved','=','1');
            });
            $results = $query->get();
         
         
           foreach($results AS $q){
           
                $empid=$q->id;

                $sched=SchedulingHead::where('start_date','<=', $date)->where('end_date','>=', $date);

                $sched->whereHas('scheduling_details', function ($sched) use ($empid) {
                    $sched->where('employee_profile_id','=',$empid)->where('saved','=','1');
                });

                $min_hours = $sched->value('minimum_hours');

                $leave_applied=LeaveApplication::where('start_date','<=', $date)
                                            ->where('end_date','>=', $date)
                                            ->where('employee_profile_id', "=", $empid)->count();
                $holiday=Holidays::where('holiday_date','=', $date)->count();

               
                $count_time = Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $empid)->count();
              
                    if($count_time%2==0 && $count_time != 0){
                        $first_hour = date_create(Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $empid)->min('recorded_time'));
                        $last_hour = date_create(Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $empid)->max('recorded_time'));
                        if(!empty($first_hour) && !empty($last_hour)){
                           
                            $interval = date_diff($first_hour, $last_hour);
                            $rendered = $interval->format('%H:%i:%s');

                            // $interval = date_diff($first_hour,$last_hour);
                            // $rendered = $interval->format('%h:%i');
                        
                        } 
                    } else if($count_time == 0){
                        $rendered ='No data';
                    }else {
                        $rendered ='Incomplete data';
                    }
              

              
                 if($rendered == 'No data'){
                    $lacking = 'No data';
                 } else if($rendered == 'Incomplete data'){
                    $lacking = 'Incomplete data';
                  
                } else {
                    
                        $min = $min_hours * 3600;
                        $date_min = ($min);
                        $date_ren = explode(':', $rendered);
                        $hours= $date_ren[0];
                        $mins = $date_ren[1];
    
                        $ren_hours = ($hours * 3600) + ($mins * 60);
    
    
                        $diff = $min-$ren_hours;
                        if($diff>0){
                            $lacking = gmdate('H:i', $diff);
                        } else {
                            $lacking='';
                        }
                }


                $data[]=[
                            'employee_profile_id'=>$q->id,
                            'employee_name'=>$q->lastname . ', ' . $q->firstname . ' ' . $q->middlename,
                            'date'=>$date .', ' . date('l', strtotime($date)),
                            'min_hours'=>$min_hours,
                            'rendered'=>$rendered,
                            'lacking'=>$lacking,
                            'leave_applied'=>$leave_applied,
                            'holiday'=>$holiday
                        ];
            }
            // foreach($results AS $res){
            //     $data[]=[
            //         'employee_profile_id'=>$res->employee_profile_id,
            //         'date'=>$res->recorded_time,
            //     ];
            // }
        }

        return $data;

      
    }

    public function get_timesheet(Request $request, $from, $to){

        $from=date("Y-m-d",strtotime($from));
      
         $begin = new DateTime($from);
       
         $end = new DateTime($to);

        $interval = DateInterval::createFromDateString('1 day');
        $period = new DatePeriod($begin, $interval, $end);

       foreach ($period as $dt) {


            $date= $dt->format("Y-m-d");
           
            $query=EmployeeProfile::select('id', 'firstname', 'lastname');

            $query->whereHas('job_profile', function ($query) {
                $query->where('active','=','1')->where('saved','=','1');
            });

            $query->whereHas('timekeeping', function ($query) use ($date){
                $query->where('recorded_time','LIKE','%'.$date.'%');
            });
           
            $employees= $query->get();
           $day= date('D', strtotime($date));
            foreach ($employees as $e) {
                $count_time = Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $e->id)->count();
                
                if($count_time%2==0 && $count_time != 0){
                    $first_hour = date_create(Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $e->id)->min('recorded_time'));
                    $last_hour = date_create(Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $e->id)->max('recorded_time'));
                    if(!empty($first_hour) && !empty($last_hour)){
                        $interval = date_diff($first_hour,$last_hour);
                        $rendered = $interval->format('%h:%i');
                    } 
                } else if($count_time == 0){
                    $rendered ='No data';
                }else {
                    $rendered ='Incomplete';
                }


                $time=Timekeeping::selectRaw('DATE_FORMAT(recorded_time, "%H:%i:%s") as dtr')->where("employee_profile_id", $e->id)
                                ->where("recorded_time","LIKE","%".$date."%")
                                ->orderBy("recorded_time", "ASC")
                                ->get();

                $time_in=Timekeeping::selectRaw('DATE_FORMAT(recorded_time, "%Y-%m-%d %H:%i:%s") as dtr')->where("employee_profile_id", $e->id)
                ->where("recorded_time","LIKE","%".$date."%")
                ->orderBy("recorded_time", "ASC")
                ->first();

                $time_out=Timekeeping::selectRaw('DATE_FORMAT(recorded_time, "%Y-%m-%d %H:%i:%s") as dtr')->where("employee_profile_id", $e->id)
                ->where("recorded_time","LIKE","%".$date."%")
                ->orderBy("recorded_time", "DESC")
                ->first();

                    $emp_id = $e->id;
                    $ts = SchedulingHead::with('scheduling_details','work_schedules')
                                        ->where('saved','=','1')
                                        ->where('start_date','<=', $date)
                                        ->where('end_date','>=', $date);
                    $ts->whereHas('scheduling_details', function ($ts) use ($emp_id){
                        $ts->where('employee_profile_id','=',$emp_id);
                    });
                 

                    $sheet = $ts->get();
                    $start_time = $sheet[0]->work_schedules->start_time;
                    $end_time = $sheet[0]->work_schedules->end_time;
                 
                    if($rendered != 'No data' && $rendered != 'Incomplete'){
                       $st = date_create($date. " " . $start_time);
                       $t_in = date_create($time_in->dtr);
                        $late = date_diff($st, $t_in);
                        $late_hour = $late->format('%H:%i:%s');


                        $et = date_create($date. " " . $end_time);
                        $t_out = date_create($time_out->dtr);
                         $ot = date_diff($et, $t_out);
                        if($ot->invert == 0){
                            $ot_hour = $ot->format('%H:%i:%s');
                        } else {
                            $ot_hour='00:00';
                        }

                         
                        if($st < $t_in){
                            $in = $t_in->format('H:i:s');
                            
                         } else {
                             $in = $st->format('H:i:s');
                         }
                       
                        if($et > $t_out){
                            $out = $t_out->format('H:i:s');
                         } else {
                            $out = $et->format('H:i:s');
                         }
                        $in_time = date_create($date. " " . $in);
                        $out_time = date_create($date. " " . $out);
                        $hrssched = date_diff($in_time, $out_time);
                        $hours_sched = $hrssched->format('%H:%i:%s');

                    
                        // $act_hour = $rendered - ($late_hour * 60);
                        // $actual_hour = date("H:i", $act_hour);
                    } else {
                        $in="";
                        $out="";
                        $late_hour = '00:00';
                        $ot_hour = '00:00';
                        $hours_sched= '00:00';
                    }

               $data[]=[
                 "employee_profile_id"=>$e->id,
                 "name"=>$e->lastname.", " . $e->firstname,
                 "date"=>$date,
                 "day"=>$day,
                 "time"=>$time,
                //  "in"=>$in,
                //  "out"=>$out,
                 "in"=>$t_in->format('H:i:s'),
                 "out"=>$t_out->format('H:i:s'),
                 "late_hour"=>$late_hour,
                 "ot_hour"=>$ot_hour,
                 "actual_time"=>$start_time . ' - ' . $end_time,
                 "hrs_sched"=>$hours_sched,
                 "total_hours"=>$rendered
               ];
            }

       }
     
      return $data;
      
    }

    public function get_employee_time($employee_profile_id, $date){
        $dt = date("Y-m-d",strtotime($date));
        $time=Timekeeping::selectRaw('DATE_FORMAT(recorded_time, "%H:%i:%s") as dtr')->where("employee_profile_id", $employee_profile_id)
        ->where("recorded_time","LIKE","%".$dt."%")
        ->orderBy("recorded_time", "ASC")
        ->get();

       return $time;
    }

    public function save_missing_time(Request $request){

       $recorded_time = date("Y-m-d", strtotime($request->input('date'))) . " " .  $request->input('missing_time');
        Timekeeping::create([
            'employee_profile_id'=>$request->input('employee_profile_id'),
            'recorded_time'=>$recorded_time,
        ]);
    }
}
