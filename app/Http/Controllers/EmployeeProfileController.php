<?php

namespace App\Http\Controllers;
use App\Models\EmployeeProfile;
use App\Models\Cities;
use App\Models\Provinces;
use App\Models\EducationalBackground;
use App\Models\EmploymentHistory;
use App\Models\TrainingsSeminars;
use App\Models\CertificationsLicenses;
use App\Models\CharacterReference;
use App\Models\EmployeeFiles;
use App\Models\JobProfile;
use App\Models\Benefits;
use App\Models\Allowances;
use App\Models\AppraisalsMovements;
use App\Models\AppraisalsAllowances;
use App\Models\EvaluationHistory;
use App\Models\DisciplinaryRecord;
use App\Http\Requests\EmployeeProfileRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;



class EmployeeProfileController extends Controller
{

   
    public function create_emp_profile(Request $request,$id){
       
        if($id!='new'){
           // if(EmployeeProfile::where('user_id','=',$id)->where('saved','=','0')->exists()){

                $userdetails = EmployeeProfile::where('id','=',$id)->get();
                foreach($userdetails AS $ud){
                    $formData=[
                        
                        'firstname'=>$ud->firstname,
                        'middlename'=>$ud->middlename,
                        'lastname'=>$ud->lastname,
                        'photo'=>$ud->photo,
                        'contact_no'=>$ud->contact_no,
                        'email'=>$ud->email,
                        'permanent_street'=>$ud->permanent_street,
                        'permanent_brgy'=>$ud->permanent_brgy,
                        'permanent_city'=>$ud->permanent_city,
                        'permanent_province'=>$ud->permanent_province,
                        'same_present_address'=>$ud->same_present_address,
                        'present_street'=>$ud->present_street,
                        'present_brgy'=>$ud->present_brgy,
                        'present_city'=>$ud->present_city,
                        'present_province'=>$ud->present_province,
                        'date_of_birth'=>$ud->date_of_birth,
                        'place_of_birth'=>$ud->place_of_birth,
                        'sex'=>$ud->sex,
                        'civil_status'=>$ud->civil_status,
                        'nationality'=>$ud->nationality,
                        'religion'=>$ud->religion,
                        'emer_contact_name'=>$ud->emer_contact_name,
                        'emer_contact_no'=>$ud->emer_contact_no,
                        'emer_contact_rel'=>$ud->emer_contact_rel,
                        'emer_contact_add'=>$ud->emer_contact_add,
                        'user_id'=>$ud->user_id
                    ];
                    
                }


        } else {
            $formData=[
                
                'firstname'=>'',
                'middlename'=>'',
                'lastname'=>'',
                'photo'=>'',
                'contact_no'=>'',
                'email'=>'',
                'permanent_street'=>'',
                'permanent_brgy'=>'',
                'permanent_city'=>'',
                'permanent_province'=>'',
                'same_present_address'=>'',
                'present_street'=>'',
                'present_brgy'=>'',
                'present_city'=>'',
                'present_province'=>'',
                'date_of_birth'=>'',
                'place_of_birth'=>'',
                'sex'=>'',
                'civil_status'=>'',
                'nationality'=>'',
                'religion'=>'',
                'emer_contact_name'=>'',
                'emer_contact_no'=>'',
                'emer_contact_rel'=>'',
                'emer_contact_add'=>'',
                'user_id'=>$id
            ];
        }
        return response()->json($formData);
    }


