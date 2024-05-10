<?php

namespace App\Http\Controllers;

use App\Models\WorkSchedules;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class WorkSchedulesController extends Controller
{

    public function all_schedule(){
      
        $workschedule = WorkSchedules::orderBy('schedule_code','ASC')->get();
        return response()->json($workschedule);
    }

    public function search_workschedule(Request $request){
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


    public function create_workschedule(Request $request){
        $formData=[
            'schedule_code'=>'',
            'schedule_type'=>'',
            'start_time'=>'',
            'end_time'=>'',
        ];
        return response()->json($formData);
    }

    public function add_workschedule(Request $request){

        $validated=$this->validate($request,[
            'schedule_code'=>['unique:work_schedules','required','string'],
            'schedule_type'=>['required','string'],
            'start_time'=>['required'],
            'end_time'=>['required'],
        ]);
        WorkSchedules::create($validated);
    }

      public function edit_workschedule($id){
        $workschedule = WorkSchedules::find($id);
        return response()->json([
            'workschedule'=>$workschedule
        ],200);
    }

    public function update_workschedule(Request $request, $id){
        $workschedule=WorkSchedules::where('id',$id)->first();
        $validated=$this->validate($request,[
            'schedule_code'=>['required', 'string',
            Rule::unique('work_schedules', 'schedule_code')
            ->ignore($id)],
            'schedule_type'=>['required','string'],
            'start_time'=>['required'],
            'end_time'=>['required'],
        ]);

        $workschedule->update($validated);
    }
}
