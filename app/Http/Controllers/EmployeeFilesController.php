<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\EmployeeFiles;

class EmployeeFilesController extends Controller
{
    public function create_files(Request $request,$id){

        if($id){
            $files = EmployeeFiles::where('employee_profile_id','=',$id)->get();
            return response()->json($files);
        }
    }

    public function save_attachments(Request $request){

        $id= $request->input('id');
        $attachments = $request->file('attachment');
        $description = json_decode($request->input('filedescription'));
        
        $x=0;
        foreach($attachments AS $at){
           $filename = time()."_".$id."_".$at->getClientOriginalName();
            $at->storeAs('files',$filename);

         //echo $filename . " " . $description[$x]->file_description;

            EmployeeFiles::create([
                'employee_profile_id' => $id,
                'filename'=>$filename,
                'file_description'=>$description[$x]->file_description,
            ]);

          $x++;
        }
      
        
    }

    public function delete_file($id){

        $filename = EmployeeFiles::where('id','=',$id)->value('filename');
        $fileToDelete = 'files/'. $filename;
        unlink($fileToDelete);
        $emp=EmployeeFiles::find($id);
        $emp->delete(); 
    }
}
