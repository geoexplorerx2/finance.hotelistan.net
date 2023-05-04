<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class CreditCards extends Model
{
    use SoftDeletes;

    protected $table = 'credit_cards';

    public function user()
    {
      return $this->belongsTo(User::class, 'user_id');
    }

}
