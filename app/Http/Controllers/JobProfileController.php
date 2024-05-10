<?php

namespace App\Http\Controllers;

use App\Models\EmployeeProfile;
use App\Models\JobProfile;
use App\Models\Benefits;
use App\Models\AppraisalsMovements;
use App\Models\EvaluationHistory;
use App\Models\DisciplinaryRecord;
use App\Models\Departments;
use App\Models\BusinessUnits;
use App\Models\EmployeeStatus;
use App\Http\Requests\JobProfileRequest;
use Illuminate\Http\Request;

class JobProfileController extends Controller
{
    public function employees_job_profile(){

        // $filter=$request->get('filter');
        // if($filter!=null){
        //     $employees=EmployeeProfile::where('firstname','LIKE',"%$filter%")
        //                               ->orWhere('lastname','LIKE',"%$filter%")
        //                               ->orderBy('lastname','ASC')->paginate(10);
        // }else{
        //     $employees = EmployeeProfile::where('firstname','!=','')->orderBy('lastname','ASC')->paginate(10);
        // }

        $employees=EmployeeProfile::where('firstname','!=','')->orderBy('lastname','ASC')->get();
        

        foreach($employees as $e){

            if(JobProfile::where('employee_profile_id','=',$e->id)->count() > 0){
                if(JobProfile::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $job_profile = 'Completed';
                } else {
                    $job_profile = 'Draft';
                }
            } else {
                $job_profile = 'No Information';
            }

            if(Benefits::where('employee_profile_id','=',$e->id)->count() > 0){
                if(Benefits::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $benefits = 'Completed';
                } else {
                    $benefits = 'Draft';
                }
            } else {
                $benefits = 'No Information';
            }

            if(AppraisalsMovements::where('employee_profile_id','=',$e->id)->count() > 0){
                if(AppraisalsMovements::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $appraisals = 'Completed';
                } else {
                    $appraisals = 'Draft';
                }
            } else {
                $appraisals = 'No Information';
            }

            if(EvaluationHistory::where('employee_profile_id','=',$e->id)->count() > 0){
                if(EvaluationHistory::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $evaluation = 'Completed';
                } else {
                    $evaluation = 'Draft';
                }
            } else {
                $evaluation = 'No Information';
            }

            if(DisciplinaryRecord::where('employee_profile_id','=',$e->id)->count() > 0){
                if(DisciplinaryRecord::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $disciplinary = 'Completed';
                } else {
                    $disciplinary = 'Draft';
                }
            } else {
                $disciplinary = 'No Information';
            }

            $formData[]=[
                'employee_profile_id'=>$e->id,
                'employee_name'=>$e->lastname. ', ' . $e->firstname,
                'job_profile'=>$job_profile,
                'benefits'=>$benefits,
                'appraisals'=>$appraisals,
                'evaluation'=>$evaluation,
                'disciplinary'=>$disciplinary
            ];
        }
        return response()->json($formData);
    }

    public function search_job_profile(Request $request){

        $filter=$request->get('filter');
        if($filter!=null){
            $employees=EmployeeProfile::where('firstname','LIKE',"%$filter%")
                                      ->orWhere('lastname','LIKE',"%$filter%")
                                      ->orderBy('lastname','ASC')->get();
        }else{
            $employees = EmployeeProfile::where('firstname','!=','')->orderBy('lastname','ASC')->get();
        }

        //$employees=EmployeeProfile::where('firstname','!=','')->orderBy('lastname','ASC')->get();
        

        foreach($employees as $e){

            if(JobProfile::where('employee_profile_id','=',$e->id)->count() > 0){
                if(JobProfile::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $job_profile = 'Completed';
                } else {
                    $job_profile = 'Draft';
                }
            } else {
                $job_profile = 'No Information';
            }

            if(Benefits::where('employee_profile_id','=',$e->id)->count() > 0){
                if(Benefits::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $benefits = 'Completed';
                } else {
                    $benefits = 'Draft';
                }
            } else {
                $benefits = 'No Information';
            }

            if(AppraisalsMovements::where('employee_profile_id','=',$e->id)->count() > 0){
                if(AppraisalsMovements::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $appraisals = 'Completed';
                } else {
                    $appraisals = 'Draft';
                }
            } else {
                $appraisals = 'No Information';
            }

            if(EvaluationHistory::where('employee_profile_id','=',$e->id)->count() > 0){
                if(EvaluationHistory::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $evaluation = 'Completed';
                } else {
                    $evaluation = 'Draft';
                }
            } else {
                $evaluation = 'No Information';
            }

            if(DisciplinaryRecord::where('employee_profile_id','=',$e->id)->count() > 0){
                if(DisciplinaryRecord::where('employee_profile_id','=',$e->id)->where('saved','=','1')->count() > 0){
                    $disciplinary = 'Completed';
                } else {
                    $disciplinary = 'Draft';
                }
            } else {
                $disciplinary = 'No Information';
            }

            $formData[]=[
                'employee_profile_id'=>$e->id,
                'employee_name'=>$e->lastname. ', ' . $e->firstname,
                'job_profile'=>$job_profile,
                'benefits'=>$benefits,
                'appraisals'=>$appraisals,
                'evaluation'=>$evaluation,
                'disciplinary'=>$disciplinary
            ];
        }
        return response()->json($formData);
    }


