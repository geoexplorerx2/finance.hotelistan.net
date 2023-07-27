<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class PaymentRequest extends Model
{
    use SoftDeletes;

    protected $table = 'payment_requests';

    protected $fillable = [
        'payment_request_status_id',
        'answer_note',
        'answered_user_id',
        'post_time'
    ];

    public function paidCompanies()
    {
        return $this->belongsTo(Companies::class, 'paid_company_id');
    }
    public function payCompanies()
    {
        return $this->belongsTo(Companies::class, 'pay_company_id');
    }

    public function status()
    {
        return $this->belongsTo(PaymentRequestStatus::class, 'payment_request_status_id');
    }
    public function category()
    {
        return $this->belongsTo(PaymentRequestCategory::class, 'payment_request_category_id');
    }

    public function files()
    {
        return $this->hasMany(PaymentRequestFile::class);
    }

    public function paymentType()
    {
        return $this->belongsTo(PaymentType::class, 'payment_type_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
