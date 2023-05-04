<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBills extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bills', function (Blueprint $table) {
            $table->increments('id');
            $table->string('bank_name');
            $table->string('expiry_date')->nullable();
            $table->string('issue_date')->nullable();
            $table->string('amount')->nullable();
            $table->integer('company_id')->unsigned();
            $table->foreign('company_id')->references('id')
                ->on('companies')
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
        Schema::dropIfExists('bills');
    }
}