    public function create_job_profile(Request $request,$id){
   
        if(JobProfile::where('employee_profile_id','=',$id)->exists()){
            $jobs = JobProfile::where('employee_profile_id','=',$id)->get();
            foreach($jobs AS $j){

             
                $formData=[
                    'employee_profile_id'=>$id,
                    'employee_number'=>($j->employee_number) ? $j->employee_number : '',
                    'supervisor_id'=>($j->supervisor_id) ? $j->supervisor_id : '0',
                    'designation'=>($j->designation) ? $j->designation : '',
                    'department_id'=>($j->department_id) ? $j->department_id : '0',
                    'business_unit_id'=>($j->business_unit_id) ? $j->business_unit_id : '0',
                    'date_hired'=>($j->date_hired) ? $j->date_hired : '',
                    'regularization_date'=>($j->regularization_date) ? $j->regularization_date : '',
                    'termination_date'=>($j->termination_date) ? $j->termination_date : '',
                    'employee_status_id'=>($j->employee_status_id) ? $j->employee_status_id : '0',
                    'active'=>($j->active) ? $j->active : '0',
                    
                ];
                
            }
        } else {

            $emp_status = EmployeeProfile::where('id','=',$id)->value('employee_status_id');
          
                $formData=[
                    'employee_profile_id'=>$id,
                    'employee_number'=>'',
                    'supervisor_id'=>'',
                    'designation'=>'',
                    'department_id'=>'',
                    'business_unit_id'=>'',
                    'date_hired'=>'',
                    'regularization_date'=>'',
                    'termination_date'=>'',
                    'employee_status_id'=>$emp_status,
                    'active'=>'',
                ];
                
        }

       return response()->json($formData);
    }

   
    public function get_profile($id){
        $employees=EmployeeProfile::where('id','=',$id)->get();

        foreach($employees AS  $e){
            $formData = [
                'employee_profile_id'=>$e->employee_profile_id,
                'firstname'=>$e->firstname,
                'middlename'=>$e->middlename,
                'lastname'=>$e->lastname,
                'email'=>$e->email,
                'contact_no'=>$e->contact_no,
                'photo'=>$e->photo,

            ];
        }
        return response()->json($formData);
    }

    public function save_draft_job(Request $request){

        $id = $request->input('employee_profile_id');
      
    
        if(JobProfile::where('employee_profile_id','=',$id)->exists()){   
            $job =JobProfile::where('employee_profile_id','=', $id)->first();
            $job->update([
                'designation'=>$request->input('designation'),
                'employee_number'=>$request->input('employee_number'),
                'supervisor_id'=>$request->input('supervisor_id'),
                'department_id'=>$request->input('department_id'),
                'business_unit_id'=>($request->input('business_unit_id') != '') ? $request->input('business_unit_id') : '0',
                'date_hired'=>$request->input('date_hired'),
                'regularization_date'=>$request->input('regularization_date'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'active'=>$request->input('active'),
                'saved'=>'0'
            ]);

        } else {
            JobProfile::create([
                'employee_profile_id'=>$id,
                'designation'=>$request->input('designation'),
                'employee_number'=>$request->input('employee_number'),
                'supervisor_id'=>$request->input('supervisor_id'),
                'department_id'=>$request->input('department_id'),
                'business_unit_id'=>($request->input('business_unit_id') != '') ? $request->input('business_unit_id') : '0',
                'date_hired'=>$request->input('date_hired'),
                'regularization_date'=>$request->input('regularization_date'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'active'=>$request->input('active'),
                'saved'=>'0'
            ]);
        }

        $emp =EmployeeProfile::where('id','=', $id)->first();
            $emp->update([
                'employee_status_id'=>$request->input('employee_status_id')
            ]);
     }

     public function save_job(JobProfileRequest $request){

        $id = $request->input('employee_profile_id');
       
        if(JobProfile::where('employee_profile_id','=',$id)->exists()){   


            $job =JobProfile::where('employee_profile_id','=', $id)->first();
           
            $job->update([
                'designation'=>$request->input('designation'),
                'employee_number'=>$request->input('employee_number'),
                'supervisor_id'=>$request->input('supervisor_id'),
                'department_id'=>$request->input('department_id'),
                'business_unit_id'=>($request->input('business_unit_id') != '') ? $request->input('business_unit_id') : '0',
                'date_hired'=>$request->input('date_hired'),
                'regularization_date'=>$request->input('regularization_date'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'active'=>$request->input('active'),
                'saved'=>'1'
            ]);

        } else {
            JobProfile::create([
                'employee_profile_id'=>$id,
                'designation'=>$request->input('designation'),
                'employee_number'=>$request->input('employee_number'),
                'supervisor_id'=>$request->input('supervisor_id'),
                'department_id'=>$request->input('department_id'),
                'business_unit_id'=>($request->input('business_unit_id') != '') ? $request->input('business_unit_id') : '0',
                'date_hired'=>$request->input('date_hired'),
                'regularization_date'=>$request->input('regularization_date'),
                'employee_status_id'=>$request->input('employee_status_id'),
                'active'=>$request->input('active'),
                'saved'=>'1'
            ]);
        }

        $emp =EmployeeProfile::where('id','=', $id)->first();
            $emp->update([
                'employee_status_id'=>$request->input('employee_status_id')
            ]);

        return $id;
     }
}
