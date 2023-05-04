<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PurchasingRequest extends Model
{
    use SoftDeletes;
    protected $table = 'purchasing_requests';

    public function suppliers()
    {
        return $this->belongsTo(Suppliers::class, 'supplier_id');
    }

    public function status()
    {
        return $this->belongsTo(PurchasingRequestStatus::class, 'purchasing_request_status_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
