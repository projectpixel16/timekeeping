<?php

namespace App\Http\Controllers;

use App\Models\TrainingsSeminars;
use Illuminate\Http\Request;

class TrainingsSeminarsController extends Controller
{
    public function create_training(Request $request, $id){
     
        if(TrainingsSeminars::where('employee_profile_id','=',$id)->exists()){
            $emp = TrainingsSeminars::where('employee_profile_id','=',$id)->get();

            foreach($emp AS $em){
                $formData[]=[
                    'id'=>$em->id,
                    'title'=>$em->title,
                    'venue'=>$em->venue,
                    'organizer'=>$em->organizer,
                    'training_date'=>$em->training_date,
                    'remarks'=>$em->remarks,
                ];
            }

        } else {

                $formData=[];
        }
        return response()->json($formData);
    }

    public function save_draft_training(Request $request){

       $id= $request->input('id');
       $training = $request->input('training');
       
     
        if($training > 0){
            foreach(json_decode($training) as $e){

          
                if(empty($e->id)){
                    TrainingsSeminars::create([
                        'employee_profile_id' => $id,
                        'title'=>$e->title,
                        'venue'=>$e->venue,
                        'organizer'=>$e->organizer,
                        'training_date'=>$e->training_date,
                        'remarks'=>$e->remarks,
                        'saved'=>'0'
                    ]);
                } else {
                    $emp=TrainingsSeminars::where('id',$e->id)->first();
                    $emp->update([
                        'title'=>$e->title,
                        'venue'=>$e->venue,
                        'organizer'=>$e->organizer,
                        'training_date'=>$e->training_date,
                        'remarks'=>$e->remarks,
                        'saved'=>'0'
                    ]);
                }

            }
        }
    }

    public function delete_training($id){

        $emp=TrainingsSeminars::find($id);
        $emp->delete(); 
    }

    public function save_training(Request $request){

        $id= $request->input('id');
        $training = $request->input('training');
              
         if($training > 0){
             foreach(json_decode($training) as $e){
 
                 if(empty($e->id)){
                    TrainingsSeminars::create([
                        'employee_profile_id' => $id,
                        'title'=>$e->title,
                        'venue'=>$e->venue,
                        'organizer'=>$e->organizer,
                        'training_date'=>$e->training_date,
                        'remarks'=>$e->remarks,
                         'saved'=>'1'
                     ]);
                 } else {
                     $emp=TrainingsSeminars::where('id',$e->id)->first();
                     $emp->update([
                        'title'=>$e->title,
                        'venue'=>$e->venue,
                        'organizer'=>$e->organizer,
                        'training_date'=>$e->training_date,
                        'remarks'=>$e->remarks,
                         'saved'=>'1'
                     ]);
                 }
 
             }
         }

         return $id;
     }
}
