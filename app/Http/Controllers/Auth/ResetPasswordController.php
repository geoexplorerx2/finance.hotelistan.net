<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\PasswordReset;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */

    use ResetsPasswords;

    /**
     * Where to redirect users after resetting their password.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    public function verifyToken(Request $request)
    {
        try {
            $validateRequest = Validator::make(
                $request->all(),
                [
                    'email' => 'required',
                    'token' => 'required',
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
                    'message' => 'Bu e-posta ile kullanıcı bulunamadı.',
                ], 401);
            }

            $passwordReset = PasswordReset::where("email", $user->email)->first();
            if (!$passwordReset || $passwordReset->token != $request->token) {
                return response()->json([
                    'status' => false,
                    'message' => 'Girdiğiniz kod hatalı.',
                ], 401);
            } else if (strtotime($passwordReset->created_at) < strtotime("-5 minutes")) {
                return response()->json([
                    'status' => false,
                    'message' => 'Kodun süresi geçti.',
                ], 401);
            } else {
                $passwordReset->verified = 1;
                $passwordReset->save();
                return response()->json([
                    'status' => true,
                    'message' => 'Kod doğrulandı.',
                ]);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function passwordReset(Request $request)
    {
        try {
            $validateRequest = Validator::make(
                $request->all(),
                [
                    'email' => 'required|email',
                    'token' => 'required',
                    "password" => 'required|min:6|max:20|same:password_again',
                    "password_again" => 'required',
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
                    'message' => 'Bu e-posta ile kullanıcı bulunamadı.',
                ], 401);
            }
            $passwordReset = PasswordReset::where("email", $user->email)->first();
            if (!$passwordReset || !$passwordReset->verified) {
                return response()->json([
                    'status' => false,
                    'message' => 'Kod doğrulanmamış.',
                ], 401);
            } else {
                $this->resetPassword($user, $request->password);
                $passwordReset->delete();
                return response()->json([
                    'status' => true,
                    'message' => 'Şifre başarıyla sıfırlandı.',
                ]);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}
