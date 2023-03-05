<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomType extends Model
{
    use HasFactory;

    public function config(){
        return $this->hasMany(HotelConf::class, 'room_types_id');
    }
}
