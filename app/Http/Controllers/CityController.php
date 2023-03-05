<?php

namespace App\Http\Controllers;

use App\Models\City;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function index(){
        return response()->json([
            'cities' => City::all()
        ]);
        
    }
}
