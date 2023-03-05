<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HotelConf extends Model
{
    use HasFactory;
    protected $fillable = [
        'accommodation_id',
        'room_types_id',
        'hotel_id',
        'amount'
    ];

    public function accommodation(){
        return $this->belongsToMany(Accommodation::class, 'id');
    }
}
