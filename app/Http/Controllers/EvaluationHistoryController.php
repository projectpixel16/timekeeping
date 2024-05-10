<?php

namespace App\Http\Controllers;
use App\Models\EvaluationHistory;
use Illuminate\Http\Request;

class EvaluationHistoryController extends Controller
{
    public function create_evaluation(Request $request, $id){
   
        if(EvaluationHistory::where('employee_profile_id','=',$id)->where('saved','=', '0')->exists()){
            $evaluation = EvaluationHistory::where('employee_profile_id','=',$id)->where('saved','=', '0')->get();
            foreach($evaluation AS $a){
             
                $formData=[
                    'employee_profile_id'=>$id,
                    'evaluation_date'=>($a->evaluation_date) ? $a->evaluation_date : '',
                    'evaluation_type_id'=>($a->evaluation_type_id) ? $a->evaluation_type_id : '',
                    'score'=>($a->score) ? $a->score : '',
                    'remarks'=>($a->remarks) ? $a->remarks : '',
                    
                ];
                
            }
        } else {

                $formData=[
                    'employee_profile_id'=>$id,
                    'evaluation_date'=>'',
                    'evaluation_type_id'=>'',
                    'score'=>'',
                    'remarks'=>'',
                ];
 
        }

       return response()->json($formData);
    }

    public function save_draft_evaluation(Request $request){

        $id = $request->input('employee_profile_id');
       
        if(EvaluationHistory::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){   
          
            $eval =EvaluationHistory::where('employee_profile_id','=', $id)->where('saved','=','0')->first();
            $eval->update([
                'evaluation_date'=>$request->input('evaluation_date'),
                'evaluation_type_id'=>$request->input('evaluation_type_id'),
                'score'=>$request->input('score'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'0'
            ]);

        } else {
            $movement_id = EvaluationHistory::insertGetId([
                'employee_profile_id'=>$id,
                'evaluation_date'=>$request->input('evaluation_date'),
                'evaluation_type_id'=>$request->input('evaluation_type_id'),
                'score'=>$request->input('score'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'0'
            ]);
        }

     }

     public function save_evaluation(Request $request){

        $id = $request->input('employee_profile_id');
       
        if(EvaluationHistory::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){   
          
            $eval =EvaluationHistory::where('employee_profile_id','=', $id)->where('saved','=','0')->first();
            $eval->update([
                'evaluation_date'=>$request->input('evaluation_date'),
                'evaluation_type_id'=>$request->input('evaluation_type_id'),
                'score'=>$request->input('score'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'1'
            ]);

        } else {
            $movement_id = EvaluationHistory::insertGetId([
                'employee_profile_id'=>$id,
                'evaluation_date'=>$request->input('evaluation_date'),
                'evaluation_type_id'=>$request->input('evaluation_type_id'),
                'score'=>$request->input('score'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'1'
            ]);
        }

        return  $id;

     }
}
