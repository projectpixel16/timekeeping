<?php

namespace App\Http\Controllers;
use App\Models\AppraisalsAllowances;
use App\Models\AppraisalsMovements;
use App\Models\JobProfile;
use App\Models\Benefits;
use App\Models\Allowances;
use Illuminate\Http\Request;

class AppraisalsMovementsController extends Controller
{
    public function create_appraisal_allowance(Request $request,$id){
   
        if(AppraisalsAllowances::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){
            $allowance = AppraisalsAllowances::where('employee_profile_id','=',$id)->get();
            foreach($allowance AS $a){
             
                $formData[]=[
                    'employee_profile_id'=>$id,
                    'appraisals_movement_id'=>$a->id,
                    'allowance_lists_id'=>$a->allowance_lists_id,
                    'amount'=>($a->amount) ? $a->amount : '0',
                    
                ];
                
            }
        } else {

                $formData[]=[
                    'id'=>'',
                    'employee_profile_id'=>$id,
                    'allowance_lists_id'=>'',
                    'amount'=>'',
                ];
 
        }

       return response()->json($formData);
    }

    public function create_appraisal(Request $request,$id){
   
        if(AppraisalsMovements::where('employee_profile_id','=',$id)->where('saved','=', '0')->exists()){
            $appraisal = AppraisalsMovements::where('employee_profile_id','=',$id)->where('saved','=', '0')->get();
            foreach($appraisal AS $a){
             
                $formData=[
                    'employee_profile_id'=>$id,
                    'date_prepared'=>($a->date_prepared) ? $a->date_prepared : '',
                    'business_unit_id'=>($a->business_unit_id) ? $a->business_unit_id : '',
                    'department_id'=>($a->department_id) ? $a->department_id : '',
                    'designation'=>($a->designation) ? $a->designation : '',
                    'salary'=>($a->salary) ? $a->salary : '0',
                    'employee_status_id'=>($a->employee_status_id) ? $a->employee_status_id : '',
                    'employee_progression_id'=>($a->employee_progression_id) ? $a->employee_progression_id : '',
                    'remarks'=>($a->remarks) ? $a->remarks : '',
                    
                ];
                
            }
        } else {

                $formData=[
                    'employee_profile_id'=>$id,
                    'date_prepared'=>'',
                    'business_unit_id'=>'',
                    'department_id'=>'',
                    'designation'=>'',
                    'salary'=>'',
                    'employee_status_id'=>'',
                    'employee_progression_id'=>'',
                    'remarks'=>'',
                ];
 
        }

       return response()->json($formData);
    }

