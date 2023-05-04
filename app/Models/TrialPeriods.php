<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TrialPeriods extends Model
{
    use HasFactory;
    protected $table = 'trial_period';

    public function personnelCard()
    {
        return $this->belongsTo(PersonnelCard::class, 'personnel_card_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
