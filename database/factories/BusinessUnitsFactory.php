<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BusinessUnits>
 */
class BusinessUnitsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'bu_name' => fake()->name(),
            'contact_no' => fake()->phoneNumber(),
            'address' => fake()->address(),
        ];
    }
}
