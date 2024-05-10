<?php

namespace App\Http\Controllers;

use App\Models\EmployeeProgression;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EmployeeProgressionController extends Controller
{

    public function all_progression(){
      
        $progression = EmployeeProgression::orderBy('description','ASC')->get();
        return response()->json($progression);
    }

    public function search_progression(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $progression=EmployeeProgression::where('description','LIKE',"%$filter%")->orderBy('description','ASC')->paginate(10);
            return response()->json($progression);
        }else{
            $progression = EmployeeProgression::orderBy('description','ASC')->paginate(10);
            return response()->json($progression);
        }
    }


    public function create_progression(Request $request){
        $formData=[
            'description'=>'',
        ];
        return response()->json($formData);
    }

    public function add_progression(Request $request){

        $validated=$this->validate($request,[
            'description'=>['unique:employee_progressions','required','string']
        ]);
        EmployeeProgression::create($validated);
    }

      public function edit_progression($id){
        $progression = EmployeeProgression::find($id);
        return response()->json([
            'progression'=>$progression
        ],200);
    }

    public function update_progression(Request $request, $id){
        $progression=EmployeeProgression::where('id',$id)->first();
        $validated=$this->validate($request,[
            'description'=>['required', 'string',
            Rule::unique('employee_progressions', 'description')
            ->ignore($id)]
        ]);

        $progression->update($validated);
    }
}
