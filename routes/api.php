<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ListController;
use App\Http\Controllers\DepartmentsController;
use App\Http\Controllers\BusinessUnitsController;
use App\Http\Controllers\HolidayTypesController;
use App\Http\Controllers\LeaveTypesController;
use App\Http\Controllers\WorkSchedulesController;
use App\Http\Controllers\AllowanceListController;
use App\Http\Controllers\EmployeeProgressionController;
use App\Http\Controllers\BusinessCalendarController;
use App\Http\Controllers\EmployeeStatusController;
use App\Http\Controllers\EmployeeProfileController;
use App\Http\Controllers\EmploymentHistoryController;
use App\Http\Controllers\EducationalBackgroundController;
use App\Http\Controllers\TrainingsSeminarsController;
use App\Http\Controllers\CertificationsLicensesController;
use App\Http\Controllers\CharacterReferenceController;
use App\Http\Controllers\JobProfileController;
use App\Http\Controllers\AppraisalsMovementsController;
use App\Http\Controllers\EvaluationTypeController;
use App\Http\Controllers\BenefitsController;
use App\Http\Controllers\EvaluationHistoryController;
use App\Http\Controllers\DisciplinaryRecordController;
use App\Http\Controllers\EmployeeFilesController;
use App\Http\Controllers\SchedulingHeadController;
use App\Http\Controllers\TimekeepingController;
use App\Http\Controllers\LeaveApplicationController;
use App\Http\Controllers\ReportsController;
/*
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('/login_process', [AuthController::class,'login_process']);
Route::get('/logout', [AuthController::class,'logout']);
Route::get('/dashboard', [AuthController::class,'dashboard']);


Route::get('/get_all_department',[ListController::class,'all_department']);
Route::get('/get_all_business',[ListController::class,'all_businessunits']);
Route::get('/get_all_holidaytypes',[ListController::class,'all_holidaytypes']);
Route::get('/get_all_leavetypes',[ListController::class,'all_leavetypes']);
Route::get('/get_all_workschedule',[ListController::class,'all_workschedule']);
Route::get('/get_all_allowances',[ListController::class,'all_allowances']);
Route::get('/get_all_progression',[ListController::class,'all_progression']);
Route::get('/get_all_empstatus',[ListController::class,'all_empstatus']);
Route::get('/get_all_calendar',[ListController::class,'all_calendar']);
Route::get('/get_all_holidays',[ListController::class,'all_holidays']);
Route::get('/get_all_holiday_type',[ListController::class,'all_holiday_type']);
Route::get('/get_all_provinces',[ListController::class,'all_provinces']);
Route::get('/get_all_cities/{id}',[ListController::class,'all_cities']);
Route::get('/check_drafts/{id}',[ListController::class,'check_drafts']);
Route::get('/check_job_drafts/{id}',[ListController::class,'check_job_drafts']);
Route::get('/get_all_evaluation',[ListController::class,'all_evaluation']);
Route::get('/get_all_schedule',[ListController::class,'all_schedule']);
Route::get('/get_dashboard_info',[ListController::class,'get_dashboard_info']);
Route::post('/add_reminders',[ListController::class,'add_reminders']);
Route::get('/done_reminders/{id}',[ListController::class,'done_reminders']);


Route::get('/all_department',[DepartmentsController::class,'all_department']);
Route::get('/create_department',[DepartmentsController::class,'create_department']);
Route::post('/add_department',[DepartmentsController::class,'add_department']);
Route::get('/edit_department/{id}',[DepartmentsController::class,'edit_department']);
Route::post('/update_department/{id}',[DepartmentsController::class,'update_department']);
Route::get('/search_department',[DepartmentsController::class,'search_department']);

Route::get('/all_businessunits',[BusinessUnitsController::class,'all_businessunits']);
Route::get('/create_business',[BusinessUnitsController::class,'create_business']);
Route::post('/add_business',[BusinessUnitsController::class,'add_business']);
Route::get('/search_business',[BusinessUnitsController::class,'search_business']);
Route::get('/edit_business/{id}',[BusinessUnitsController::class,'edit_business']);
Route::post('/update_business/{id}',[BusinessUnitsController::class,'update_business']);

Route::get('/all_holiday_types',[HolidayTypesController::class,'all_holiday_types']);
Route::get('/create_holidaytype',[HolidayTypesController::class,'create_holidaytype']);
Route::post('/add_holidaytype',[HolidayTypesController::class,'add_holidaytype']);
Route::get('/search_holidaytypes',[HolidayTypesController::class,'search_holidaytypes']);
Route::get('/edit_holidaytype/{id}',[HolidayTypesController::class,'edit_holidaytype']);
Route::post('/update_holidaytype/{id}',[HolidayTypesController::class,'update_holidaytype']);

Route::get('/all_leave_types',[LeaveTypesController::class,'all_leave_types']);
Route::get('/create_leavetype',[LeaveTypesController::class,'create_leavetype']);
Route::post('/add_leavetype',[LeaveTypesController::class,'add_leavetype']);
Route::get('/search_leavetypes',[LeaveTypesController::class,'search_leavetypes']);
Route::get('/edit_leavetype/{id}',[LeaveTypesController::class,'edit_leavetype']);
Route::post('/update_leavetype/{id}',[LeaveTypesController::class,'update_leavetype']);

Route::get('/all_schedule',[WorkSchedulesController::class,'all_schedule']);
Route::get('/create_workschedule',[WorkSchedulesController::class,'create_workschedule']);
Route::post('/add_workschedule',[WorkSchedulesController::class,'add_workschedule']);
Route::get('/search_workschedule',[WorkSchedulesController::class,'search_workschedule']);
Route::get('/edit_workschedule/{id}',[WorkSchedulesController::class,'edit_workschedule']);
Route::post('/update_workschedule/{id}',[WorkSchedulesController::class,'update_workschedule']);

Route::get('/all_allowances',[AllowanceListController::class,'all_allowances']);
Route::get('/create_allowance',[AllowanceListController::class,'create_allowance']);
Route::post('/add_allowance',[AllowanceListController::class,'add_allowance']);
Route::get('/edit_allowance/{id}',[AllowanceListController::class,'edit_allowance']);
Route::post('/update_allowance/{id}',[AllowanceListController::class,'update_allowance']);
Route::get('/search_allowance',[AllowanceListController::class,'search_allowance']);

Route::get('/all_evaluation',[EvaluationTypeController::class,'all_evaluation']);
Route::get('/create_evaluation',[EvaluationTypeController::class,'create_evaluation']);
Route::post('/add_evaluation',[EvaluationTypeController::class,'add_evaluation']);
Route::get('/edit_evaluation/{id}',[EvaluationTypeController::class,'edit_evaluation']);
Route::post('/update_evaluation/{id}',[EvaluationTypeController::class,'update_evaluation']);
Route::get('/search_evaluation',[EvaluationTypeController::class,'search_evaluation']);

Route::get('/all_progression',[EmployeeProgressionController::class,'all_progression']);
Route::get('/create_progression',[EmployeeProgressionController::class,'create_progression']);
Route::post('/add_progression',[EmployeeProgressionController::class,'add_progression']);
Route::get('/search_progression',[EmployeeProgressionController::class,'search_progression']);
Route::get('/edit_progression/{id}',[EmployeeProgressionController::class,'edit_progression']);
Route::post('/update_progression/{id}',[EmployeeProgressionController::class,'update_progression']);

Route::get('/all_empstatus',[EmployeeStatusController::class,'all_empstatus']);
Route::get('/create_empstatus',[EmployeeStatusController::class,'create_empstatus']);
Route::post('/add_empstatus',[EmployeeStatusController::class,'add_empstatus']);
Route::get('/search_empstatus',[EmployeeStatusController::class,'search_empstatus']);
Route::get('/edit_empstatus/{id}',[EmployeeStatusController::class,'edit_empstatus']);
Route::post('/update_empstatus/{id}',[EmployeeStatusController::class,'update_empstatus']);

Route::get('/create_calendar',[BusinessCalendarController::class,'create_calendar']);
Route::get('/create_holiday',[BusinessCalendarController::class,'create_holiday']);
Route::post('/add_calendar',[BusinessCalendarController::class,'add_calendar']);
Route::get('/edit_calendar/{id}',[BusinessCalendarController::class,'edit_calendar']);
Route::post('/update_calendar/{id}',[BusinessCalendarController::class,'update_calendar']);
Route::get('/delete_holiday/{id}', [BusinessCalendarController::class,'delete_holiday']);
Route::get('/view_calendar/{id}',[BusinessCalendarController::class,'view_calendar']);


Route::get('/create_emp_profile/{id}',[EmployeeProfileController::class,'create_emp_profile']);
//Route::post('/add_emp_profile_draft',[EmployeeProfileController::class,'add_emp_profile_draft']);
Route::post('/save_employee_profile',[EmployeeProfileController::class,'save_employee_profile']);
Route::get('/get_preview_details/{id}',[EmployeeProfileController::class,'get_preview_details']);
Route::post('/saveprofile',[EmployeeProfileController::class,'save_profile']);
Route::get('/get_saved_employees',[EmployeeProfileController::class,'all_saved_employees']);
Route::get('/get_active_employee',[EmployeeProfileController::class,'get_active_employee']);
Route::get('/get_employee_details/{id}',[EmployeeProfileController::class,'get_employee_details']);

Route::get('/create_educ_profile/{id}',[EducationalBackgroundController::class,'create_educ_profile']);
Route::post('/save_draft',[EducationalBackgroundController::class,'save_draft']);
Route::post('/save_educ_profile',[EducationalBackgroundController::class,'save_educ_profile']);

Route::get('/create_employment/{id}',[EmploymentHistoryController::class,'create_employment']);
Route::post('/save_draft_employment',[EmploymentHistoryController::class,'save_draft_employment']);
Route::get('/delete_employment/{id}',[EmploymentHistoryController::class,'delete_employment']);
Route::post('/save_employment',[EmploymentHistoryController::class,'save_employment']);


Route::get('/create_training/{id}',[TrainingsSeminarsController::class,'create_training']);
Route::post('/save_draft_training',[TrainingsSeminarsController::class,'save_draft_training']);
Route::get('/delete_training/{id}',[TrainingsSeminarsController::class,'delete_training']);
Route::post('/save_training',[TrainingsSeminarsController::class,'save_training']);

Route::get('/create_certification/{id}',[CertificationsLicensesController::class,'create_certification']);
Route::post('/save_draft_certification',[CertificationsLicensesController::class,'save_draft_certification']);
Route::get('/delete_certification/{id}',[CertificationsLicensesController::class,'delete_certification']);
Route::post('/save_certification',[CertificationsLicensesController::class,'save_certification']);

Route::get('/create_character/{id}',[CharacterReferenceController::class,'create_character']);
Route::post('/save_draft_character',[CharacterReferenceController::class,'save_draft_character']);
Route::get('/delete_character/{id}',[CharacterReferenceController::class,'delete_character']);
Route::post('/save_character',[CharacterReferenceController::class,'save_character']);

Route::get('/get_employees_job_profile',[JobProfileController::class,'employees_job_profile']);
Route::get('/create_job_profile/{id}',[JobProfileController::class,'create_job_profile']);
Route::get('/get_profile/{id}',[JobProfileController::class,'get_profile']);
Route::post('/save_draft_job',[JobProfileController::class,'save_draft_job']);
Route::post('/save_job',[JobProfileController::class,'save_job']);
Route::get('/search_job_profile',[JobProfileController::class,'search_job_profile']);

Route::get('/create_allowance/{id}',[BenefitsController::class,'create_allowance']);
Route::get('/create_benefits/{id}',[BenefitsController::class,'create_benefits']);
Route::post('/save_draft_benefit',[BenefitsController::class,'save_draft_benefit']);
Route::post('/save_benefit',[BenefitsController::class,'save_benefit']);
Route::get('/delete_allowance/{id}',[BenefitsController::class,'delete_allowance']);

Route::get('/create_appraisal/{id}',[AppraisalsMovementsController::class,'create_appraisal']);
Route::get('/create_appraisal_allowance/{id}',[AppraisalsMovementsController::class,'create_appraisal_allowance']);
Route::post('/save_draft_appraisal',[AppraisalsMovementsController::class,'save_draft_appraisal']);
Route::post('/save_appraisal',[AppraisalsMovementsController::class,'save_appraisal']);
Route::get('/check_existing_allowance/{profile_id}/{allowance_id}',[AppraisalsMovementsController::class,'check_existing_allowance']);

Route::get('/create_evaluation/{id}',[EvaluationHistoryController::class,'create_evaluation']);
Route::post('/save_draft_evaluation',[EvaluationHistoryController::class,'save_draft_evaluation']);
Route::post('/save_evaluation',[EvaluationHistoryController::class,'save_evaluation']);

Route::get('/create_disciplinary/{id}',[DisciplinaryRecordController::class,'create_disciplinary']);
Route::post('/save_draft_disciplinary',[DisciplinaryRecordController::class,'save_draft_disciplinary']);
Route::post('/save_disciplinary',[DisciplinaryRecordController::class,'save_disciplinary']);

Route::get('/create_files/{id}',[EmployeeFilesController::class,'create_files']);
Route::post('/save_attachments',[EmployeeFilesController::class,'save_attachments']);
Route::get('/delete_file/{id}', [EmployeeFilesController::class,'delete_file']);

Route::get('/create_schedulehead',[SchedulingHeadController::class,'create_schedulehead']);
Route::get('/create_scheduledetails',[SchedulingHeadController::class,'create_scheduledetails']);
Route::get('/search_schedule',[SchedulingHeadController::class,'search_schedule']);
Route::post('/save_draft_scheduling',[SchedulingHeadController::class,'save_draft_scheduling']);
Route::post('/save_scheduling',[SchedulingHeadController::class,'save_scheduling']);
Route::get('/get_schedulehead/{id}',[SchedulingHeadController::class,'get_schedulehead']);
Route::get('/delete_schedule_employee/{id}', [SchedulingHeadController::class,'delete_schedule_employee']);

Route::get('/get_daily_hours/{from}/{to}/{employee}', [TimekeepingController::class,'get_daily_hours']);
Route::get('/get_timesheet/{from}/{to}', [TimekeepingController::class,'get_timesheet']);
Route::get('/get_employee_time/{id}/{date}', [TimekeepingController::class,'get_employee_time']);
Route::post('/save_missing_time',[TimekeepingController::class,'save_missing_time']);

Route::get('/get_leave_application/{id}', [LeaveApplicationController::class,'get_leave_application']);
Route::post('/save_leave_application',[LeaveApplicationController::class,'save_leave_application']);
Route::get('/get_all_leave', [LeaveApplicationController::class,'get_all_leave']);
Route::get('/get_leave_details/{id}', [LeaveApplicationController::class,'get_leave_details']);
Route::post('/cancel_leave/{id}', [LeaveApplicationController::class,'cancel_leave']);
Route::post('/update_leave_application', [LeaveApplicationController::class,'update_leave_application']);
Route::get('/search_leave', [LeaveApplicationController::class,'search_leave']);

Route::get('/all_employees',[ReportsController::class,'all_employees']);
Route::get('/search_employees',[ReportsController::class,'search_employees']);
Route::get('/get_emp_profile/{id}', [ReportsController::class,'get_emp_profile']);
Route::get('/get_time/{id}/{from}/{to}', [ReportsController::class,'get_time']);