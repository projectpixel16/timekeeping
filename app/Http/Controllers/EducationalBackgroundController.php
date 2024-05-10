<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\EducationalBackgroundRequest;
use App\Models\EducationalBackground;

class EducationalBackgroundController extends Controller
{
    public function create_educ_profile(Request $request,$id){
   
        if(EducationalBackground::where('employee_profile_id','=',$id)->exists()){
            $educdetails = EducationalBackground::where('employee_profile_id','=',$id)->get();
            foreach($educdetails AS $ed){

             
                $formData=[
                    'employee_profile_id'=>$id,
                    'primary_school'=>$ed->primary_school,
                    'primary_start_year'=>$ed->primary_start_year,
                    'primary_end_year'=>($ed->primary_end_year) ? $ed->primary_end_year : '',
                    'junior_school'=>($ed->junior_school) ? $ed->junior_school : '',
                    'junior_start_year'=>($ed->junior_start_year) ? $ed->junior_start_year : '',
                    'junior_end_year'=>($ed->junior_start_year) ? $ed->junior_start_year : '',
                    'senior_school'=>($ed->senior_school) ? $ed->senior_school : '',
                    'senior_start_year'=>($ed->senior_start_year) ? $ed->senior_start_year : '',
                    'senior_end_year'=>($ed->senior_end_year) ? $ed->senior_end_year : '',
                    'college_school'=>($ed->college_school) ? $ed->college_school : '',
                    'college_course'=>($ed->college_course) ? $ed->college_course : '',
                    'college_start_year'=>($ed->college_start_year) ? $ed->college_start_year : '',
                    'college_end_year'=>($ed->college_end_year) ? $ed->college_end_year : '',
                    'post_school'=>($ed->post_school) ? $ed->post_school : '',
                    'post_course'=>($ed->post_course) ? $ed->post_course : '',
                    'post_start_year'=>($ed->post_start_year) ? $ed->post_start_year : '',
                    'post_end_year'=>($ed->post_end_year) ? $ed->post_end_year : '',
                ];
                
            }
        } else {
          
                $formData=[
                    'employee_profile_id'=>$id,
                    'primary_school'=>'',
                    'primary_start_year'=>'',
                    'primary_end_year'=>'',
                    'junior_school'=>'',
                    'junior_start_year'=>'',
                    'junior_end_year'=>'',
                    'senior_school'=>'',
                    'senior_start_year'=>'',
                    'senior_end_year'=>'',
                    'college_school'=>'',
                    'college_course'=>'',
                    'college_start_year'=>'',
                    'college_end_year'=>'',
                    'post_school'=>'',
                    'post_course'=>'',
                    'post_start_year'=>'',
                    'post_end_year'=>'',
                ];
                
            

        }

       return response()->json($formData);
    }

