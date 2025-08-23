<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HomePageSection;
use Inertia\Inertia;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Laravel\Facades\Image;


class HomeController extends Controller
{
    /**
     * Display the home page.
     */
    public function index()
    {
        
      $sections = HomePageSection::all()->mapWithKeys(function ($section) {
        // On ne décode que si c'est une chaîne JSON
        $content = $section->content;
        if (is_string($content)) {
            
            $content = json_decode($content, true);
        }
        $sections = HomePageSection::all()->mapWithKeys(function ($section) {
    $content = is_string($section->content) ? json_decode($section->content, true) : $section->content;

   

    return [$section->section_key => $content];
})->toArray();

        return [$section->section_key => $content];
    })->toArray();
    

    return Inertia::render('Admin/HomePage/edit', [
        'sections' => $sections,
    ]);    
    }

    public function edit($sectionKey)
    {
        $section = HomePageSection::where('section_key', $sectionKey)->firstOrFail();
        
        return Inertia::render('Home/EditSection', [
            'section' => $section,
        ]);
    }




public function update(Request $request, $sectionKey)
{
   // dd($request->all(), $sectionKey);
    $data = $this->getValidatedData($request, $sectionKey);

    foreach (['background_imageFile', 'imageFile'] as $fileField) {
    if ($request->hasFile($fileField) && $request->file($fileField)->isValid()) {
        $file = $request->file($fileField);
        $path = $file->store('uploads/homepage', 'public');

        // Ajouter la version finale dans $data
        if ($fileField === 'background_imageFile') {
            $data['background_image'] = asset("storage/$path");
        } else if ($fileField === 'imageFile') {
            $data['image'] = asset("storage/$path");
        }

        // Supprimer le champ file original
        unset($data[$fileField]);
    }
}

    if ($sectionKey === 'hero' && isset($data['slides']) && is_array($data['slides'])) {
        foreach ($data['slides'] as $i => &$slide) {

            // Gestion de l'upload d'image pour chaque slide
            if ($request->hasFile("slides.$i.imageFile")) {
                $file = $request->file("slides.$i.imageFile");

                if ($file->isValid()) {
                    // Redimensionnement de l'image pour limiter la mémoire
                    $image = Image::read($file)->resize(1920, 1080, function ($constraint) { // largeur max 1920px, hauteur auto
        $constraint->aspectRatio(); // garde le ratio
        $constraint->upsize();
                    });

                    $filename = uniqid() . '.' . $file->getClientOriginalExtension();
                    $path = "uploads/homepage/$filename";
                    $image->save(public_path("storage/$path"));

                    $slide['background_image'] = asset("storage/$path");
                }
            }

            // Supprimer le champ imageFile
            unset($slide['imageFile']);
        }
        unset($slide);
    } else {
        $data = $this->processFilesRecursive($data, $request);
    }

    if (!empty($data['items']) && is_array($data['items'])) {
        foreach ($data['items'] as &$item) {
            if (isset($item['longDescription'])) {
                $item['longDescription'] = html_entity_decode($item['longDescription']);
            }
        }
        unset($item);
    }
    if (isset($data['long_description'])) {
        $data['long_description'] = html_entity_decode($data['long_description']);
    }


    HomePageSection::updateOrCreate(
        ['section_key' => $sectionKey],
        ['content' => json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE)]
    );

    return redirect()->back()->with('success', ucfirst($sectionKey).' section mise à jour !');
}





// Fonction récursive pour traiter les fichiers dans l’arbre de données


