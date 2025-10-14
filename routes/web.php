<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\FrontHomeController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\Admin\ProjectController;



use Illuminate\Support\Facades\Mail;

Route::get('/test-email', function () {
    Mail::raw('Test SMTP depuis Laravel', function($message) {
        $message->to('teyebhuda@gmail.com')
                ->subject('Test SMTP Laravel');
    });

    return 'Email envoyé !';
});



Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::get('/home/edit/{sectionKey}', [HomeController::class, 'edit'])->name('home.edit');
 // Add admin.homepage.update route for Ziggy compatibility
    Route::put('/admin/homePage/{sectionKey}/update', [HomeController::class, 'update'])->name('admin.homepage.update');
    Route::get('/pages', [PagesController::class, 'index'])->name('pages');
    //Route::get('/pages/edit/{pageId}', [PagesController::class, 'edit'])->name('pages.edit');
    Route::put('/pages/{pageId}/update', [PagesController::class, 'update'])->name('pages.update');
Route::get('/pages/create', [PagesController::class, 'create'])->name('pages.create');
    Route::post('/pages/store', [PagesController::class, 'store'])->name('pages.store');
    Route::delete('/pages/{pageId}/delete', [PagesController::class, 'destroy'])->name('pages.destroy');
Route::get('/pages/{id}/edit', [PagesController::class, 'edit'])->name('pages.edit');
  
    Route::get('/settings', [SettingController::class, 'edit'])->name('settings.edit');
   Route::post('/settings', [SettingController::class, 'update'])->name('settings.update');
//Route::post('/settings', [SettingController::class, 'update'])->name('settings.update');
 Route::resource('services', ServiceController::class);
   Route::post('/admin/services/batch-update', [ServiceController::class, 'batchUpdate'])->name('services.batch-update');
    //Route::resource('projects', ProjectController::class);

    Route::get('/admin/projects', [ProjectController::class, 'index'])->name('projects.index');
    Route::get('/admin/projects/{project}/edit', [ProjectController::class, 'edit'])->name('projects.edit');

    Route::get('/admin/projects/create', [ProjectController::class, 'create'])->name('projects.create');
Route::post('/admin/projects', [ProjectController::class, 'store'])->name('projects.store');
    Route::get('/admin/api/projects', [ProjectController::class, 'apiIndex'])->name('admin.projects.api');
Route::put('/projects/{project}', [ProjectController::class, 'update'])->name('projects.update');

   });
   
Route::get('/', [
    FrontHomeController::class, 'index'
])->name('front.home');
Route::get('/contact', [FrontHomeController::class, 'contact'])->name('contact.index');
Route::get('/services/{slug}', [ServiceController::class, 'show'])->name('services.show');
Route::get('/projects', [ProjectController::class, 'frontIndex'])->name('allprojects.index');
Route::get('/projects/{slug}', [ProjectController::class, 'show'])->name('projects.show');
Route::get('/pages/{slug}', [PagesController::class, 'show'])->name('pages.show');

Route::post('/contact/send', [ContactController::class, 'send'])->name('contact.send');
Route::post('/contact/sendcontact', [ContactController::class, 'sendcontact'])->name('contact.sendcontact');


require __DIR__.'/auth.php';
