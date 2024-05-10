<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmployeeProfileRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     * 
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
            'firstname'=>'required|string',
            'middlename'=>'nullable|string',
            'lastname'=>'required|string',
            'email'=>'required|email|unique:employee_profiles,email,'.$this->id,
            'contact_no'=>'required|string',
            'permanent_street'=>'nullable|string',
            'permanent_brgy'=>'nullable|string',
            'permanent_city'=>'nullable',
            'permanent_province'=>'nullable',
            'same_present_address'=>'nullable|integer',
            'present_street'=>'nullable|string',
            'present_brgy'=>'nullable|string',
            'present_city'=>'nullable',
            'present_province'=>'nullable',
            'date_of_birth'=>'required|date',
            'place_of_birth'=>'nullable|string',
            'sex'=>'nullable|string',
            'civil_status'=>'nullable|string',
            'nationality'=>'nullable|string',
            'religion'=>'nullable|string',
            'emer_contact_name'=>'nullable|string',
            'emer_contact_no'=>'nullable|string',
            'emer_contact_rel'=>'nullable|string',
            'emer_contact_add'=>'nullable|string',
            'user_id'=>'required'
        ];
    }
}
