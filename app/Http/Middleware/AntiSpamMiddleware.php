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
        | 1. RATE LIMITING (anti spam massif)
        |--------------------------------------------------------------------------
        */

        $key = 'contact:' . $ip;

        if (RateLimiter::tooManyAttempts($key, 5)) {
            return response()->json([
                'success' => false,
                'message' => 'Trop de requêtes, veuillez réessayer plus tard.'
            ], 429);
        }

        RateLimiter::hit($key, 3600); // 1 heure

        /*
        |--------------------------------------------------------------------------
        | 2. BLOQUER LES LIENS (spam classique)
        |--------------------------------------------------------------------------
        */

        $message = strtolower($request->input('message', ''));

        if (preg_match('/https?:\/\/|www\.|bit\.ly|t\.me|discord\.gg/i', $message)) {
            return response()->json([
                'success' => false,
                'message' => 'Les liens ne sont pas autorisés.'
            ], 422);
        }

        /*
        |--------------------------------------------------------------------------
        | 3. MOTS INTERDITS (spam SEO / crypto / etc.)
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
            'marketing automation',
            'telegram group'
        ];

        foreach ($blockedWords as $word) {
            if (str_contains($message, $word)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Contenu non autorisé détecté.'
                ], 422);
            }
        }

        /*
        |--------------------------------------------------------------------------
        | 4. USER AGENT SUSPECT (bots)
        |--------------------------------------------------------------------------
        */

        $ua = strtolower($request->userAgent() ?? '');

        $badAgents = ['curl', 'wget', 'python', 'httpclient'];

        foreach ($badAgents as $agent) {
            if (str_contains($ua, $agent)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Requête non autorisée.'
                ], 403);
            }
        }

        return $next($request);
    }
}