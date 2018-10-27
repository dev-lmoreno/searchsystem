<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::post('search','BussinessController@search')->name('bussiness.list');
Route::group(['prefix' => 'admin',  'middleware' => 'auth'], function(){
	Route::resource('bussiness','BussinessController');
	Route::get('state/{id}/cities','BussinessController@cities')->name('cities.list');
});
Route::get('bussiness/about','BussinessController@about')->name('about');

Route::get('/home', 'HomeController@index')->name('home');
