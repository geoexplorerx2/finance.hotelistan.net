<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnnualLeaves extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('annual_leaves', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('personnel_id')->unsigned()->nullable();
            $table->foreign('personnel_id')->references('id')
                ->on('personnel_cards')
                ->onDelete('cascade');
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->integer('annual_leave_type_id')->unsigned()->nullable();
            $table->foreign('annual_leave_type_id')->references('id')
                ->on('annual_leave_types')
                ->onDelete('cascade');
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
        Schema::dropIfExists('annual_leaves');
    }
}
