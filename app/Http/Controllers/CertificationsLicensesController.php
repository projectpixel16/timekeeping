<?php

namespace App\Http\Controllers;

use App\Models\CertificationsLicenses;
use Illuminate\Http\Request;

class CertificationsLicensesController extends Controller
{
    public function create_certification(Request $request, $id){
     
        if(CertificationsLicenses::where('employee_profile_id','=',$id)->exists()){
            $emp = CertificationsLicenses::where('employee_profile_id','=',$id)->get();

            foreach($emp AS $em){
                $formData[]=[
                    'id'=>$em->id,
                    'certification_name'=>$em->certification_name,
                    'issuing_org'=>$em->issuing_org,
                    'date_taken'=>$em->date_taken,
                    'expiration_date'=>$em->expiration_date,
                    'remarks'=>$em->remarks,
                ];
            }

        } else {

            $formData=[];
        }
        return response()->json($formData);
    }

    public function save_draft_certification(Request $request){

       $id= $request->input('id');
       $certification = $request->input('certification');
       
     
        if($certification > 0){
            foreach(json_decode($certification) as $e){

          
                if(empty($e->id)){
                    CertificationsLicenses::create([
                        'employee_profile_id' => $id,
                        'certification_name'=>$e->certification_name,
                        'issuing_org'=>$e->issuing_org,
                        'date_taken'=>$e->date_taken,
                        'expiration_date'=>$e->expiration_date,
                        'remarks'=>$e->remarks,
                        'saved'=>'0'
                    ]);
                } else {
                    $emp=CertificationsLicenses::where('id',$e->id)->first();
                    $emp->update([
                        'certification_name'=>$e->certification_name,
                        'issuing_org'=>$e->issuing_org,
                        'date_taken'=>$e->date_taken,
                        'expiration_date'=>$e->expiration_date,
                        'remarks'=>$e->remarks,
                        'saved'=>'0'
                    ]);
                }

            }
        }
    }

    public function delete_certification($id){

        $emp=CertificationsLicenses::find($id);
        $emp->delete(); 
    }

    public function save_certification(Request $request){

        $id= $request->input('id');
        $certification = $request->input('certification');
              
         if($certification > 0){
             foreach(json_decode($certification) as $e){
 
                 if(empty($e->id)){
                    CertificationsLicenses::create([
                        'employee_profile_id' => $id,
                        'certification_name'=>$e->certification_name,
                        'issuing_org'=>$e->issuing_org,
                        'date_taken'=>$e->date_taken,
                        'expiration_date'=>$e->expiration_date,
                        'remarks'=>$e->remarks,
                        'saved'=>'1'
                     ]);
                 } else {
                     $emp=CertificationsLicenses::where('id',$e->id)->first();
                     $emp->update([
                        'certification_name'=>$e->certification_name,
                        'issuing_org'=>$e->issuing_org,
                        'date_taken'=>$e->date_taken,
                        'expiration_date'=>$e->expiration_date,
                        'remarks'=>$e->remarks,
                         'saved'=>'1'
                     ]);
                 }
 
             }
         }

         return $id;
     }
}
