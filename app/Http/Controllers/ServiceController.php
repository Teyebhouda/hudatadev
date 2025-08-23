<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HomePageSection;
use Illuminate\Support\Str;
use Inertia\Inertia;

class ServiceController extends Controller
{
public function show($slug)
{
    $section = HomePageSection::where('section_key', 'services')->firstOrFail();
    $services = json_decode($section->content, true)['items'] ?? [];

    // Trouver le service dont le slug correspond
    $service = collect($services)->first(function ($item) use ($slug) {
        return Str::slug($item['title']) === $slug;
    });

    if (!$service) {
        abort(404, 'Service non trouvé');
    }

    // Récupérer aussi le footer si besoin
    $footer = HomePageSection::where('section_key', 'footer')->first();

    return Inertia::render('Front/ServiceDetail', [
        'service' => $service,
        'sections' => [
            'services' => ['content' => ['items' => $services]],
            'footer' => ['content' => $footer ? json_decode($footer->content, true) : []],
        ]
    ]);
}

}
