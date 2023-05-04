<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCheckRegistration extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('check_registration', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('personnel_card_id')->unsigned()->nullable();
            $table->foreign('personnel_card_id')->references('id')
                ->on('personnel_cards')
                ->onDelete('cascade');
            $table->string('start_hour')->nullable();
            $table->string('end_hour')->nullable();
            $table->date('check_date')->nullable();
            $table->longText('note')->nullable();
            $table->integer('user_id')->unsigned();
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
        Schema::dropIfExists('check_registration');
    }
}
