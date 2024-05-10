<?php

namespace App\Http\Controllers;

use App\Models\CharacterReference;
use Illuminate\Http\Request;

class CharacterReferenceController extends Controller
{
    public function create_character(Request $request, $id){
     
        if(CharacterReference::where('employee_profile_id','=',$id)->exists()){
            $emp = CharacterReference::where('employee_profile_id','=',$id)->get();

            foreach($emp AS $em){
                $formData[]=[
                    'id'=>$em->id,
                    'fullname'=>$em->fullname,
                    'employer'=>$em->employer,
                    'position'=>$em->position,
                    'relationship'=>$em->relationship,
                    'contact_no'=>$em->contact_no,
                ];
            }

        } else {

            $formData=[];
        }
        return response()->json($formData);
    }

    public function save_draft_character(Request $request){

       $id= $request->input('id');
       $character = $request->input('character');
       
     
        if($character > 0){
            foreach(json_decode($character) as $e){

          
                if(empty($e->id)){
                    CharacterReference::create([
                        'employee_profile_id' => $id,
                        'fullname'=>$e->fullname,
                        'employer'=>$e->employer,
                        'position'=>$e->position,
                        'relationship'=>$e->relationship,
                        'contact_no'=>$e->contact_no,
                        'saved'=>'0'
                    ]);
                } else {
                    $emp=CharacterReference::where('id',$e->id)->first();
                    $emp->update([
                        'fullname'=>$e->fullname,
                        'employer'=>$e->employer,
                        'position'=>$e->position,
                        'relationship'=>$e->relationship,
                        'contact_no'=>$e->contact_no,
                        'saved'=>'0'
                    ]);
                }

            }
        }
    }

    public function delete_character($id){

        $emp=CharacterReference::find($id);
        $emp->delete(); 
    }

    public function save_character(Request $request){

        $id= $request->input('id');
        $character = $request->input('character');
              
         if($character > 0){
             foreach(json_decode($character) as $e){
 
                 if(empty($e->id)){
                    CharacterReference::create([
                        'employee_profile_id' => $id,
                        'fullname'=>$e->fullname,
                        'employer'=>$e->employer,
                        'position'=>$e->position,
                        'relationship'=>$e->relationship,
                        'contact_no'=>$e->contact_no,
                        'saved'=>'1'
                     ]);
                 } else {
                     $emp=CharacterReference::where('id',$e->id)->first();
                     $emp->update([
                        'fullname'=>$e->fullname,
                        'employer'=>$e->employer,
                        'position'=>$e->position,
                        'relationship'=>$e->relationship,
                        'contact_no'=>$e->contact_no,
                         'saved'=>'1'
                     ]);
                 }
 
             }
         }

         return $id;
     }
}
