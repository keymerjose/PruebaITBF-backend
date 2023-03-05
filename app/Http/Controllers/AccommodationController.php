<?php

namespace App\Http\Controllers;

use App\Models\Accommodation;
use Illuminate\Http\Request;

class AccommodationController extends Controller
{
    public function index(){
        return response()->json([
            'errors' => false,
            'data' => Accommodation::get()
        ]);
    }
}
