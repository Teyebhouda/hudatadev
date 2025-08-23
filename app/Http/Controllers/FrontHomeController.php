<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HomePageSection;
use Inertia\Inertia;
use App\Models\Project;

class FrontHomeController extends Controller
{
     public function index()
{
    $sections = HomePageSection::all()->mapWithKeys(function ($section) {
        $content = $section->content;
        // Décoder si c'est une chaîne JSON
        if (is_string($content)) {
            $content = json_decode($content, true);
        }
        return [$section->section_key => ['content' => $content]];
    })->toArray();
      $projects = Project::with('images')->latest()->get();
//dd($projects);
    return Inertia::render('Front/Home', [
        'sections' => $sections,
        'projectsData' => $projects,
    ]);
}
}