    public function save_employee_profile(EmployeeProfileRequest $request){

        $id = $request->input('id');
        if($request->input('same_present_address') == 1){
            $present_province = 0;
            $present_city=0;
            $present_brgy="";
            $present_street="";
        } else {
            $present_province = $request->input('present_province');
            $present_city=$request->input('present_city');
            $present_brgy=$request->input('present_brgy');
            $present_street=$request->input('present_street');
        }

        // if($request->input('permanent_province') == ''){
        //     $permanent_province = 0;
        // } else {
        //     $permanent_province = $request->input('permanent_province');
        // }

        if($id == 'new'){
          
    
            if($request->file('photo')){
                $imagename=time().'_'.$request->file('photo')->getClientOriginalName();
                $request->file('photo')->storeAs('images',$imagename);
                //$validated['photo']=$imagename;
            } else {
                $imagename='';
            }

            $personal_id = EmployeeProfile::insertGetId([
                            'firstname'=>$request->input('firstname'),
                            'middlename'=>($request->input('middlename')) ? $request->input('middlename') : '',
                            'lastname'=>$request->input('lastname'),
                            'photo'=>$imagename,
                            'email'=>$request->input('email'),
                            'contact_no'=>$request->input('contact_no'),
                            'permanent_street'=>($request->input('permanent_street')) ? $request->input('permanent_street') : '',
                            'permanent_brgy'=>($request->input('permanent_brgy')) ? $request->input('permanent_brgy') : '',
                            'permanent_city'=>($request->input('permanent_city')) ? $request->input('permanent_city') : '0',
                            'permanent_province'=>($request->input('permanent_province')) ? $request->input('permanent_province') : '0',
                            'same_present_address'=>$request->input('same_present_address'),
                            'present_street'=>($present_street) ? $present_street : '',
                            'present_brgy'=>($present_brgy) ? $present_brgy : '',
                            'present_city'=>($present_city) ? $present_city : '0',
                            'present_province'=>($present_province) ? $present_province : '0',
                            'date_of_birth'=>$request->input('date_of_birth'),
                            'place_of_birth'=>($request->input('place_of_birth')) ? $request->input('place_of_birth') : '',
                            'sex'=>($request->input('sex')) ? $request->input('sex') : '',
                            'civil_status'=>($request->input('civil_status')) ? $request->input('civil_status') : '',
                            'nationality'=>($request->input('nationality')) ? $request->input('nationality') : '',
                            'religion'=>($request->input('religion')) ? $request->input('religion') : '',
                            'emer_contact_name'=>($request->input('emer_contact_name')) ? $request->input('emer_contact_name') : '',
                            'emer_contact_no'=>($request->input('emer_contact_no')) ? $request->input('emer_contact_no') : '',
                            'emer_contact_rel'=>($request->input('emer_contact_rel')) ? $request->input('emer_contact_rel') : '',
                            'emer_contact_add'=>($request->input('emer_contact_add')) ? $request->input('emer_contact_add') : '',
                            'user_id'=>$request->input('user_id'),
                        ]);
                    
            
                return $personal_id;
        } else {

           

            if($request->file('photo')){

                $exist_photo = EmployeeProfile::where('id','=',$id)->value('photo');
                $image_path =  public_path().'/images/'.$exist_photo;

                if(!empty($exist_photo) || $exist_photo != ''){
                    unlink($image_path);
                }

                $imagename=time().'_'.$request->file('photo')->getClientOriginalName();
                $request->file('photo')->storeAs('images',$imagename, 'public');
                //$validated['photo']=$imagename;
            } else {
                $imagename = EmployeeProfile::where('id','=',$id)->value('photo');
            }

            $update =EmployeeProfile::where('id','=', $id)->first();
            $update->update([
                            'firstname'=>$request->input('firstname'),
                            'middlename'=>($request->input('middlename')) ? $request->input('middlename') : '',
                            'lastname'=>$request->input('lastname'),
                            'photo'=>$imagename,
                            'email'=>$request->input('email'),
                            'contact_no'=>($request->input('contact_no')) ? $request->input('contact_no') : '',
                            'permanent_street'=>($request->input('permanent_street')) ? $request->input('permanent_street') : '',
                            'permanent_brgy'=>($request->input('permanent_brgy')) ? $request->input('permanent_brgy') : '',
                            'permanent_city'=>($request->input('permanent_city')) ? $request->input('permanent_city') : '0',
                            'permanent_province'=>($request->input('permanent_province')) ? $request->input('permanent_province') : '0',
                            'same_present_address'=>$request->input('same_present_address'),
                            'present_street'=>($present_street) ? $present_street : '',
                            'present_brgy'=>($present_brgy) ? $present_brgy : '',
                            'present_city'=>($present_city) ? $present_city : '0',
                            'present_province'=>($present_province) ? $present_province : '0',
                            'date_of_birth'=>$request->input('date_of_birth'),
                            'place_of_birth'=>($request->input('place_of_birth')) ? $request->input('place_of_birth') : '',
                            'sex'=>($request->input('sex')) ? $request->input('sex') : '',
                            'civil_status'=>($request->input('civil_status')) ? $request->input('civil_status') : '',
                            'nationality'=>($request->input('nationality')) ? $request->input('nationality') : '',
                            'religion'=>($request->input('religion')) ? $request->input('religion') : '',
                            'emer_contact_name'=>($request->input('emer_contact_name')) ? $request->input('emer_contact_name') : '',
                            'emer_contact_no'=>($request->input('emer_contact_no')) ? $request->input('emer_contact_no') : '',
                            'emer_contact_rel'=>($request->input('emer_contact_rel')) ? $request->input('emer_contact_rel') : '',
                            'emer_contact_add'=>($request->input('emer_contact_add')) ? $request->input('emer_contact_add') : '',
                            'user_id'=>$request->input('user_id'),
                        ]);
                    
            
            return $id;
        }
       
    }

