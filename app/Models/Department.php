<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use SoftDeletes;

    protected $table = 'departments';

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
