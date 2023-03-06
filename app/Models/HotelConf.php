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

    public function config(){
        return $this->belongsTo(HotelConf::class, 'hotel_id');
    }

    public function accommodation(){
        return $this->belongsTo(Accommodation::class, 'accommodation_id');
    }

    public function types_room(){
        return $this->belongsTo(RoomType::class, 'room_types_id');
    }
}
