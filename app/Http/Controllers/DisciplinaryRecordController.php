<?php

namespace App\Http\Controllers;

use App\Models\DisciplinaryRecord;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class DisciplinaryRecordController extends Controller
{
    public function create_disciplinary(Request $request, $id){
   
        if(DisciplinaryRecord::where('employee_profile_id','=',$id)->where('saved','=', '0')->exists()){
            $evaluation = DisciplinaryRecord::where('employee_profile_id','=',$id)->where('saved','=', '0')->get();
            foreach($evaluation AS $a){
             
                $formData=[
                    'employee_profile_id'=>$id,
                    'recorded_date'=>($a->recorded_date) ? $a->recorded_date : '',
                    'incident_date'=>($a->incident_date) ? $a->incident_date : '',
                    'violation_desc'=>($a->violation_desc) ? $a->violation_desc : '',
                    'officer'=>($a->officer) ? $a->officer : '',
                    'findings'=>($a->findings) ? $a->findings : '',
                    'da_taken'=>($a->da_taken) ? $a->da_taken : '',
                    'remarks'=>($a->remarks) ? $a->remarks : '',
                    
                ];
                
            }
        } else {

                $formData=[
                    'employee_profile_id'=>$id,
                    'recorded_date'=>'',
                    'incident_date'=>'',
                    'violation_desc'=>'',
                    'officer'=>'',
                    'findings'=>'',
                    'da_taken'=>'',
                    'remarks'=>'',
                ];
 
        }

       return response()->json($formData);
    }

    public function save_draft_disciplinary(Request $request){

        $id = $request->input('employee_profile_id');
       
        if(DisciplinaryRecord::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){   
          
            $eval =DisciplinaryRecord::where('employee_profile_id','=', $id)->where('saved','=','0')->first();
            $eval->update([
                'recorded_date'=>$request->input('recorded_date'),
                'incident_date'=>$request->input('incident_date'),
                'violation_desc'=>$request->input('violation_desc'),
                'officer'=>$request->input('officer'),
                'findings'=>$request->input('findings'),
                'da_taken'=>$request->input('da_taken'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'0'
            ]);

        } else {
            $movement_id = DisciplinaryRecord::insertGetId([
                'employee_profile_id'=>$id,
                'recorded_date'=>$request->input('recorded_date'),
                'incident_date'=>$request->input('incident_date'),
                'violation_desc'=>$request->input('violation_desc'),
                'officer'=>$request->input('officer'),
                'findings'=>$request->input('findings'),
                'da_taken'=>$request->input('da_taken'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'0'
            ]);
        }

     }

     public function save_disciplinary(Request $request){

        $id = $request->input('employee_profile_id');
       
        if(DisciplinaryRecord::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){   
          
            $eval =DisciplinaryRecord::where('employee_profile_id','=', $id)->where('saved','=','0')->first();
            $eval->update([
                'recorded_date'=>$request->input('recorded_date'),
                'incident_date'=>$request->input('incident_date'),
                'violation_desc'=>$request->input('violation_desc'),
                'officer'=>$request->input('officer'),
                'findings'=>$request->input('findings'),
                'da_taken'=>$request->input('da_taken'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'1'
            ]);

        } else {
            $movement_id = DisciplinaryRecord::insertGetId([
                'employee_profile_id'=>$id,
                'recorded_date'=>$request->input('recorded_date'),
                'incident_date'=>$request->input('incident_date'),
                'violation_desc'=>$request->input('violation_desc'),
                'officer'=>$request->input('officer'),
                'findings'=>$request->input('findings'),
                'da_taken'=>$request->input('da_taken'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'1'
            ]);
        }

        return  $id;

     }
}
