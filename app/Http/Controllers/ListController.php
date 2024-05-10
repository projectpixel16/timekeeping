<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Departments;
use App\Models\BusinessUnits;
use App\Models\HolidayTypes;
use App\Models\LeaveTypes;
use App\Models\WorkSchedules;
use App\Models\AllowanceList;
use App\Models\EmployeeProgression;
use App\Models\EmployeeStatus;
use App\Models\BusinessCalendar;
use App\Models\Holidays;
use App\Models\Provinces;
use App\Models\Cities;
use App\Models\EducationalBackground;
use App\Models\EmploymentHistory;
use App\Models\TrainingsSeminars;
use App\Models\CertificationsLicenses;
use App\Models\CharacterReference;
use App\Models\EmployeeProfile;
use App\Models\JobProfile;
use App\Models\Benefits;
use App\Models\AppraisalsMovements;
use App\Models\EvaluationHistory;
use App\Models\DisciplinaryRecord;
use App\Models\EvaluationType;
use App\Models\SchedulingHead;
use App\Models\LeaveApplication;
use App\Models\Timekeeping;
use App\Models\Reminders;
use DateTime;
use DateInterval;
use DatePeriod;
class ListController extends Controller
{
  
    public function all_department(Request $request){
        $filter=$request->get('filter');
        if($filter!=null){
            $departments=Departments::where('department_name','LIKE',"%$filter%")->orderBy('department_name','ASC')->paginate(10);
            
        }else{
            $departments = Departments::orderBy('department_name','ASC')->paginate(10);
          
        }
        return response()->json($departments);
    }


    public function all_businessunits(Request $request){
      
        $filter=$request->get('filter');
        if($filter!=null){
            $business=BusinessUnits::where('bu_name','LIKE',"%$filter%")->orderBy('bu_name','ASC')->paginate(10);
            
        }else{
            $business = BusinessUnits::orderBy('bu_name','ASC')->paginate(10);
          
        }
        return response()->json($business);

    }

    public function all_holidaytypes(Request $request){
      
        $filter=$request->get('filter');
        if($filter!=null){
            $holidaytypes=HolidayTypes::where('type_name','LIKE',"%$filter%")->orderBy('type_name','ASC')->paginate(10);
            
        }else{
            $holidaytypes = HolidayTypes::orderBy('type_name','ASC')->paginate(10);
          
        }
        return response()->json($holidaytypes);
    }

    public function all_leavetypes(Request $request){
      
        $filter=$request->get('filter');
        if($filter!=null){
            $leavetypes=LeaveTypes::where('leave_name','LIKE',"%$filter%")->orderBy('leave_name','ASC')->paginate(10);
            
        }else{
            $leavetypes = LeaveTypes::orderBy('leave_name','ASC')->paginate(10);
          
        }
        return response()->json($leavetypes);
    }

