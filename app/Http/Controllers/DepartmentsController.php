<?php

namespace App\Http\Controllers;

use App\Models\Departments;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class DepartmentsController extends Controller
{
  
    public function all_department(){
      
        $departments = Departments::orderBy('department_name','ASC')->get();
        return response()->json($departments);
    }

    public function search_department(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $departments=Departments::where('department_name','LIKE',"%$filter%")->orderBy('department_name','ASC')->paginate(10);
            return response()->json($departments);
        }else{
            //$departments = Departments::paginate(10);
            $departments = Departments::orderBy('department_name','ASC')->paginate(10);
            return response()->json($departments);
        }
    }


    public function create_department(Request $request){
        $formData=[
            'department_name'=>'',
        ];
        return response()->json($formData);
    }

    public function add_department(Request $request){

        $validated=$this->validate($request,[
            'department_name'=>['unique:departments','required','string']
        ]);
        Departments::create($validated);
    }

      public function edit_department($id){
        $departments = Departments::find($id);
        return response()->json([
            'departments'=>$departments
        ],200);
    }

    public function update_department(Request $request, $id){
        $departments=Departments::where('id',$id)->first();
        $validated=$this->validate($request,[
            'department_name'=>['required', 'string',
            Rule::unique('departments', 'department_name')
            ->ignore($id)]
        ]);

        $departments->update($validated);
    }

}
