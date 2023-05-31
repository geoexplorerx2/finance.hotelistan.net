<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class FinanceCrmMail extends Mailable
{
    use Queueable, SerializesModels;

    public $details;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($details)
    {
        $this->details = $details;
        $this->details["subject"] = config("app.name") . ' - ' . $this->details["subject"];
        $this->details["to"] = $details["to"];
        if (config("app.env") == "local") {
            $testMails =  env("TEST_MAIL_RECEIVER", "") ? explode(";",  env("TEST_MAIL_RECEIVER", "")) : null;
            if ($testMails) {
                $testTos = [];
                foreach ($testMails  as $address) {
                    $name = is_array(@$this->mailData["to"][0]) ?
                        @$this->mailData["to"][0]["name"] : auth()->user->name;
                    $testTos[] = [
                        "address" => $address,
                        "name" => $name
                    ];
                }
                $this->details["to"] = $testTos;
            }
        }
        $this->to = $this->details["to"];
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.financecrm');
    }
}
