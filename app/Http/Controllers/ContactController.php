<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactRequestMail;
use App\Mail\DevisRequestMail;

class ContactController extends Controller
{
    /**
     * Envoi d'une demande de devis
     */
    public function send(Request $request)
    {
        // Vérification Honeypot + Turnstile
        if ($response = $this->securityChecks($request)) {
            return $response;
        }

        // Validation
        $data = $request->validate([
            'nom' => [
                'required',
                'string',
                'min:2',
                'max:100'
            ],

            'email' => [
                'required',
                'email:rfc,dns',
                'max:255'
            ],

            'telephone' => [
                'nullable',
                'string',
                'max:20'
            ],

            'service' => [
                'required',
                'string',
                'max:100'
            ],

            'message' => [
                'required',
                'string',
                'min:20',
                'max:3000'
            ],

            'turnstile' => [
                'required',
                'string'
            ],

            'website' => [
                'nullable',
                'string'
            ]
        ]);

        Mail::to(config('mail.admin_address'))
            ->send(new DevisRequestMail($data));

        return response()->json([
            'success' => true,
            'message' => 'Merci, nous avons reçu votre demande. Nous vous répondrons dans les plus brefs délais.'
        ]);
    }

    /**
     * Envoi d'un message de contact
     */
    public function sendcontact(Request $request)
    {
        // Vérification Honeypot + Turnstile
        if ($response = $this->securityChecks($request)) {
            return $response;
        }

        $data = $request->validate([
            'nom' => [
                'required',
                'string',
                'min:2',
                'max:100'
            ],

            'email' => [
                'required',
                'email:rfc,dns',
                'max:255'
            ],

            'telephone' => [
                'nullable',
                'string',
                'max:20'
            ],

            'message' => [
                'required',
                'string',
                'min:20',
                'max:3000'
            ],

            'turnstile' => [
                'required',
                'string'
            ],

            'website' => [
                'nullable',
                'string'
            ]
        ]);

        Mail::to(config('mail.admin_address'))
            ->send(new ContactRequestMail($data));

        return response()->json([
            'success' => true,
            'message' => 'Merci, nous avons reçu votre message. Nous vous répondrons dans les plus brefs délais.'
        ]);
    }

    /**
     * Vérifications de sécurité communes
     */
    private function securityChecks(Request $request)
    {
        // Honeypot
        if ($request->filled('website')) {
            return response()->json([
                'success' => false,
                'message' => 'Requête invalide.'
            ], 422);
        }

        // Vérification Turnstile
        $verify = Http::asForm()->post(
            'https://challenges.cloudflare.com/turnstile/v0/siteverify',
            [
                'secret'   => config('services.turnstile.secret_key'),
                'response' => $request->turnstile,
                'remoteip' => $request->ip(),
            ]
        );

        if (!$verify->successful() || !$verify->json('success')) {
            return response()->json([
                'success' => false,
                'message' => 'La vérification de sécurité a échoué.'
            ], 422);
        }

        return null;
    }
}