    public function save_draft(EducationalBackgroundRequest $request){

        $id = $request->input('employee_profile_id');
       

        if(EducationalBackground::where('employee_profile_id','=',$id)->exists()){
            // $validated=$this->validate($request,[
            //     'primary_school'=>['required','string'],
            //     'primary_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'primary_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'junior_school'=>['required','string'],
            //     'junior_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'junior_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'senior_school'=>['nullable','string'],
            //     'senior_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'senior_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'college_school'=>['nullable','string'],
            //     'college_course'=>['nullable','string'],
            //     'college_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'college_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'post_school'=>['nullable','string'],
            //     'post_course'=>['nullable','string'],
            //     'post_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'post_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            // ]);
            $education =EducationalBackground::where('employee_profile_id','=', $id)->first();
            $education->update([
                'primary_school'=>$request->input('primary_school'),
                'primary_start_year'=>$request->input('primary_start_year'),
                'primary_end_year'=>$request->input('primary_end_year'),
                'junior_school'=>$request->input('junior_school'),
                'junior_start_year'=>$request->input('junior_start_year'),
                'junior_end_year'=>$request->input('junior_end_year'),
                'senior_school'=>$request->input('senior_school'),
                'senior_start_year'=>$request->input('senior_start_year'),
                'senior_end_year'=>$request->input('senior_end_year'),
                'college_school'=>$request->input('college_school'),
                'college_course'=>$request->input('college_course'),
                'college_start_year'=>$request->input('college_start_year'),
                'college_end_year'=>$request->input('college_end_year'),
                'post_school'=>$request->input('post_school'),
                'post_course'=>$request->input('post_course'),
                'post_start_year'=>$request->input('post_start_year'),
                'post_end_year'=>$request->input('post_end_year'),
                'saved'=>'0'
            ]);

        } else {
            // $validated=$this->validate($request,[
            //     'employee_profile_id'=>['required','integer'],
            //     'primary_school'=>['required','string'],
            //     'primary_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'primary_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'junior_school'=>['required','string'],
            //     'junior_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'junior_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'senior_school'=>['nullable','string'],
            //     'senior_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'senior_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'college_school'=>['nullable','string'],
            //     'college_course'=>['nullable','string'],
            //     'college_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'college_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'post_school'=>['nullable','string'],
            //     'post_course'=>['nullable','string'],
            //     'post_start_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            //     'post_end_year'=>['nullable','digits:4','integer','min:1900','max:'.date('Y')],
            // ]);
          
            EducationalBackground::create($validated);
        }
    }

    public function save_educ_profile(EducationalBackgroundRequest $request){

        $id = $request->input('employee_profile_id');
       
        if(EducationalBackground::where('employee_profile_id','=',$id)->exists()){
           
            $education =EducationalBackground::where('employee_profile_id','=', $id)->first();
            $education->update([
                'primary_school'=>$request->input('primary_school'),
                'primary_start_year'=>$request->input('primary_start_year'),
                'primary_end_year'=>$request->input('primary_end_year'),
                'junior_school'=>$request->input('junior_school'),
                'junior_start_year'=>$request->input('junior_start_year'),
                'junior_end_year'=>$request->input('junior_end_year'),
                'senior_school'=>$request->input('senior_school'),
                'senior_start_year'=>$request->input('senior_start_year'),
                'senior_end_year'=>$request->input('senior_end_year'),
                'college_school'=>$request->input('college_school'),
                'college_course'=>$request->input('college_course'),
                'college_start_year'=>$request->input('college_start_year'),
                'college_end_year'=>$request->input('college_end_year'),
                'post_school'=>$request->input('post_school'),
                'post_course'=>$request->input('post_course'),
                'post_start_year'=>$request->input('post_start_year'),
                'post_end_year'=>$request->input('post_end_year'),
                'saved'=>'1'
            ]);

        } else {
          
            EducationalBackground::create([
                'employee_profile_id'=>$request->input('employee_profile_id'),
                'primary_school'=>$request->input('primary_school'),
                'primary_start_year'=>$request->input('primary_start_year'),
                'primary_end_year'=>$request->input('primary_end_year'),
                'junior_school'=>$request->input('junior_school'),
                'junior_start_year'=>$request->input('junior_start_year'),
                'junior_end_year'=>$request->input('junior_end_year'),
                'senior_school'=>$request->input('senior_school'),
                'senior_start_year'=>$request->input('senior_start_year'),
                'senior_end_year'=>$request->input('senior_end_year'),
                'college_school'=>$request->input('college_school'),
                'college_course'=>$request->input('college_course'),
                'college_start_year'=>$request->input('college_start_year'),
                'college_end_year'=>$request->input('college_end_year'),
                'post_school'=>$request->input('post_school'),
                'post_course'=>$request->input('post_course'),
                'post_start_year'=>$request->input('post_start_year'),
                'post_end_year'=>$request->input('post_end_year'),
                'saved'=>'1'
            ]);
        }

        return $id;
    }
}
