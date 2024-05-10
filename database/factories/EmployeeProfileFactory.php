<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class EmployeeProfileFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'firstname'=>fake()->firstname(),
            'middlename'=>fake()->lastname(),
            'lastname'=>fake()->lastname(),
            'email'=>fake()->unique()->safeEmail(),
            'contact_no'=>fake()->phoneNumber(),
           
        ];
    }
}
