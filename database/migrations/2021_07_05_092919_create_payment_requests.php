<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentRequests extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_requests', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamp('post_time')->nullable();
            $table->date('expiry_date')->nullable();
            $table->string('payment_amount')->nullable();
            $table->string('payment_amount_currency')->nullable();
            $table->integer('payment_request_status_id')->unsigned();
            $table->foreign('payment_request_status_id')->references('id')
                ->on('payment_requests_statuses')
                ->onDelete('cascade');
            $table->integer('payment_request_category_id')->unsigned();
            $table->foreign('payment_request_category_id')->references('id')
                ->on('payment_requests_categories')
                ->onDelete('cascade');
            $table->integer('pay_company_id')->unsigned();
            $table->foreign('pay_company_id')->references('id')
                ->on('companies')
                ->onDelete('cascade');
            $table->integer('paid_company_id')->unsigned();
            $table->foreign('paid_company_id')->references('id')
                ->on('companies')
                ->onDelete('cascade');
            $table->string('document_no')->nullable();
            $table->date('document_date')->nullable();
            $table->integer('payment_type_id')->unsigned();
            $table->foreign('payment_type_id')->references('id')
                ->on('payment_types')
                ->onDelete('cascade');
            $table->date('invoice_date')->nullable();
            $table->longText('answer_note')->nullable();
            $table->integer('is_suitable')->nullable();
            $table->longText('note')->nullable();
            $table->integer('user_id')->unsigned();
            $table->integer('answered_user_id')->unsigned()->nullable();
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
        Schema::dropIfExists('payment_requests');
    }
}
