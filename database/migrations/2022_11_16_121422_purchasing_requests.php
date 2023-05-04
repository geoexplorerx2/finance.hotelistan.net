<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class PurchasingRequests extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchasing_requests', function (Blueprint $table) {
            $table->increments('id');
            $table->string('product_title')->nullable();
            $table->string('product_url')->nullable();
            $table->integer('purchasing_request_status_id')->unsigned();
            $table->foreign('purchasing_request_status_id')->references('id')
                ->on('purchasing_requests_statuses')
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
        Schema::dropIfExists('purchasing_requests');
    }
}
