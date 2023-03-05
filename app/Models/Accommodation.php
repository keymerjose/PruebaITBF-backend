<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Accommodation extends Model
{
    use HasFactory;

    public function config(){
        return $this->hasMany(HotelConf::class, 'accommodation_id');
    }
}
