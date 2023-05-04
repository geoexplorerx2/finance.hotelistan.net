<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCheques extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cheques', function (Blueprint $table) {
            $table->increments('id');
            $table->string('bank_name');
            $table->string('expiry_date')->nullable();
            $table->string('issue_date')->nullable();
            $table->string('cheque_no')->nullable();
            $table->string('amount')->nullable();
            $table->string('currency')->nullable();
            $table->integer('company_id')->unsigned();
            $table->foreign('company_id')->references('id')
                ->on('companies')
                ->onDelete('cascade');
            $table->integer('cheques_statuses_id')->unsigned();
            $table->foreign('cheques_statuses_id')->references('id')
                ->on('cheques_statuses')
                ->onDelete('cascade');
            $table->longText('note')->nullable();
            $table->integer('user_id')->unsigned();
            $table->softDeletes();
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
        Schema::dropIfExists('cheques');
    }
}
