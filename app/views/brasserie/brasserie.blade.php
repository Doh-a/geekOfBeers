@extends('layouts.default')

{{-- Web site Title --}}
@section('title')
@parent
:: Brasserie
@stop

{{-- New Laravel 4 Feature in use --}}
@section('styles')
@parent
body {
	background: #f2f2f2;
}
@stop

@section('user-context')
<h2>Navigation</h2>
	<ul>
		<li><a href="http://css.alsacreations.com/Faire-une-mise-en-page-sans-tableaux/design-trois-colonnes-positionnement-flottant">Tutoriel : un design fluide avec trois ç colonnes ü</a></li>
		<li><strong>Exemple : bloc central sans marges</strong></li>
		<li><a href="exemple-2.html">Exemple : bloc central avec marges compensant les flottants</a></li>
		<li><a href="exemple-3.html">Exemple : bloc central sans marges, mais avec un contexte de formatage</a></li>
	</ul>
@stop

@section('more-content')
<h2>Bi&egrave;res brass&eacute;es</h2>
@foreach($bieres as $biere)
	{{ $biere }}
@endforeach
@stop

{{-- Content --}}
@section('content')
<div class="page-header">
	<h1>{{{ $brasserie->nom_brasserie }}}</h1>
	{{HTML::image((asset("assets/img/brasseries/$brasserie->img")), 'Logo', array("width" => "200px;", "align" => "left"))}}
	<p>{{{ $brasserie->description_brasserie }}}</p>
</div>
@stop
