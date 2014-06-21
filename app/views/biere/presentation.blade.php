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

	<div class="panel panel-default">
		<div class="panel-body">
			@if (Auth::check())
				<div id="user-context-title">
					<img src="../assets/img/avatars/{{ Auth::user()->getAvatarId() }}_40.jpg" alt="Your avatar" class="img-rounded"> <b>Vous et cette bi&egrave;re</b>
				</div>
				<div id="user-context-content">
					<h2>Votre note : </h2>
					<div class="rating" style="font-size:2em;">
						<span class="rating-num" id="user_rate_num">{{ $biereUser->note_biere }}</span>
						<input class="rating" data-max="5" data-min="1" data-clearable="&nbsp;" data-empty-value="-1" id="user-rating" name="user-rating" type="number" value="{{ round($biereUser->note_biere) }}" />
					</div>
					<br style="clear:both" />
					<h2>Votre commentaire : </h2>
				</div>
			@endif
		</div>
	</div>
@stop

@section('more-content')

<div class="panel panel-default">
	<div class="panel-body">
		
	</div>
</div>
@stop

{{-- Content --}}
@section('content')
<div class="panel panel-default">
	<div class="panel-body">
		<div id="alert_placeholder"></div>
		<h1>{{{ $biere->nom_biere }}}</h1>
		<div id="image-box">
			{{HTML::image((asset("assets/img/bieres/$biere->etiquette")), "Logo $biere->nom_biere", array("width" => "200px;", "align" => "left", "padding" => "5px;"))}}	
		</div>
		<div id="infos-box">
			<div id="infos-biere">
				<h2>Informations</h2>
				<b>Brass&eacute;e par : </b> {{ link_to("brasserie/$biere->brasserie", $biere->brasserie()->nom_brasserie); }}<br />
				<b>Couleur : </b>{{ link_to("couleur/", $biere->couleur()->nom_couleur); }}<br />
				<b>Fermentation : </b> {{ link_to("fermentation/", $biere->fermentation()->nom_fermentation); }}<br />
				<b>Maltage : </b> {{ link_to("maltage/", $biere->maltage()->nom_maltage); }}<br />
				<b>Classification (am&eacute;ricaine) : </b>{{ $biere->typeAmericain()->nom_type }}<br />
				@if($biere->typeBelge() != null)
					<b>Classification (belge) : </b>{{ $biere->typeBelge()->nom_type }}
				@endif
			</div>
			<div id="beer-description">
				<h2>Description</h2>
				{{{ $biere->description }}}
			</div>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-body">
		<div id="image-box">
			<div id="rating-box">
				<h2>Evaluation</h2>
				<div class="rate-container">
				  <div class="rate-inner">
					<div class="rating">
					  <span class="rating-num">4.0</span>
					  <div class="rating-users">
						<i class="icon-user"></i> 1,014,004 total
					  </div>
					</div>
					
					<div class="rate-histo">
					  <div class="five histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 5           </span>
						<span class="bar-block">
						  <span id="bar-five" class="bar">
							<span>566,784</span>&nbsp;
						  </span> 
						</span>
					  </div>
					  
					  <div class="four histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 4           </span>
						<span class="bar-block">
						  <span id="bar-four" class="bar">
							<span>171,298</span>&nbsp;
						  </span> 
						</span>
					  </div> 
					  
					  <div class="three histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 3           </span>
						<span class="bar-block">
						  <span id="bar-three" class="bar">
							<span>94,940</span>&nbsp;
						  </span> 
						</span>
					  </div>
					  
					  <div class="two histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 2           </span>
						<span class="bar-block">
						  <span id="bar-two" class="bar">
							<span>44,525</span>&nbsp;
						  </span> 
						</span>
					  </div>
					  
					  <div class="one histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 1           </span>
						<span class="bar-block">
						  <span id="bar-one" class="bar">
							<span>136,457</span>&nbsp;
						  </span> 
						</span>
					  </div>
					</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>
@stop

@section('footer-scripts')
@if (Auth::check())
<script src="../assets/js/rating/bootstrap-rating-input.min.js" type="text/javascript"></script>

<script type="text/javascript">

/*
For stackoverflow question: http://stackoverflow.com/questions/17859134/how-do-i-create-rating-histogram-in-jquery-mobile-just-like-rating-bar-in-google#17859134
*/

$(document).ready(function() {
  $('.bar span').hide();
  $('#bar-five').animate({
     width: '75%'}, 1000);
  $('#bar-four').animate({
     width: '35%'}, 1000);
  $('#bar-three').animate({
     width: '20%'}, 1000);
  $('#bar-two').animate({
     width: '15%'}, 1000);
  $('#bar-one').animate({
     width: '30%'}, 1000);
  
  setTimeout(function() {
    $('.bar span').fadeIn('slow');
  }, 1000);
  
});

$( "#user-rating" ).change(function() {
	alert("toto");
	$.getJSON( "../userBiere/{{ $biere->id_biere }}/{{ Auth::user()->getAuthIdentifier() }}/" + $( '#user-rating' ).val(), 
		function(data)
		{
			if($( '#user-rating' ).val() == -1)
				$("#user_rate_num").html("Non not&eacute;e");
			else
				$("#user_rate_num").text($( '#user-rating' ).val());
		}
	)
});

</script>
@endif
@stop