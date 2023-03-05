<?php

namespace App\Http\Controllers;

use App\Models\RoomType;
use Illuminate\Http\Request;

class RoomTypeController extends Controller
{
    public function index(){
        return response()->json([
            'errors' => false,
            'data' => RoomType::get()
        ]);
    }
}