private function processFilesRecursive(array $data, Request $request, $parentKey = '')
{
    foreach ($data as $key => &$value) {
        $fieldPath = $parentKey === '' ? $key : "$parentKey.$key";

        if (is_array($value)) {
            $value = $this->processFilesRecursive($value, $request, $fieldPath);
        }

        if ($key === 'imageFile') {
          
            if ($request->hasFile($fieldPath)) {
                $file = $request->file($fieldPath);
                if ($file->isValid()) {
                    $path = $file->store('uploads/homepage', 'public');

                    // Trouver et modifier le parent de 'imageFile'
                    $parentKeys = explode('.', $fieldPath);
                    array_pop($parentKeys); // remove 'imageFile'
                    $parentRef = &$data;

                    foreach ($parentKeys as $step) {
                        if (isset($parentRef[$step])) {
                            $parentRef = &$parentRef[$step];
                        }
                    }

                    // ✅ Ajout du champ background_image dans le parent
                    $parentRef['background_image'] = asset("storage/$path");
                }
            }

            // ✅ Supprimer le champ imageFile
            unset($data[$key]);
        }

        if ($key === 'background_image' && is_string($value) && str_starts_with($value, 'data:image')) {
            unset($data[$key]);
        }
    }
//dd($data);
    return $data;
}











   protected function getValidatedData(Request $request, string $sectionKey)
{
    switch ($sectionKey) {
       case 'hero':
            return $request->validate([
                'slides' => 'required|array|min:1',
                'slides.*.title' => 'nullable|string|max:255',
                'slides.*.subtitle' => 'nullable|string|max:500',
                'slides.*.button_text' => 'nullable|string|max:100',
                'slides.*.imageFile' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:5120', // 5MB max
            ]);

       case 'howItWork':
    return $request->validate([
        'title' => 'required|string|max:255',
        'subtitle' => 'required|string|max:500',
        'steps' => 'required|array|size:3',
        'steps.*.icon' => 'required|string|max:10',
        'steps.*.title' => 'required|string|max:255',
        'steps.*.description' => 'required|string|max:500',
    ]);

        case 'services':

            return $request->validate([
                'title' => 'required|string|max:255',
                'subtitle' => 'nullable|string',
                'items' => 'nullable|array',
                'items.*.title' => 'required|string|max:1000',
                'items.*.description' => 'nullable|string|max:2000',
                'items.*.longDescription' => 'nullable|string|max:10000',
                'items.*.icon' => 'required|string|max:500',
                
            ]);

        case 'testimonials':
            return $request->validate([
                'title' => 'required|string|max:255',
                'items' => 'required|array|min:1',
                'items.*.name' => 'required|string|max:100',
                'items.*.role' => 'required|string|max:500',
                'items.*.message' => 'nullable|string',
                'items.*.imageFile' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048', // uniquement si fichier est uploadé

            ]);
       
        case 'whyChooseUs':
             return $request->validate([
                'imageFile' => 'nullable|image|mimes:jpeg,avif,png,jpg,webp|max:2048',
                'title' => 'nullable|string|max:255',
                'description' => 'nullable|string',
                'items' => 'nullable|array',
                'items.*.text' => 'required|string|max:255',
    ]);

case 'contact':
    return $request->validate([
        'fields_to_show' => 'nullable|array',
        'fields_to_show.*' => 'string|in:entreprise,email,phone,adress,logoFile,title,description,socials',
    ]);

        case 'aboutus':
            return $request->validate([
                'title' => 'required|string|max:255',
                'subtitle' => 'nullable|string|max:500',
                'long_description' => 'nullable|string',
                'imageFile' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048', // 2MB max
            ]);
        case 'ParallaxStats':
    return $request->validate([
        'title' => 'required|string|max:255',
        'description' => 'nullable|string|max:1000',
        'badge' => 'nullable|string|max:255',

        // ✅ Image de fond et image décorative (avec AVIF)
        'background_imageFile' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:5120',
        'imageFile' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:5120',

        // ✅ Stats
        'stats' => 'nullable|array|min:1',
        'stats.*.value' => 'required_with:stats|string|max:100',
        'stats.*.label' => 'required_with:stats|string|max:255',
    ]);

             




        

        default:
            abort(404, 'Section inconnue');
    }
}
   
}