    public function get_preview_details($id){
        $employees=EmployeeProfile::where('id','=',$id)->get();

        foreach($employees AS  $e){

            $employeeData = [
                'employee_profile_id'=>$e->employee_profile_id,
                'firstname'=>$e->firstname,
                'middlename'=>$e->middlename,
                'lastname'=>$e->lastname,
                'email'=>$e->email,
                'contact_no'=>$e->contact_no,
                'photo'=>$e->photo,
                'permanent_street'=>$e->permanent_street,
                'permanent_brgy'=>$e->permanent_brgy,
                'permanent_city'=>Cities::where('id','=',$e->permanent_city)->value('city_name'),
                'permanent_province'=>Provinces::where('id','=',$e->permanent_province)->value('province_name'),
                'same_present_address'=>$e->same_present_address,
                'present_street'=>$e->present_street,
                'present_brgy'=>$e->present_brgy,
                'present_city'=>Cities::where('id','=',$e->present_city)->value('city_name'),
                'present_province'=>Provinces::where('id','=',$e->present_province)->value('province_name'),
                'date_of_birth'=>$e->date_of_birth,
                'place_of_birth'=>$e->place_of_birth,
                'sex'=>$e->sex,
                'civil_status'=>$e->civil_status,
                'nationality'=>$e->nationality,
                'religion'=>$e->religion,
                'emer_contact_name'=>$e->emer_contact_name,
                'emer_contact_no'=>$e->emer_contact_no,
                'emer_contact_rel'=>$e->emer_contact_rel,
                'emer_contact_add'=>$e->emer_contact_add,
                'employee_status_id'=>$e->employee_status_id
            ];
        }

        if(EducationalBackground::where('employee_profile_id','=',$id)->exists()){
         $education=EducationalBackground::where('employee_profile_id','=',$id)->get();
        } else {
            $education =[];
        }
        $employment=EmploymentHistory::where('employee_profile_id','=',$id)->get();
        $trainings=TrainingsSeminars::where('employee_profile_id','=',$id)->get();
        $certifications=CertificationsLicenses::where('employee_profile_id','=',$id)->get();
        $references=CharacterReference::where('employee_profile_id','=',$id)->get();
        $attachments=EmployeeFiles::where('employee_profile_id','=',$id)->get();

        $jobprofile=JobProfile::with(['supervisor','department','business_unit','employee_status'])
                    ->where('employee_profile_id','=',$id)
                    ->where('saved', '1')->get();

        $benefits=Benefits::where('employee_profile_id','=',$id)->where('saved', '1')->get();
        $allowances=Allowances::with('allowance_list')->where('employee_profile_id','=',$id)->get();
        $evaluation=EvaluationHistory::with('evaluation_type')->where('employee_profile_id','=',$id)->where('saved', '1')->get();

        if(AppraisalsMovements::with(['department','business_unit','employee_status','employee_progression'])
        ->where('employee_profile_id','=',$id)->where('saved', '1')
        ->orderBy('date_prepared','DESC')->exists()){

        $appraisalsmovements=AppraisalsMovements::with(['department','business_unit','employee_status','employee_progression'])
                            ->where('employee_profile_id','=',$id)->where('saved', '1')
                            ->orderBy('date_prepared','DESC')->get();

            foreach($appraisalsmovements AS $app){

                $app_allowances = AppraisalsAllowances::with('allowance_list')->where('appraisals_movement_id',$app->id)->where('saved','1')->get();
                $appraisals[] = [
                    'date_prepared'=>$app->date_prepared,
                    'business_unit'=>$app->business_unit->bu_name,
                    'department'=>$app->department->department_name,
                    'designation'=>$app->designation,
                    'salary'=>$app->salary,
                    'employee_status'=>$app->employee_status->description,
                    'employee_progression'=>$app->employee_progression->description,
                    'remarks'=>$app->remarks,
                    'allowances'=>$app_allowances
                ];
            }
        } else {
            $appraisals =[];
        }
        
        $disciplinary=DisciplinaryRecord::where('employee_profile_id','=',$id)->where('saved', '1')->get();

        return response()->json([
            'employeedata'=>$employeeData,
            'educationdata'=>$education,
            'employmentdata'=>$employment,
            'trainingdata'=>$trainings,
            'certificationdata'=>$certifications,
            'referencedata'=>$references,
            'attachments'=>$attachments,
            'jobprofile'=>$jobprofile,
            'benefits'=>$benefits,
            'allowances'=>$allowances,
            'evaluation'=>$evaluation,
            'appraisals'=>$appraisals,
            'disciplinary'=>$disciplinary,
        ]);
    }

    public function save_profile(Request $request){

        $status=$request->get('employee_status_id');
        $profile_id=$request->get('employee_profile_id');

        $emp=EmployeeProfile::where('id',$profile_id)->first();
        $validated=$this->validate($request,[
            'employee_status_id'=>['required']
        ]);

        $emp->update($validated);
    }

    public function all_saved_employees(){
        $employees=EmployeeProfile::where('saved','=','1')->orderBy('lastname','ASC')->get();
        return response()->json($employees);
    }

    public function get_active_employee(){
        
        $query=EmployeeProfile::query();

        $query->whereHas('job_profile', function ($query) {
            $query->where('active','=','1')->where('saved','=','1');
        });
       
        return $query->get();
       
    }

    
    public function get_employee_details($id){
        
        $userdetails = EmployeeProfile::where('id','=',$id)->get();
        foreach($userdetails AS $ud){
            $formData=[
                
                'firstname'=>$ud->firstname,
                'middlename'=>$ud->middlename,
                'lastname'=>$ud->lastname,
                'photo'=>$ud->photo,
            ];
        }

        return $formData;
       
    }


}
