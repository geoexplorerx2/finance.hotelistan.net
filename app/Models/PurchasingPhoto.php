<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchasingPhoto extends Model
{
    use HasFactory;
    protected $table = 'purchasing_files';

    public function purchasing()
    {
        return $this->belongsTo(Purchasing::class, 'purchasing_request_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
