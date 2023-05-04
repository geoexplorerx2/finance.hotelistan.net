<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Bills extends Model
{
    use SoftDeletes;

    protected $table = 'bills';

    public function companies()
    {
        return $this->belongsTo(Companies::class, 'company_id');
    }

    public function user()
    {
      return $this->belongsTo(User::class, 'user_id');
    }
}
