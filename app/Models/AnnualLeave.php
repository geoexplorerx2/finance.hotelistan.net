<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AnnualLeave extends Model
{
    use HasFactory;
    protected $table = 'annual_leaves';

    public function personnelCard()
    {
        return $this->belongsTo(PersonnelCard::class, 'personnel_id');
    }

    public function annualLeaveType()
    {
        return $this->belongsTo(AnnualLeaveType::class, 'annual_leave_type_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
