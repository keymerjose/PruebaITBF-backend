<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'direction',
        'city_id',
        'nit',
        'number_rooms'
    ];

    public function city(){
        return $this->hasOne(City::class, 'id');
    }

    public function config(){
        return $this->hasMany(HotelConf::class, 'hotel_id');
    }
}
