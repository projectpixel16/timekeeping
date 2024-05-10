<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EducationalBackgroundRequest extends FormRequest
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
            'primary_school'=>'required|string',
            'primary_start_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'primary_end_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'junior_school'=>'required|string',
            'junior_start_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'junior_end_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'senior_school'=>'nullable|string',
            'senior_start_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'senior_end_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'college_school'=>'nullable|string',
            'college_course'=>'nullable|string',
            'college_start_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'college_end_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'post_school'=>'nullable|string',
            'post_course'=>'nullable|string',
            'post_start_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'post_end_year'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
        ];
    }
}
