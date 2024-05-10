<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmploymentHistoryRequest extends FormRequest
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
            'company_name.*'=>'nullable|string',
            'position.*'=>'nullable|string',
            'start_year.*'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'end_year.*'=>'nullable|digits:4|integer|min:1900|max:'.date('Y'),
            'remarks.*'=>'nullable|string',

        ];
    }
}
