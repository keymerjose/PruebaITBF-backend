<?php

use App\Http\Controllers\AccommodationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CityController;
use App\Http\Controllers\HotelController;
use App\Http\Controllers\HotelConfController;
use App\Http\Controllers\RoomTypeController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/cities', [CityController::class, 'index']);
Route::get('/types-rooms', [RoomTypeController::class, 'index']);
Route::get('/accommodations', [AccommodationController::class, 'index']);

Route::controller(HotelController::class)->group( function(){
    Route::get('/hotels', 'index');
    Route::post('/hotels', 'store');
    Route::get('/hotels/{hotel:id}', 'show');
    Route::delete('/hotels/{hotel:id}', 'delete');
} );

Route::controller( HotelConfController::class )->group( function(){
    Route::get('/hotel-conf/{hotel:id}', 'show');
    Route::post('/hotel-conf/{hotel:id}', 'store');
} );
