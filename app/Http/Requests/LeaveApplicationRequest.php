<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LeaveApplicationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'employee_profile_id'=>'required',
            'date_applied'=>'required',
            'start_date'=>'required|before_or_equal:end_date',
            'end_date'=>'required|after_or_equal:start_date',
            'no_of_days'=>'required|integer',
            'no_of_hours'=>'nullable',
            'leave_types_id'=>'required',
            'reason'=>'required',
        ];
    }

    public function messages() : array

    {

        return [
            'employee_profile_id.required' => 'Employee name is a required field.',
            'date_applied.required' => 'Date applied is a required field.',
            'start_date.required' => 'Start date is a required field.',
            'end_date.required' => 'End date is a required field.',
            'start_date.before:end_date' => 'Start date must be before or same with end date.',
            'end_date.after:start_date' => 'End date must be after or same with start date.',
            'no_of_days.required' => 'No. of days is a required field',
            'leave_types_id.required' => 'Type of leave is a required field.',
            'reason.required' => 'Reason is a required field.',

        ];

    }
}
