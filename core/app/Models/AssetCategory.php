<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AssetCategory extends Model
{
    protected $guarded = ['id'];

    protected $casts = [
        'details' => 'object'
    ];

    public function investments()
    {
        return $this->hasMany(AssetInvestment::class);
    }

    public function deposits()
    {
        return $this->hasMany(Deposit::class);
    }
}
