<?php

namespace App\Http\Controllers;

use App\Models\EmployeeStatus;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EmployeeStatusController extends Controller
{

    public function all_empstatus(){
      
        $empstatus = EmployeeStatus::orderBy('description','ASC')->get();
        return response()->json($empstatus);
    }

    public function search_empstatus(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $empstatus=EmployeeStatus::where('description','LIKE',"%$filter%")->orderBy('description','ASC')->paginate(10);
        }else{
            $empstatus = EmployeeStatus::orderBy('description','ASC')->paginate(10);
        }

        return response()->json($empstatus);
    }


    public function create_empstatus(Request $request){
        $formData=[
            'description'=>'',
        ];
        return response()->json($formData);
    }

    public function add_empstatus(Request $request){

        $validated=$this->validate($request,[
            'description'=>['unique:employee_statuses','required','string']
        ]);
        EmployeeStatus::create($validated);
    }

      public function edit_empstatus($id){
        $empstatus = EmployeeStatus::find($id);
        return response()->json([
            'empstatus'=>$empstatus
        ],200);
    }

    public function update_empstatus(Request $request, $id){
        $empstatus=EmployeeStatus::where('id',$id)->first();
        $validated=$this->validate($request,[
            'description'=>['required', 'string',
            Rule::unique('employee_statuses', 'description')
            ->ignore($id)]
        ]);

        $empstatus->update($validated);
    }
}
