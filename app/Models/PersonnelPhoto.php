<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersonnelPhoto extends Model
{
    use HasFactory;
    protected $table = 'personnel_photos';

    public function personnelCard()
    {
        return $this->belongsTo(PersonnelCard::class, 'personnel_card_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
