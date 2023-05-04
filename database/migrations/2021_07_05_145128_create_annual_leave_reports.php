<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnnualLeaveReports extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('annual_leave_reports', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->nullable();
            $table->string('path')->nullable();
            $table->integer('annual_leave_id')->unsigned()->nullable();
            $table->foreign('annual_leave_id')->references('id')
                ->on('annual_leaves')
                ->onDelete('cascade');
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
        Schema::dropIfExists('annual_leave_reports');
    }
}
