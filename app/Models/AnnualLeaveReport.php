<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AnnualLeaveReport extends Model
{
    use HasFactory;
    protected $table = 'annual_leave_reports';

    public function annualLeave()
    {
        return $this->belongsTo(AnnualLeave::class, 'annual_leave_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