    public function all_workschedule(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            
            $workschedule=WorkSchedules::where('schedule_code','LIKE',"%$filter%")
                                    ->orWhere('schedule_type','LIKE',"%$filter%")
                                    ->orWhere('start_time','LIKE',"%$filter%")
                                    ->orWhere('end_time','LIKE',"%$filter%")
                                    ->orderBy('schedule_code','ASC')->paginate(10);
            return response()->json($workschedule);
        }else{
            $workschedule = WorkSchedules::orderBy('schedule_code','ASC')->paginate(10);
            return response()->json($workschedule);
        }

    }

    public function all_allowances(Request $request){

        $filter=$request->get('filter');
        if($filter!=null){
            $allowance=AllowanceList::where('allowance_name','LIKE',"%$filter%")->orderBy('allowance_name','ASC')->paginate(10);
            
        }else{
            $allowance = AllowanceList::orderBy('allowance_name','ASC')->paginate(10); 
        }
        return response()->json($allowance);
    }
    
    public function all_evaluation(Request $request){

        $filter=$request->get('filter');
        if($filter!=null){
            $evaluation=EvaluationType::where('evaluation_name','LIKE',"%$filter%")->orderBy('evaluation_name','ASC')->paginate(10);
        }else{
            $evaluation = EvaluationType::orderBy('evaluation_name','ASC')->paginate(10);
        }
        return response()->json($evaluation);

    }

    public function all_progression(Request $request){
        $filter=$request->get('filter');
        if($filter!=null){
            $progression=EmployeeProgression::where('description','LIKE',"%$filter%")->orderBy('description','ASC')->paginate(10);
        }else{
            $progression = EmployeeProgression::orderBy('description','ASC')->paginate(10);
        }
        return response()->json($progression);

    }

    public function all_empstatus(Request $request){
      
        $filter=$request->get('filter');
        if($filter!=null){
            $empstatus=EmployeeStatus::where('description','LIKE',"%$filter%")->orderBy('description','ASC')->paginate(10);
        }else{
            $empstatus = EmployeeStatus::orderBy('description','ASC')->paginate(10);
        }
        return response()->json($empstatus);


    }

    public function all_calendar(Request $request){
     
        $filter=$request->get('filter');
       
        if($filter!=null){
            $calendar=BusinessCalendar::where('year','LIKE',"%$filter%")
            ->orWhere('start_date','LIKE',"%$filter%")
            ->orWhere('end_date','LIKE',"%$filter%")
            ->orderBy('year','DESC')->paginate(10);
        }else{
            $calendar = BusinessCalendar::orderBy('year','DESC')->paginate(10);
        }

        return response()->json($calendar);

    }

    public function all_holidays(){
        $holiday=Holidays::where('holiday_date','!=','')->orderBy('holiday_date','DESC')->get();
        return response()->json($holiday);
    }

    
    public function all_provinces(){
        $provinces=Provinces::where('province_name','!=','')->orderBy('province_name','ASC')->get();
        return response()->json($provinces);
    }

    public function all_cities($id){
       
        $cities=Cities::where('province_id', '=', $id)->where('city_name','!=','')->orderBy('city_name','ASC')->get();
        return response()->json($cities);
    }

    public function check_drafts($id){
        $education=0;
        $employment=0;
        $trainings=0;
        $certifications=0;
        $character=0;
        if(EducationalBackground::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $education=1;
        }
        if(EmploymentHistory::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $employment=1;
        }
        if(TrainingsSeminars::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $trainings=1;
        }
        if(CertificationsLicenses::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $certifications=1;
        }
        if(CharacterReference::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $character=1;
        }

        return response()->json([
            'education'=>$education,
            'employment'=>$employment,
            'trainings'=>$trainings,
            'certifications'=>$certifications,
            'character'=>$character
        ]);
    }

    public function check_job_drafts($id){
        $job=0;
        $benefit=0;
        $appraisal=0;
        $evaluation=0;
        $disciplinary=0;
        if(JobProfile::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $job=1;
        }
        if(Benefits::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $benefit=1;
        }
        if(AppraisalsMovements::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $appraisal=1;
        }
        if(EvaluationHistory::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $evaluation=1;
        }
        if(DisciplinaryRecord::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $disciplinary=1;
        }

        return response()->json([
            'job'=>$job,
            'benefit'=>$benefit,
            'appraisal'=>$appraisal,
            'evaluation'=>$evaluation,
            'disciplinary'=>$disciplinary
        ]);
    }

    public function all_schedule(Request $request){

        $filter=$request->get('filter');
        if($filter!=null){
            $sched=SchedulingHead::with(['work_schedules'])
            ->where('start_date','LIKE',"%$filter%")
            ->where('end_date','LIKE',"%$filter%")
            ->where('minimum_hours','LIKE',"%$filter%")
            ->where('saved','=','1');


            $sched->orWhereHas('work_schedules', function ($sched) use ($filter){
                $sched->where('schedule_code','LIKE',"%$filter%");
            });
            

        $schedule = $sched->orderBy('start_date','ASC')->paginate(10);
                    
        }else{
            $schedule = SchedulingHead::with('work_schedules')->where('saved','=','1')->orderBy('start_date','ASC')->paginate(10);
           
        }
        return response()->json($schedule);
    }

    public function get_dashboard_info(){
     
        $data=array();
        
        $to = date("Y-m-d");
        $from = date('Y-m-d', strtotime('-2 months'));
        $begin = new DateTime($from);
        $end = new DateTime($to);

        $interval = DateInterval::createFromDateString('1 day');
        $period = new DatePeriod($begin, $interval, $end);
        $leave_applied=0;
        $holiday=0;
        $incomplete=array();
        $stat_number=array();
        $unscheduled = array();
        foreach ($period as $dt) {

            $date= $dt->format("Y-m-d");

            $query=EmployeeProfile::query();
          
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
                            $interval = date_diff($first_hour,$last_hour);
                            $rendered = $interval->format('%h:%i');
                        
                        } 
                    } else if($count_time == 0){
                        $rendered ='No data';
                    }else {
                        $rendered ='Incomplete data';
                    }
              


                if($rendered == "Incomplete data"){
                    $incomplete[]=[
                                'employee_profile_id'=>$q->id,
                                'employee_name'=>$q->lastname . ', ' . $q->firstname . ' ' . $q->middlename,
                                'date'=>$date .', ' . date('D', strtotime($date)),
                              
                            ];
                }
            }
        
        }
         ////////////////////////////////////////////// UNSCHEDULED EMPLOYEES ///////////////////////////////////

         $emp=EmployeeProfile::select('id');

         $emp->whereHas('job_profile', function ($emp) {
             $emp->where('active','=','1')->where('saved','=','1');
         });
        
         $act= $emp->get();
         foreach($act as $a){
            $active[] = $a->id;
         }

        $date=date("Y-m-d");
        $sched= SchedulingHead::with('scheduling_details')
                ->where('start_date','<=', $date)
                ->where('end_date','>=', $date)
                ->where('saved','=','1')->get();
        
        foreach($sched AS $s){
            foreach($s->scheduling_details AS $sd){
                $scheduled[] = $sd->employee_profile_id;
            }
               
        }
      
         $unsched=array_diff($active,$scheduled);
         foreach($unsched AS $us){
           $unscheduled[] = EmployeeProfile::where("id","=",$us)->value('firstname') . " " . EmployeeProfile::where("id","=",$us)->value('lastname');
         }
    
          ////////////////////////////////////////////// REMINDERS ///////////////////////////////////


          $reminders= Reminders::where("status","=","0")->orderBy('created_at', 'DESC')->get();

           ////////////////////////////////////////////// CALENDAR ///////////////////////////////////

           $curr_year = '2025';
           $curr_year_calendar= BusinessCalendar::where("year","=",$curr_year)->exists();

           ////////////////////////////////////////////// EMPLOYEE STATUS NUMBER ///////////////////////////////////
             foreach(EmployeeStatus::get() AS $stat){

                $number = EmployeeProfile::where('employee_status_id','=',$stat->id)->count();
                $stat_number[] = [
                    'description'=>$stat->description,
                    'number'=>$number
                ];
             }
        return response()->json([
            'incomplete'=>$incomplete,
            'unscheduled'=>$unscheduled,
            'reminders'=>$reminders,
            'calendar'=>$curr_year_calendar,
            'stat_number'=>$stat_number
        ],200);

      
    }


    public function add_reminders(Request $request){

        $validated=$this->validate($request,[
            'description'=>['required','string'],
            'added_by'=>['required']
        ]);
       $id= Reminders::insertGetId($validated);
        return $data = [
            'id'=>$id,
            'description'=>$request->description,
        ];
    }

    public function done_reminders($id){

       
        $rem=Reminders::where('id',$id)->first();
        $rem->update([
            'status'=>'1'
        ]);
    }
}
