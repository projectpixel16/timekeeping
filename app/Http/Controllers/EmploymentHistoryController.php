<?php

namespace App\Http\Controllers;

use App\Models\EmploymentHistory;
use App\Http\Requests\EmploymentHistoryRequest;
use Illuminate\Http\Request;

class EmploymentHistoryController extends Controller
{
    public function create_employment(Request $request, $id){
     
        if(EmploymentHistory::where('employee_profile_id','=',$id)->exists()){
            $emp = EmploymentHistory::where('employee_profile_id','=',$id)->get();

            foreach($emp AS $em){
                $formData[]=[
                    'id'=>$em->id,
                    'company_name'=>$em->company_name,
                    'position'=>$em->position,
                    'start_year'=>$em->start_year,
                    'end_year'=>$em->end_year,
                    'remarks'=>$em->remarks,
                ];
            }

        } else {

                $formData=[];
        }
        return response()->json($formData);
    }

    public function save_draft_employment(Request $request){

       $id= $request->input('id');
       $employment = $request->input('employment');
       
     
        if($employment > 0){
            foreach(json_decode($employment) as $e){

          
                if(empty($e->id)){
                    EmploymentHistory::create([
                        'employee_profile_id' => $id,
                        'company_name'=>$e->company_name,
                        'position'=>$e->position,
                        'start_year'=>$e->start_year,
                        'end_year'=>$e->end_year,
                        'remarks'=>$e->remarks,
                        'saved'=>'0'
                    ]);
                } else {
                    $emp=EmploymentHistory::where('id',$e->id)->first();
                    $emp->update([
                        'company_name'=>$e->company_name,
                        'position'=>$e->position,
                        'start_year'=>$e->start_year,
                        'end_year'=>$e->end_year,
                        'remarks'=>$e->remarks,
                        'saved'=>'0'
                    ]);
                }

            }
        }
    }

    public function delete_employment($id){

        $emp=EmploymentHistory::find($id);
        $emp->delete(); 
    }

    public function save_employment(Request $request){

        $id= $request->input('id');
        $employment = $request->input('employment');
              
         if($employment > 0){
             foreach(json_decode($employment) as $e){
 
                 if(empty($e->id)){
                     EmploymentHistory::create([
                         'employee_profile_id' => $id,
                         'company_name'=>$e->company_name,
                         'position'=>$e->position,
                         'start_year'=>$e->start_year,
                         'end_year'=>$e->end_year,
                         'remarks'=>$e->remarks,
                         'saved'=>'1'
                     ]);
                 } else {
                     $emp=EmploymentHistory::where('id',$e->id)->first();
                     $emp->update([
                         'company_name'=>$e->company_name,
                         'position'=>$e->position,
                         'start_year'=>$e->start_year,
                         'end_year'=>$e->end_year,
                         'remarks'=>$e->remarks,
                         'saved'=>'1'
                     ]);
                 }
 
             }
         }

         return $id;
     }
}
