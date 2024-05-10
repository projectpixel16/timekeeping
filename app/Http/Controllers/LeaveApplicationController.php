<?php

namespace App\Http\Controllers;
use App\Models\LeaveApplication;
use App\Http\Requests\LeaveApplicationRequest;
use Illuminate\Http\Request;

class LeaveApplicationController extends Controller
{
    public function get_leave_application(Request $request, $id){

        if($id == 'new'){
            $formData=[
                'employee_profile_id'=>'',
                'date_applied'=>'',
                'start_date'=>'',
                'end_date'=>'',
                'no_of_days'=>'',
                'no_of_hours'=>'',
                'leave_types_id'=>'',
                'reason'=>'',
            ];
           
        } else {
          
                $formData=[
                    'employee_profile_id'=>$id,
                    'date_applied'=>'',
                    'start_date'=>'',
                    'end_date'=>'',
                    'no_of_days'=>'',
                    'no_of_hours'=>'',
                    'leave_types_id'=>'',
                    'reason'=>'',
                ];
              
        }
        return response()->json($formData);
    }

    public function save_leave_application(LeaveApplicationRequest $request){

        LeaveApplication::create([
            'employee_profile_id'=>$request->input('employee_profile_id'),
            'date_applied'=>$request->input('start_date'),
            'start_date'=>$request->input('start_date'),
            'end_date'=>$request->input('end_date'),
            'no_of_days'=>$request->input('no_of_days'),
            'no_of_hours'=>$request->input('no_of_hours'),
            'leave_types_id'=>$request->input('leave_types_id'),
            'reason'=>$request->input('reason'),
        ]);

       
    }

    public function get_all_leave(Request $request){

        $search=$request->get('search');
        $filter=$request->get('filter');
        if($search!=null && $filter == 'null'){
          
            $leave=LeaveApplication::with(['employee_profile','leave_types'])->where('start_date','LIKE',"%$search%")
            ->orWhere('end_date','LIKE',"%$search%")
            ->orWhere('reason','LIKE',"%$search%");

            $leave->orWhereHas('employee_profile', function ($leave) use ($search){
                $leave->where('firstname','LIKE',"%$search%");
                $leave->where('lastname','LIKE',"%$search%");
            });

            $leave->orWhereHas('leave_types', function ($leave) use ($search){
                $leave->where('leave_name','LIKE',"%$search%");
            });

            $list= $leave->orderBy('start_date','DESC')->paginate(10);
            
        } else if($search==null && $filter != 'null'){
          
            $fil = explode("~", $filter);
            $from = $fil[0];
            $to = $fil[1];
            $emp = $fil[2];
        
            $leave=LeaveApplication::with(['employee_profile','leave_types']);
            
            
            if($from != 'from' && $to != 'to') {
                //echo "hello" . $from . " to " . $to . " - " . $emp;
                $leave->whereBetween('start_date',[$from, $to]);
            }
            if($emp != 'employee') {
                //echo "hello" . $from . " to " . $to . " - " . $emp;
                $leave->where('employee_profile_id',$emp);
            }

               $list = $leave->orderBy('start_date','DESC')->paginate(10);
            
        } else if($search!=null && $filter != 'null'){
          
            $fil = explode("~", $filter);
            $from = $fil[0];
            $to = $fil[1];
            $emp = $fil[2];

            $leave=LeaveApplication::with(['employee_profile','leave_types']);
            if($from && $to) {
                $leave->whereBetween('start_date',[$from, $to]);
            }
            if($emp) {
                $leave->where('employee_profile_id',$emp);
            }

                $leave->orWhere('end_date','LIKE',"%$search%");
                $leave->orWhere('reason','LIKE',"%$search%");

            $leave->orWhereHas('employee_profile', function ($leave) use ($search){
                $leave->where('firstname','LIKE',"%$search%");
                $leave->where('lastname','LIKE',"%$search%");
            });

            $leave->orWhereHas('leave_types', function ($leave) use ($search){
                $leave->where('leave_name','LIKE',"%$search%");
            });

            $list= $leave->orderBy('start_date','DESC')->paginate(10);
            
        }  else{
           
            $list = LeaveApplication::with(['employee_profile','leave_types'])->orderBy("start_date", "DESC")->paginate(10);
          
        }
       //return $list;
        return response()->json($list);
        
    }

    public function search_leave(Request $request){
        $search=$request->get('search');
       
        if($search!=null){
            $leave=LeaveApplication::with(['employee_profile','leave_types'])->where('start_date','LIKE',"%$search%")
            ->orWhere('end_date','LIKE',"%$search%")
            ->orWhere('reason','LIKE',"%$search%");

            $leave->orWhereHas('employee_profile', function ($leave) use ($search){
                $leave->where('firstname','LIKE',"%$search%");
                $leave->orwhere('lastname','LIKE',"%$search%");
            });

            $leave->orWhereHas('leave_types', function ($leave) use ($search){
                $leave->where('leave_name','LIKE',"%$search%");
            });

            $list= $leave->orderBy('start_date','DESC')->paginate(10);
        }else{
            //$departments = Departments::paginate(10);
            $list = LeaveApplication::with(['employee_profile','leave_types'])->orderBy("start_date", "DESC")->paginate(10);
           
        }
        return response()->json($list);
    }

    public function get_leave_details(Request $request, $id){

        $leave = LeaveApplication::with(['employee_profile','leave_types'])->where('id',$id)->orderBy("start_date", "DESC")->get();
        foreach($leave AS $l){

            $formData=[
                'id'=>$l->id,
                'employee_profile_id'=>$l->employee_profile_id,
                'date_applied'=>$l->date_applied,
                'start_date'=>$l->start_date,
                'end_date'=>$l->end_date,
                'no_of_days'=>$l->no_of_days,
                'leave_type'=>$l->leave_types->leave_name,
                'leave_types_id'=>$l->leave_types_id,
                'reason'=>$l->reason,
                'firstname'=>$l->employee_profile->firstname,
                'lastname'=>$l->employee_profile->lastname,
                'cancelled_date'=>$l->cancelled_date,
                'cancelled_reason'=>$l->cancelled_reason
                
            ];

        }
        return response()->json($formData);
        
    }

    public function cancel_leave(Request $request, $id){
        $leaveapp=LeaveApplication::where('id',$id)->first();
        $validated=$this->validate($request,[
            'cancelled_date'=>['required'],
            'cancelled_reason'=>['required'],
            'cancelled_by'=>['required'],
            'cancelled'=>['required']
        ]);
        
        $leaveapp->update($validated);
    }

    public function update_leave_application(LeaveApplicationRequest $request){

        $id= $request->input('id');

        $leaveapp=LeaveApplication::where('id',$id)->first();
        $leaveapp->update([
            'employee_profile_id'=>$request->input('employee_profile_id'),
            'date_applied'=>$request->input('start_date'),
            'start_date'=>$request->input('start_date'),
            'end_date'=>$request->input('end_date'),
            'no_of_days'=>$request->input('no_of_days'),
            'no_of_hours'=>$request->input('no_of_hours'),
            'leave_types_id'=>$request->input('leave_types_id'),
            'reason'=>$request->input('reason'),
        ]);

       
    }
}
