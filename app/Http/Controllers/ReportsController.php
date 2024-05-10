<?php

namespace App\Http\Controllers;
use App\Models\EmployeeProfile;
use App\Models\EmployeeStatus;
use App\Models\Cities;
use App\Models\Provinces;
use App\Models\EducationalBackground;
use App\Models\EmploymentHistory;
use App\Models\TrainingsSeminars;
use App\Models\CertificationsLicenses;
use App\Models\CharacterReference;
use App\Models\JobProfile;
use App\Models\Benefits;
use App\Models\Allowances;
use App\Models\AppraisalsMovements;
use App\Models\AppraisalsAllowances;
use App\Models\EvaluationHistory;
use App\Models\DisciplinaryRecord;
use App\Models\LeaveApplication;
use App\Models\LeaveTypes;
use App\Models\Timekeeping;
use App\Models\EmployeeFiles;
use Illuminate\Http\Request;
use DateTime;
use DateInterval;
use DatePeriod;

class ReportsController extends Controller
{
    public function all_employees(Request $request){
        $filter=$request->get('filter');
        if($filter!=null){
            $employees=EmployeeProfile::with('employee_status')->where('saved','=','1')->orderBy('lastname','ASC')->paginate(10);
            
        }else{
            $employees = EmployeeProfile::with('employee_status')->where('saved','=','1')->orderBy('lastname','ASC')->paginate(10);
          
        }
        return response()->json($employees);
    }

    public function search_employees(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $emp=EmployeeProfile::with('employee_status')
                ->where('lastname','LIKE',"%$filter%")
                ->orWhere('firstname','LIKE',"%$filter%")
                ->orWhere('middlename','LIKE',"%$filter%");

                $emp->orWhereHas('employee_status', function ($emp) use ($filter){
                    $emp->where('description','LIKE',"%$filter%");
                });
               $employees= $emp->orderBy('lastname','ASC')->paginate(10);
           
        }else{
            $employees = EmployeeProfile::with('employee_status')->orderBy('lastname','ASC')->paginate(10);
        }

