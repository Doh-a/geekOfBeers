<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/


Route::controller('account','AccountController' );
Route::get('/', 'HomeController@showIndex');

Route::get('brasseries', function()
{
	$brasseries = Brasserie::paginate(15);
    
	return View::make('brasserie/brasseriesListe')->with('brasseries', $brasseries);
});

Route::get('brasserie/{id}', 'BrasserieController@brasseriePresentation');
Route::get('biere/{id}', 'BiereController@bierePresentation');

Route::get('userBiere/{biereId}/{userId}/{newNote}', 'BiereUserController@rateBiere');

Route::get('add', 'BiereController@addForm');
Route::post('add', array(
	'before' => 'csrf',
	'as' => 'add.biere',
	'uses' => 'BiereController@addBiere')
	);

//AJAX
Route::get( '/brasseriesUser/{brasserieId}/{userId}', 'BrasserieUserController@bieresTestee' );