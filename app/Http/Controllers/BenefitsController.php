<?php

namespace App\Http\Controllers;

use App\Models\EmployeeProfile;
use App\Models\Benefits;
use App\Models\Allowances;
use Illuminate\Http\Request;

class BenefitsController extends Controller
{
    public function create_allowance(Request $request,$id){
   
        if(Allowances::where('employee_profile_id','=',$id)->exists()){
            $allowance = Allowances::where('employee_profile_id','=',$id)->get();
            foreach($allowance AS $a){
             
                $formData[]=[
                    'employee_profile_id'=>$id,
                    'id'=>$a->id,
                    'allowance_list_id'=>$a->allowance_list_id,
                    'amount'=>($a->amount) ? $a->amount : '0',
                    
                ];
                
            }
        } else {

                $formData[]=[
                    'id'=>'',
                    'employee_profile_id'=>$id,
                    'allowance_list_id'=>'',
                    'amount'=>'',
                ];
 
        }

       return response()->json($formData);
    }

    public function create_benefits(Request $request,$id){
   
        if(Benefits::where('employee_profile_id','=',$id)->exists()){
            $benefits = Benefits::where('employee_profile_id','=',$id)->get();
            foreach($benefits AS $b){
             
                $formData=[
                    'employee_profile_id'=>$id,
                    'sss'=>($b->sss) ? $b->sss : '',
                    'tin'=>($b->tin) ? $b->tin : '',
                    'pagibig'=>($b->pagibig) ? $b->pagibig : '',
                    'philhealth'=>($b->philhealth) ? $b->philhealth : '',
                    'salary'=>($b->salary) ? $b->salary : '0',
                    
                ];
                
            }
        } else {

         
                $formData=[
                    'employee_profile_id'=>$id,
                    'sss'=>'',
                    'tin'=>'',
                    'pagibig'=>'',
                    'philhealth'=>'',
                    'salary'=>''
                ];
 
        }

       return response()->json($formData);
    }

    public function save_draft_benefit(Request $request){

        $id = $request->input('employee_profile_id');
        $allowances = $request->input('allowance');
       
        if(Benefits::where('employee_profile_id','=',$id)->exists()){   
            $job =Benefits::where('employee_profile_id','=', $id)->first();
            $job->update([
                'sss'=>$request->input('sss'),
                'tin'=>$request->input('tin'),
                'pagibig'=>$request->input('pagibig'),
                'philhealth'=>$request->input('philhealth'),
                'salary'=>$request->input('salary'),
                'saved'=>'0'
            ]);

        } else {
            Benefits::create([
                'employee_profile_id'=>$id,
                'sss'=>$request->input('sss'),
                'tin'=>$request->input('tin'),
                'pagibig'=>$request->input('pagibig'),
                'philhealth'=>$request->input('philhealth'),
                'salary'=>$request->input('salary'),
                'saved'=>'0'
            ]);
        }

        $delete_all = Allowances::where('employee_profile_id', '=', $id);
        $delete_all->delete();

        foreach(json_decode($allowances) as $a){
            Allowances::create([
                'employee_profile_id' => $id,
                'allowance_list_id'=>$a->allowance_list_id,
                'amount'=>$a->amount,
             ]);
        }

     }

     public function save_benefit(Request $request){

        $id = $request->input('employee_profile_id');
        $allowances = $request->input('allowance');
       
        if(Benefits::where('employee_profile_id','=',$id)->exists()){   
            $job =Benefits::where('employee_profile_id','=', $id)->first();
            $job->update([
                'sss'=>$request->input('sss'),
                'tin'=>$request->input('tin'),
                'pagibig'=>$request->input('pagibig'),
                'philhealth'=>$request->input('philhealth'),
                'salary'=>$request->input('salary'),
                'saved'=>'1'
            ]);

        } else {
            Benefits::create([
                'employee_profile_id'=>$id,
                'sss'=>$request->input('sss'),
                'tin'=>$request->input('tin'),
                'pagibig'=>$request->input('pagibig'),
                'philhealth'=>$request->input('philhealth'),
                'salary'=>$request->input('salary'),
                'saved'=>'1'
            ]);
        }

        $delete_all = Allowances::where('employee_profile_id', '=', $id);
        $delete_all->delete();

        foreach(json_decode($allowances) as $a){
            Allowances::create([
                'employee_profile_id' => $id,
                'allowance_list_id'=>$a->allowance_list_id,
                'amount'=>$a->amount,
             ]);
        }
        return $id;
     }

     public function delete_allowance($id){

        $emp=Allowances::find($id);
        $emp->delete(); 
    }
}