        return response()->json($employees);
    }

    public function get_emp_profile($id){
        $employees=EmployeeProfile::with('employee_status')->where('id','=',$id)->get();
        $appraisals = [];
      
      
        foreach($employees AS  $e){
            $profile = [
                'employee_profile_id'=>$e->employee_profile_id,
                'firstname'=>$e->firstname,
                'middlename'=>$e->middlename,
                'lastname'=>$e->lastname,
                'email'=>$e->email,
                'contact_no'=>$e->contact_no,
                'photo'=>$e->photo,
                'permanent_street'=>$e->permanent_street,
                'permanent_brgy'=>$e->permanent_brgy,
                'permanent_city'=>Cities::where("id", $e->permanent_city)->value('city_name'),
                'permanent_province'=>Provinces::where("id", $e->permanent_province)->value('province_name'),
                'same_present_address'=>$e->same_present_address,
                'present_street'=>$e->present_street,
                'present_brgy'=>$e->present_brgy,
                'present_city'=>Cities::where("id", $e->present_city)->value('city_name'),
                'present_province'=>Provinces::where("id", $e->present_province)->value('province_name'),
                'date_of_birth'=>$e->date_of_birth,
                'place_of_birth'=>$e->place_of_birth,
                'sex'=>$e->sex,
                'civil_status'=>$e->civil_status,
                'nationality'=>$e->nationality,
                'religion'=>$e->religion,
                'emer_contact_name'=>$e->emer_contact_name,
                'emer_contact_rel'=>$e->emer_contact_rel,
                'emer_contact_no'=>$e->emer_contact_no,
                'emer_contact_add'=>$e->emer_contact_add,
                'employee_status'=>$e->employee_status->description
            ];
        }

        $education=EducationalBackground::where('employee_profile_id','=',$id)->where('saved', '1')->get();
     
        $employment=EmploymentHistory::where('employee_profile_id','=',$id)->where('saved', '1')->get();
        $trainings=TrainingsSeminars::where('employee_profile_id','=',$id)->where('saved', '1')->get();
        $certifications=CertificationsLicenses::where('employee_profile_id','=',$id)->where('saved', '1')->get();
        $references=CharacterReference::where('employee_profile_id','=',$id)->where('saved', '1')->get();
        $files=EmployeeFiles::where('employee_profile_id','=',$id)->get();
        $jobprofile=JobProfile::with(['supervisor','department','business_unit','employee_status'])
                    ->where('employee_profile_id','=',$id)
                    ->where('saved', '1')->get();
        $benefits=Benefits::where('employee_profile_id','=',$id)->where('saved', '1')->get();
        $allowances=Allowances::with('allowance_list')->where('employee_profile_id','=',$id)->get();
        $evaluation=EvaluationHistory::with('evaluation_type')->where('employee_profile_id','=',$id)->where('saved', '1')->get();
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
        
        $disciplinary=DisciplinaryRecord::where('employee_profile_id','=',$id)->where('saved', '1')->get();
        $leaves=LeaveApplication::with('leave_types')->where('employee_profile_id','=',$id)->orderBy('start_date','DESC')->get();

        $leavelist=LeaveTypes::all();
        foreach($leavelist AS $ll){

            $leave_taken = LeaveApplication::where('employee_profile_id','=',$id)->where('leave_types_id','=',$ll->id)->where('cancelled','=','0')->count();
            $rem_leave = $ll->leave_days - $leave_taken;
            $leavetypes[] = [
                'id'=>$ll->id,
                'leave_name'=>$ll->leave_name,
                'total_leave'=>$ll->leave_days,
                'leave_taken'=>$leave_taken,
                'rem_leave'=>$rem_leave
            ];
        }
        $timesheet=Timekeeping::where('employee_profile_id','=',$id)->orderBy('recorded_time', 'DESC')->get();
        return response()->json([
            'profile'=>$profile,
            'education'=>$education,
            'employment'=>$employment,
            'training'=>$trainings,
            'certification'=>$certifications,
            'reference'=>$references,
            'jobprofile'=>$jobprofile,
            'benefits'=>$benefits,
            'allowances'=>$allowances,
            'evaluation'=>$evaluation,
            'appraisals'=>$appraisals,
            'disciplinary'=>$disciplinary,
            'leaves'=>$leaves,
            'leavetypes'=>$leavetypes,
            'timesheet'=>$timesheet,
            'files'=>$files
        ],200);

        //return response()->json($formData);
    }

    public function get_time($id, $from, $to){
        $data=array();
        $begin = new DateTime($from);
        $end = new DateTime($to);

        $interval = DateInterval::createFromDateString('1 day');
        $period = new DatePeriod($begin, $interval, $end);

        foreach ($period as $dt) {
            $date= $dt->format("Y-m-d");
            $day= date('D', strtotime($date));

            $count_time = Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $id)->count();
                
            if($count_time%2==0 && $count_time != 0){
                $first_hour = date_create(Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $id)->min('recorded_time'));
                $last_hour = date_create(Timekeeping::where('recorded_time', 'LIKE', '%'.$date.'%')->where('employee_profile_id', '=', $id)->max('recorded_time'));
                if(!empty($first_hour) && !empty($last_hour)){
                    $interval = date_diff($first_hour,$last_hour);
                    $rendered = $interval->format('%h:%i');
                } 
            } else if($count_time == 0){
                $rendered ='No data';
            }else {
                $rendered ='Incomplete';
            }

            $time=Timekeeping::selectRaw('DATE_FORMAT(recorded_time, "%H:%i:%s") as dtr')->where("employee_profile_id", $id)
            ->where("recorded_time","LIKE","%".$date."%")
            ->orderBy("recorded_time", "ASC")
            ->get();
            $data[]=[
                "date"=>$date.', ' .$day,
                "time"=>$time,
                "total_hours"=>$rendered
            ];
        }

        return $data;
    }

}
