<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SchedulingHeadRequest extends FormRequest
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
            'work_schedules_id'=>'required|integer',
            'start_date'=>'required|before:end_date',
            'end_date'=>'required|after:start_date',
            'minimum_hours'=>'required|integer',
        ];
    }

    public function messages() 

    {

        return [
            'work_schedules_id.required' => 'Schedule code is a required field.',
            'start_date.required' => 'Start date is a required field',
            'end_date.required' => 'End date is a required field',
            'minimum_hours.required' => 'Minimum hours is a required field',
            'minimum_hours.integer' => 'Minimum hours must be a number.'

        ];

    }

}
