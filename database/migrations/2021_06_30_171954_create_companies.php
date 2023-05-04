<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompanies extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('bank_name')->nullable();
            $table->string('bank_iban')->nullable();
            $table->string('person_name')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('expiry_date')->nullable();
            $table->integer('payment_type_id')->unsigned();
            $table->foreign('payment_type_id')->references('id')
                ->on('payment_types')
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
        Schema::dropIfExists('companies');
    }
}
