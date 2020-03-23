<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('register', 'PetugasController@register');
Route::post('login', 'PetugasController@login');
Route::get('/',function(){
  return Auth::user()->level;
})->middleware('jwt.verify');
Route::get('petugas','PetugasController@tampil')->middleware('jwt.verify');
Route::put('petugas/{id}', 'PetugasController@update')->middleware('jwt.verify');
Route::delete('petugas/{id}','PetugasController@delete')->middleware('jwt.verify');

Route::post('pelanggan','PelangganController@store')->middleware('jwt.verify');
Route::get('pelanggan','PelangganController@tampil')->middleware('jwt.verify');
Route::put('pelanggan/{id}', 'PelangganController@update')->middleware('jwt.verify');
Route::delete('pelanggan/{id}','PelangganController@delete')->middleware('jwt.verify');

Route::post('jeniscuci','JenisCuciController@store')->middleware('jwt.verify');
Route::get('jeniscuci','JenisCuciController@tampil')->middleware('jwt.verify');
Route::put('jeniscuci/{id}', 'JenisCuciController@update')->middleware('jwt.verify');
Route::delete('jeniscuci/{id}','JenisCuciController@delete')->middleware('jwt.verify');

Route::post('transaksi','TransaksiController@store')->middleware('jwt.verify');
Route::get('transaksi','TransaksiController@tampil')->middleware('jwt.verify');
Route::put('transaksi/{id}', 'TransaksiController@update')->middleware('jwt.verify');
Route::delete('transaksi/{id}','TransaksiController@delete')->middleware('jwt.verify');

Route::post('detail','DetailTransController@store')->middleware('jwt.verify');
Route::get('detail/{tgl_transaksi}/{tgl_jadi}','DetailTransController@tampil')->middleware('jwt.verify');
Route::put('detail/{id}', 'DetailTransController@update')->middleware('jwt.verify');
Route::delete('detail/{id}','DetailTransController@delete')->middleware('jwt.verify');
