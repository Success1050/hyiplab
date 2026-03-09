<?php

namespace Database\Seeders;

use App\Models\AssetCategory;
use Illuminate\Database\Seeder;

class AssetCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $assets = [
            [
                'name'  => 'Real Estate',
                'slug'  => 'real-estate',
                'icon'  => 'la-building',
                'color' => 'emerald',
            ],
            [
                'name'  => 'Oil & Gas',
                'slug'  => 'oil-gas',
                'icon'  => 'la-oil-can',
                'color' => 'amber',
            ],
            [
                'name'  => 'Investment Banking',
                'slug'  => 'investment-banking',
                'icon'  => 'la-university',
                'color' => 'indigo',
            ],
            [
                'name'  => 'Stocks',
                'slug'  => 'stocks',
                'icon'  => 'la-chart-line',
                'color' => 'rose',
            ]
        ];

        foreach ($assets as $asset) {
            AssetCategory::updateOrCreate(['slug' => $asset['slug']], $asset);
        }
    }
}
