<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLiability extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('liability', function (Blueprint $table) {
            $table->increments('id');
            $table->string('product_model')->nullable();
            $table->integer('personnel_card_id')->unsigned()->nullable();
            $table->foreign('personnel_card_id')->references('id')
                ->on('personnel_cards')
                ->onDelete('cascade');
            $table->date('signature_date')->nullable();
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
        Schema::dropIfExists('liability');
    }
}
