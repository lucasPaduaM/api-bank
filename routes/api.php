<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsuariosController;
use App\Http\Controllers\TransferenciaController;
use App\Http\Controllers\RetiroController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::apiResource('/Usuarios', UsuariosController::class);
Route::apiResource('/Transferencia', TransferenciaController::class);
Route::apiResource('/Retiro', RetiroController::class);