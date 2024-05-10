<?php

namespace App\Http\Controllers;

use App\Models\EvaluationType;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EvaluationTypeController extends Controller
{

    public function all_evaluation(){
      
        $evaluation = EvaluationType::orderBy('evaluation_name','ASC')->get();
        return response()->json($evaluation);
    }

    public function search_evaluation(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $evaluation=EvaluationType::where('evaluation_name','LIKE',"%$filter%")->orderBy('evaluation_name','ASC')->paginate(10);
            return response()->json($evaluation);
        }else{
            $evaluation = EvaluationType::orderBy('evaluation_name','ASC')->paginate(10);
            return response()->json($evaluation);
        }
    }


    public function create_evaluation(Request $request){
        $formData=[
            'evaluation_name'=>'',
        ];
        return response()->json($formData);
    }

    public function add_evaluation(Request $request){

        $validated=$this->validate($request,[
            'evaluation_name'=>['unique:evaluation_types','required','string']
        ]);
        EvaluationType::create($validated);
    }

      public function edit_evaluation($id){
        $evaluation = EvaluationType::find($id);
        return response()->json([
            'evaluation'=>$evaluation
        ],200);
    }

    public function update_evaluation(Request $request, $id){
        $evaluation=EvaluationType::where('id',$id)->first();
        $validated=$this->validate($request,[
            'evaluation_name'=>['required', 'string',
            Rule::unique('evaluation_types', 'evaluation_name')
            ->ignore($id)]
        ]);

        $evaluation->update($validated);
    }

}