    public function save_draft_appraisal(Request $request){

        $id = $request->input('employee_profile_id');
        $allowances = $request->input('allowances');
        $make_current = $request->input('make_current');
       
        if(AppraisalsMovements::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){   
            $movement_id = AppraisalsMovements::where('employee_profile_id','=', $id)->where('saved','=','0')->value('id');
            $job =AppraisalsMovements::where('employee_profile_id','=', $id)->where('saved','=','0')->first();
            $job->update([
                'employee_profile_id'=>$id,
                'date_prepared'=>$request->input('date_prepared'),
                'business_unit_id'=>$request->input('business_unit_id'),
                'department_id'=>$request->input('department_id'),
                'designation'=>$request->input('designation'),
                'salary'=>$request->input('salary'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'employee_progression_id'=>$request->input('employee_progression_id'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'0'
            ]);

        } else {
            $movement_id = AppraisalsMovements::insertGetId([
                'employee_profile_id'=>$id,
                'date_prepared'=>$request->input('date_prepared'),
                'business_unit_id'=>$request->input('business_unit_id'),
                'department_id'=>$request->input('department_id'),
                'designation'=>$request->input('designation'),
                'salary'=>$request->input('salary'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'employee_progression_id'=>$request->input('employee_progression_id'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'0'
            ]);
        }

        // if($make_current == 1){
        //     $updateJob = JobProfile::where('employee_profile_id','=',$id)->first();
        //     $updateJob->update([
        //         'department_id'=>$request->input('department_id'),
        //         'business_unit_id'=>$request->input('business_unit_id'),
        //         'employee_status_id'=>$request->input('employee_status_id'),
        //         'designation'=>$request->input('designation')
        //     ]);

        //     $updateSalary = Benefits::where('employee_profile_id','=',$id)->first();
        //     $updateSalary->update([
        //         'salary'=>$request->input('salary'),
        //     ]);
        // }

        $delete_all = AppraisalsAllowances::where('employee_profile_id', '=', $id)->where('saved','=','0');
        $delete_all->delete();

        foreach(json_decode($allowances) as $a){
            AppraisalsAllowances::create([
                'employee_profile_id' => $id,
                'appraisals_movement_id' => $movement_id,
                'allowance_lists_id'=>$a->allowance_lists_id,
                'amount'=>$a->amount,
                'saved'=>'0',
             ]);
        }

     }

     public function save_appraisal(Request $request){

        $id = $request->input('employee_profile_id');
        $allowances = $request->input('allowances');
        $make_current = $request->input('make_current');
       
        if(AppraisalsMovements::where('employee_profile_id','=',$id)->where('saved','=','0')->exists()){   
            $movement_id = AppraisalsMovements::where('employee_profile_id','=', $id)->where('saved','=','0')->value('id');
            $job =AppraisalsMovements::where('employee_profile_id','=', $id)->where('saved','=','0')->first();
            $job->update([
                'employee_profile_id'=>$id,
                'date_prepared'=>$request->input('date_prepared'),
                'business_unit_id'=>$request->input('business_unit_id'),
                'department_id'=>$request->input('department_id'),
                'designation'=>$request->input('designation'),
                'salary'=>$request->input('salary'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'employee_progression_id'=>$request->input('employee_progression_id'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'1'
            ]);

        } else {
            $movement_id = AppraisalsMovements::insertGetId([
                'employee_profile_id'=>$id,
                'date_prepared'=>$request->input('date_prepared'),
                'business_unit_id'=>$request->input('business_unit_id'),
                'department_id'=>$request->input('department_id'),
                'designation'=>$request->input('designation'),
                'salary'=>$request->input('salary'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'employee_progression_id'=>$request->input('employee_progression_id'),
                'remarks'=>$request->input('remarks'),
                'saved'=>'1'
            ]);
        }

        if($make_current == 1){
            $updateJob = JobProfile::where('employee_profile_id','=',$id)->first();
            $updateJob->update([
                'department_id'=>$request->input('department_id'),
                'business_unit_id'=>$request->input('business_unit_id'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'designation'=>$request->input('designation')
            ]);

            $updateSalary = Benefits::where('employee_profile_id','=',$id)->first();
            $updateSalary->update([
                'salary'=>$request->input('salary'),
            ]);

            foreach(json_decode($allowances) as $a){
                if(Allowances::where('employee_profile_id','=',$id)->where('allowance_list_id','=',$a->allowance_lists_id)->exists()){   
                    $update_amount = Allowances::where('employee_profile_id','=',$id)->where('allowance_list_id','=',$a->allowance_lists_id)->first();
                    $update_amount->update([
                        'amount'=>$a->amount
                    ]);
                } else{
                    Allowances::create([
                        'employee_profile_id' => $id,
                        'allowance_list_id'=>$a->allowance_lists_id,
                        'amount'=>$a->amount,
                     ]);
        
                }

            }
        }

        $delete_all = AppraisalsAllowances::where('employee_profile_id', '=', $id)->where('saved','=','0');
        $delete_all->delete();

        foreach(json_decode($allowances) as $a){
            AppraisalsAllowances::create([
                'employee_profile_id' => $id,
                'appraisals_movement_id' => $movement_id,
                'allowance_lists_id'=>$a->allowance_lists_id,
                'amount'=>$a->amount,
                'saved'=>'1',
             ]);
        }

        return $id;
     }

     public function delete_allowance($id){

        $emp=Allowances::find($id);
        $emp->delete(); 
    }

    public function check_existing_allowance($empoyee_profile_id, $allowance_id){
       

        if(Allowances::where('employee_profile_id','=',$empoyee_profile_id)->where('allowance_list_id','=',$allowance_id)->exists()){
            $exists = 1;
            $amount = Allowances::where('employee_profile_id','=',$empoyee_profile_id)->where('allowance_list_id','=',$allowance_id)->value('amount');

        }
        return response()->json([
            'exist'=>$exists,
            'amount'=>$amount
        ]);
    }
}
