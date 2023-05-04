<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class PersonnelCard extends Model
{
    use SoftDeletes;

    protected $table = 'personnel_cards';

    public function photos()
    {
        return $this->hasMany(PersonnelPhoto::class);
    }

    public function user()
    {
      return $this->belongsTo(User::class, 'user_id');
    }
}
