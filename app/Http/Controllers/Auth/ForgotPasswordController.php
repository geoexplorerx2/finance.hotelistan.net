<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Mail\FinanceCrmMail;
use App\Models\PasswordReset;
use App\Models\User;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    public function forgetPassword(Request $request)
    {
        try {
            $validateRequest = Validator::make(
                $request->all(),
                [
                    'email' => 'required|email'
                ]
            );

            if ($validateRequest->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateRequest->errors()
                ], 401);
            }

            $user = User::where('email', $request->email)->first();
            if (!$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'There is no user found with this email.',
                ], 401);
            }

            $otpCode = random_int(10000, 99999);
            $passwordReset = PasswordReset::where("email", $user->email)->first() ?: new PasswordReset();
            $passwordReset->email = $user->email;
            $passwordReset->token = $otpCode;
            $passwordReset->save();

            $mailData = [
                "subject" => "Reset Password",
                "to" => [
                    [
                        "address" => $user->email,
                        "name" => $user->name
                    ]
                ],
                "body" => "You can use this code to reset you password: {$otpCode}"
            ];
            Mail::send(new FinanceCrmMail($mailData));
            $response = [
                'status' => true,
                'message' => 'Reset password mail sent successfully.'
            ];
            return response()->json($response);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}
