<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        try {
            $validateUser = Validator::make(
                $request->all(),
                [
                    'email' => 'required|email',
                    'password' => 'required'
                ]
            );

            if ($validateUser->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            if (!Auth::attempt($request->only(['email', 'password']))) {
                return response()->json([
                    'status' => false,
                    'message' => 'Email & Password does not match with our record.',
                ], 401);
            }

            $user = User::where('email', $request->email)->first();

            $response = [
                'status' => true,
                'user' => $user,
                'message' => 'User Logged In Successfully',
                'token' => $user->createToken("apitoken")->plainTextToken
            ];

            return response()->json($response);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        Session::flush();
        return  response()->json([
            'status' => true,
            'message' => 'token deleted successfully'
        ]);
    }

    public function profile(Request $request)
    {
        try {
            $validators = [
                'username' => 'required',
                'email' => 'required|email',
            ];

            $temp['name'] = $request->input('username');
            $temp['email'] = $request->input('email');

            if ($request->has('password') && !empty($request->input('password'))) {
                $validators['password'] = 'required|min:6|max:20|same:password_again';
                $validators['password_again'] = 'required';
                $temp['password'] = bcrypt($request->input('password'));
            }

            $validateRequest = Validator::make(
                $request->all(),
                $validators
            );
            if ($validateRequest->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateRequest->errors()
                ], 401);
            }

            /** @var User */
            $updateSelectedData = $request->user();
            $updateSelectedData->update($temp);
            return response()->json([
                'status' => true,
                'message' => 'Profile updated successfully.',
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
