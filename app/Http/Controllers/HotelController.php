<?php

namespace App\Http\Controllers;

use App\Models\Hotel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HotelController extends Controller
{
    public function index(){
        return response()->json([
            'error' => false,
            'data' => Hotel::with('city')->get(),
            'msg' => ''
        ]);
    }

    public function delete( Request $request, Hotel $hotel ){
        $hotel->delete();
        return response()->json([
            'error' => false,
            'data' => [],
            'msg' => 'The hotel has been removed.'
        ]);
    }

    public function store(Request $request){
        $rules = [
            'name' => ['required','string', 'min:10', 'max:100'],
            'direction' => ['required', 'string', 'min:15', 'max:200'],
            'city_id' => ['required', 'integer', 'exists:cities,id'],
            'nit' => ['required', 'string', 'unique:hotels'],
            'number_rooms' => ['required', 'integer'],
        ];
        $validator = Validator::make( $request->all(), $rules );
        if( $validator->fails() ){
            return response()->json([
                'error' => true,
                'errors' => $validator->errors()->all()
            ]);
        }

        $hotel = Hotel::create([
            'name' => $request->name,
            'direction' => $request->direction,
            'city_id' => $request->city_id,
            'nit' => $request->nit,
            'number_rooms' => $request->number_rooms
        ]);

        return response()->json([
            'error' => false,
            'data' => $hotel,
            'msg' => 'The hotel has been successfully created'
        ]);
    }

    public function show(String $id){
        return response()->json([
            'error' => false,
            'data' => Hotel::all()->find($id) ?? []
        ]);
    }
}
