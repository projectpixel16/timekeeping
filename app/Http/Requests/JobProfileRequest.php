<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class JobProfileRequest extends FormRequest
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
            'designation'=>'required',
            'employee_number'=>'required',
            'department_id'=>'required',
            'business_unit_id'=>'nullable',
            'date_hired'=>'nullable',
            'regularization_date'=>'nullable',
            'employee_status_id'=>'required',
            'active'=>'nullable',
            'saved'=>'nullable',
        ];
    }

    public function messages(): array

    {

        return [
            'designation.required' => 'Designation is a required field.',
            'employee_number.required' => 'Employee number is a required field',
            'department_id.required' => 'Department is a required field',
            'employee_status_id.required' => 'Employee status is a required field'

        ];

    }
}
