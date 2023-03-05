<?php

namespace App\Http\Controllers;

use App\Models\Hotel;
use App\Models\HotelConf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HotelConfController extends Controller
{
    public function show( String $hotel_id ){
        return response()->json([
            'error' => false,
            'data' => HotelConf::where('hotel_id', $hotel_id)->get() ?? []
        ]);
    }

    public function store( Request $request, Hotel $hotel ){
        $rules = [
            '*.accommodation_id' => ['required', 'integer', 'exists:accommodations,id'],
            '*.room_types_id' => ['required', 'integer', 'exists:room_types,id'],
            '*.hotel_id' => ['required', 'integer', 'exists:hotels,id'],
            '*.amount' => ['required', 'integer']
        ];
        $validator = Validator::make( $request->all(), $rules );
        if( $validator->fails() ){
            return response()->json([
                'error' => true,
                'errors' => $validator->errors()->all()
            ]);
        }

        $totalAmount = 0;
        foreach( $request->all() as $key ){
            if( $key['room_types_id'] == 1 ){
                if( !in_array($key['accommodation_id'], [1, 2]) ){
                    return response()->json([
                        'error' => true,
                        'errors' => '',
                        'msg' => 'For the standard room the accommodation must be Single or Double.'
                    ]);
                }
            }else if( $key['room_types_id'] == 2 ){
                if( !in_array($key['accommodation_id'], [3, 4]) ){
                    return response()->json([
                        'error' => true,
                        'errors' => '',
                        'msg' => 'For the junior room the accommodation must be Triple or Quadruple.'
                    ]);
                }
            }else if( $key['room_types_id'] == 3 ){
                if( !in_array($key['accommodation_id'], [1, 2, 3]) ){
                    return response()->json([
                        'error' => true,
                        'errors' => '',
                        'msg' => 'For the suite room the accommodation must be Single, Double or Triple.'
                    ]);
                }
            }
            $totalAmount += $key['amount'];
        }
        if( $totalAmount > $hotel->number_rooms ){
            return response()->json([
                'error' => true,
                'errors' => '',
                'msg' => 'The number of rooms in the configuration should not exceed the number of rooms in the hotel. Max: '.$hotel->number_rooms
            ]);
        }

        if( $totalAmount < $hotel->number_rooms ){
            return response()->json([
                'error' => true,
                'errors' => '',
                'msg' => 'There are still rooms to be configured. Max: '.$hotel->number_rooms
            ]);
        }

        // Eliminar conf anteriores
        HotelConf::where( 'hotel_id', $hotel->id )->delete();

        foreach( $request->all() as $key ){
            HotelConf::create([
                'accommodation_id' => $key['accommodation_id'],
                'room_types_id' => $key['room_types_id'],
                'hotel_id' => $key['hotel_id'],
                'amount' => $key['amount']
            ]);
        }

        return response()->json([
            'error' => false,
            'data' => '',
            'msg' => 'The configuration has been created'
        ]); 
    }
}
