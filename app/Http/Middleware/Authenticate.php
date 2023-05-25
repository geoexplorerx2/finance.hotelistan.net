<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Support\Facades\Auth;


class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        // dd(url()->current());
        if (str_contains(url()->current(), $_SERVER['HTTP_HOST'] . '/api')) {
            return url('/api/alert');
        } else {
            if (!$request->expectsJson()) {
                return route('login');
            }
        }
    }
}
