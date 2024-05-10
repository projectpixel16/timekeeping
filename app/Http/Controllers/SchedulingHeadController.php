<?php

namespace App\Http\Controllers;
use App\Models\SchedulingHead;
use App\Models\SchedulingDetails;
use App\Models\EmployeeProfile;
use App\Http\Requests\SchedulingHeadRequest;
use Illuminate\Http\Request;

class SchedulingHeadController extends Controller
{

    public function search_schedule(Request $request){
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
            $schedule = SchedulingHead::with(['work_schedules'])->where('saved','=','1')->orderBy('start_date','ASC')->paginate(10);
        }
        return response()->json($schedule);
  
    }

    public function create_schedulehead(Request $request){

        if(SchedulingHead::where('saved','=','0')->exists()){
            $head = SchedulingHead::where('saved','=','0')->get();

            foreach($head AS $h){
                $formData=[
                    'id'=>$h->id,
                    'work_schedules_id'=>$h->work_schedules_id,
                    'start_date'=>$h->start_date,
                    'end_date'=>$h->end_date,
                    'minimum_hours'=>$h->minimum_hours,
                ];
            }

        } else {

                $formData=[
                    'id'=>'',
                    'work_schedules_id'=>'',
                    'start_date'=>'',
                    'end_date'=>'',
                    'minimum_hours'=>'',
                ];
        }
        return response()->json($formData);
    }

    public function create_scheduledetails(Request $request){

        if(SchedulingDetails::where('saved','=','0')->exists()){
            $details = SchedulingDetails::with(['employee_profile'])->where('saved','=','0')->get();

            foreach($details AS $d){

                //EmployeeProfile::where('id','=',$d->employee_profile_id)->value('lastname')

                $formData[]=[
                    'id'=>$d->id,
                    'scheduling_head_id'=>$d->scheduling_head_id,
                    'employee_profile_id'=>$d->employee_profile_id,
                    'employee_name'=>$d->employee_profile->lastname . ', ' . $d->employee_profile->firstname . ' ' . $d->employee_profile->middlename,
                    'overtime'=>$d->overtime,
                ];
            }

        } else {

                $formData=[];
        }
        return response()->json($formData);
    }

    public function save_draft_scheduling(SchedulingHeadRequest $request){

        if(SchedulingHead::where('saved','=','0')->exists()){   
            $schedule_id= SchedulingHead::where('saved','=', '0')->value('id');
            $sched =SchedulingHead::where('saved','=', '0')->first();
            $sched->update([
                'work_schedules_id'=>$request->input('work_schedules_id'),
                'start_date'=>$request->input('start_date'),
                'end_date'=>$request->input('end_date'),
                'minimum_hours'=>$request->input('minimum_hours'),
                'saved'=>'0'
            ]);

        } else {
            $schedule_id = SchedulingHead::insertGetId([
                'work_schedules_id'=>$request->input('work_schedules_id'),
                'start_date'=>$request->input('start_date'),
                'end_date'=>$request->input('end_date'),
                'minimum_hours'=>$request->input('minimum_hours'),
                'saved'=>'0'
            ]);
        }

        $details=SchedulingDetails::where('scheduling_head_id','=',$schedule_id);
        $details->delete(); 

        $employees = $request->input('employees');
             foreach(json_decode($employees) as $e){
 
                if($e->overtime!= 0 ){
                    $overtime = 1;
                } else {
                    $overtime = 0;
                }
                SchedulingDetails::create([
                    'scheduling_head_id' => $schedule_id,
                    'employee_profile_id'=>$e->employee_profile_id,
                    'overtime'=>$overtime,
                    'saved'=>'0'
                ]);
             }
         }


         public function save_scheduling(SchedulingHeadRequest $request){

            if(SchedulingHead::where('saved','=','0')->exists()){   
                $schedule_id= SchedulingHead::where('saved','=', '0')->value('id');
                $sched =SchedulingHead::where('saved','=', '0')->first();
                $sched->update([
                    'work_schedules_id'=>$request->input('work_schedules_id'),
                    'start_date'=>$request->input('start_date'),
                    'end_date'=>$request->input('end_date'),
                    'minimum_hours'=>$request->input('minimum_hours'),
                    'saved'=>'1'
                ]);
    
            } else {
                $schedule_id = SchedulingHead::insertGetId([
                    'work_schedules_id'=>$request->input('work_schedules_id'),
                    'start_date'=>$request->input('start_date'),
                    'end_date'=>$request->input('end_date'),
                    'minimum_hours'=>$request->input('minimum_hours'),
                    'saved'=>'1'
                ]);
            }
    
            $details=SchedulingDetails::where('scheduling_head_id','=',$schedule_id);
            $details->delete(); 
    
            $employees = $request->input('employees');
                 foreach(json_decode($employees) as $e){
     
                    if($e->overtime!= 0 ){
                        $overtime = 1;
                    } else {
                        $overtime = 0;
                    }
                    SchedulingDetails::create([
                        'scheduling_head_id' => $schedule_id,
                        'employee_profile_id'=>$e->employee_profile_id,
                        'overtime'=>$overtime,
                        'saved'=>'1'
                    ]);
                 }
             }
     
        public function get_schedulehead(Request $request, $id){

            $head = SchedulingHead::where('id','=',$id)->get();

            foreach($head AS $h){
                $headData=[
                    'id'=>$h->id,
                    'work_schedules_id'=>$h->work_schedules_id,
                    'start_date'=>$h->start_date,
                    'end_date'=>$h->end_date,
                    'minimum_hours'=>$h->minimum_hours,
                ];
            }

            $details = SchedulingDetails::with(['employee_profile'])->where('scheduling_head_id','=',$id)->get();

            foreach($details AS $d){
                $detailsData[]=[
                    'id'=>$d->id,
                    'employee_profile_id'=>$d->employee_profile_id,
                    'employee_name'=>$d->employee_profile->lastname . ', ' . $d->employee_profile->firstname . ' ' . $d->employee_profile->middlename,
                    'overtime'=>$d->overtime,
                    
                ];
            }

      
            return response()->json([
                'head'=>$headData,
                'details'=>$detailsData
            ]);
        }

        public function delete_schedule_employee($id){

            $emp=SchedulingDetails::find($id);
            $emp->delete(); 
        }

}
