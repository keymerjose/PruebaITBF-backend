<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHotelConfsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hotel_confs', function (Blueprint $table) {
            $table->id();

            $table->integer('amount');

            $table->unsignedBigInteger('accommodation_id');
            $table->foreign('accommodation_id')->references('id')->on('accommodations')->onDelete('cascade');

            $table->unsignedBigInteger('room_types_id');
            $table->foreign('room_types_id')->references('id')->on('room_types')->onDelete('cascade');

            $table->unsignedBigInteger('hotel_id');
            $table->foreign('hotel_id')->references('id')->on('hotels')->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hotel_confs');
    }
}
