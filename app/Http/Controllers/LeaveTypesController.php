<?php

namespace App\Http\Controllers;

use App\Models\LeaveTypes;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class LeaveTypesController extends Controller
{

    public function all_leave_types(){
          
        $leavetypes = LeaveTypes::orderBy('leave_name','ASC')->get();
        return response()->json($leavetypes);
        
    }

    public function search_leavetypes(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $leavetypes=LeaveTypes::where('leave_name','LIKE',"%$filter%")->orderBy('leave_name','ASC')->paginate(10);
        }else{
            $leavetypes = LeaveTypes::orderBy('leave_name','ASC')->paginate(10);
        }
        return response()->json($leavetypes);
    }


    public function create_leavetype(Request $request){
        $formData=[
            'leave_name'=>'',
            'leave_days'=>'',
        ];
        return response()->json($formData);
    }

    public function add_leavetype(Request $request){

        $validated=$this->validate($request,[
            'leave_name'=>['unique:leave_types','required','string'],
            'leave_days'=>['required','numeric']
        ]);
        LeaveTypes::create($validated);
    }

      public function edit_leavetype($id){
        $leavetypes = LeaveTypes::find($id);
        return response()->json([
            'leavetypes'=>$leavetypes
        ],200);
    }

    public function update_leavetype(Request $request, $id){
        $leavetypes=LeaveTypes::where('id',$id)->first();
        $validated=$this->validate($request,[
            'leave_name'=>['required', 'string',
            Rule::unique('leave_types', 'leave_name')
            ->ignore($id)],
            'leave_days'=>['required','numeric']
        ]);

        $leavetypes->update($validated);
    }
}
