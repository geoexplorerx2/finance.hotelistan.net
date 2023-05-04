<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class PaymentType extends Model
{
    use SoftDeletes;

    protected $table = 'payment_types';

    public function status()
    {
        return $this->belongsTo(PaymentRequestStatus::class, 'payment_request_status_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
