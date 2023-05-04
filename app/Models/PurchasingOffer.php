<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchasingOffer extends Model
{
    use HasFactory;
    protected $table = 'purchasing_offers';

    public function request()
    {
      return $this->belongsTo(PurchasingRequest::class, 'purchasing_id');
    }

    public function user()
    {
      return $this->belongsTo(User::class, 'user_id');
    }
}
