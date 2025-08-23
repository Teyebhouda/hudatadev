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



use Illuminate\Support\Facades\Mail;

Route::get('/test-email', function () {
    Mail::raw('Test SMTP depuis Laravel', function($message) {
        $message->to('teyebhuda@gmail.com')
                ->subject('Test SMTP Laravel');
    });

    return 'Email envoyé !';
});


Route::get('/', [
    FrontHomeController::class, 'index'
])->name('front.home');
Route::get('/services/{slug}', [ServiceController::class, 'show'])->name('services.show');


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
   Route::get('/settings', [SettingController::class, 'edit'])->name('settings.edit');
//Route::post('/settings', [SettingController::class, 'update'])->name('settings.update');
 Route::resource('services', \App\Http\Controllers\Admin\ServiceController::class);
    Route::resource('projects', \App\Http\Controllers\Admin\ProjectController::class);
    
  Route::get('/services.create', [\App\Http\Controllers\Admin\ServiceController::class, 'create'])->name('services.create');

    Route::get('/services.edit/{service}', [\App\Http\Controllers\Admin\ServiceController::class, 'edit'])->name('services.edit');
    Route::put('/services.update/{service}', [\App\Http\Controllers\Admin\ServiceController::class, 'update'])->name('services.update');
    Route::delete('/services.destroy/{service}', [\App\Http\Controllers\Admin\ServiceController::class, 'destroy'])->name('services.destroy');
    Route::get('/services.index', [\App\Http\Controllers\Admin\ServiceController::class, 'index'])->name('services.index');
    Route::get('/services.show/{service}', [\App\Http\Controllers\Admin\ServiceController::class, 'show'])->name('services.show');
   
   });
Route::post('/contact/send', [ContactController::class, 'send'])->name('contact.send');


require __DIR__.'/auth.php';
