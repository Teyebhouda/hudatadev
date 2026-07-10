<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Symfony\Component\HttpFoundation\Response;

class AntiSpamMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        $ip = $request->ip();

        /*
        |--------------------------------------------------------------------------
        | 1. RATE LIMITING
        |--------------------------------------------------------------------------
        */

        $key = 'contact:' . $ip;

        // 5 messages maximum toutes les 10 minutes
        if (RateLimiter::tooManyAttempts($key, 5)) {

            return response()->json([
                'success' => false,
                'message' => 'Trop de tentatives. Veuillez patienter quelques minutes.'
            ], 429);

        }

        RateLimiter::hit($key, 600);



        /*
        |--------------------------------------------------------------------------
        | 2. HONEYPOT
        |--------------------------------------------------------------------------
        */

        if ($request->filled('website')) {

            return response()->json([
                'success'=>false,
                'message'=>'Requête invalide.'
            ],422);

        }



        /*
        |--------------------------------------------------------------------------
        | 3. BLOQUER LES LIENS
        |--------------------------------------------------------------------------
        */

        $message = strtolower(
            $request->input('message','')
        );


        if (preg_match('/https?:\/\/|www\.|bit\.ly|t\.me|discord\.gg/i', $message)) {

            return response()->json([
                'success'=>false,
                'message'=>'Les liens ne sont pas autorisés.'
            ],422);

        }



        /*
        |--------------------------------------------------------------------------
        | 4. MOTS SPAM
        |--------------------------------------------------------------------------
        */

        $blockedWords = [

            'casino',
            'viagra',
            'crypto',
            'bitcoin',
            'forex',
            'loan',
            'backlinks',
            'seo service',
            'telegram group'

        ];


        foreach($blockedWords as $word){

            if(str_contains($message,$word)){

                return response()->json([
                    'success'=>false,
                    'message'=>'Contenu non autorisé.'
                ],422);

            }

        }



        /*
        |--------------------------------------------------------------------------
        | 5. USER AGENT BOTS
        |--------------------------------------------------------------------------
        */

        $ua = strtolower(
            $request->userAgent() ?? ''
        );


        $badAgents = [
            'curl',
            'wget',
            'python',
            'httpclient',
            'postman'
        ];


        foreach($badAgents as $agent){

            if(str_contains($ua,$agent)){

                return response()->json([
                    'success'=>false,
                    'message'=>'Requête non autorisée.'
                ],403);

            }

        }



        return $next($request);

    }
}