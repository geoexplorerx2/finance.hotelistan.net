<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PasswordReset extends Model
{
    protected $table = 'password_resets';
    protected $primaryKey = 'email';
    public $timestamps = false;
    
    protected $fillable = ['email', 'token'];

    public function save(array $options = [])
    {
        $this->created_at = date("Y-m-d H:i:s");
        return parent::save($options);
    }
}
