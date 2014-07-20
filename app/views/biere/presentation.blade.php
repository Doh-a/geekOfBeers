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
						<span class="rating-num" id="user_rate_num">
						@if($biereUser != null)
							{{ $biereUser->note_biere }}
						@else
							Non not&eacute;e
						@endif
						</span>
						<input class="rating" data-max="5" data-min="1" data-clearable="&nbsp;" data-empty-value="-1" id="user-rating" name="user-rating" type="number" @if($biereUser != null) value="{{ round($biereUser->note_biere) }}" @endif />
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
					  <span class="rating-num">{{ $biereAverageRate }}</span>
					  <div class="rating-users">
						<i class="icon-user"></i> {{ $biereTotalVotes }} total
					  </div>
					</div>
					
					<div class="rate-histo">
					  <div class="five histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 5           </span>
						<span class="bar-block">
						  <span id="bar-five" class="bar">
							<span>{{ $biereRates[5] }}</span>&nbsp;
						  </span> 
						</span>
					  </div>
					  
					  <div class="four histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 4           </span>
						<span class="bar-block">
						  <span id="bar-four" class="bar">
							<span>{{ $biereRates[4] }}</span>&nbsp;
						  </span> 
						</span>
					  </div> 
					  
					  <div class="three histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 3           </span>
						<span class="bar-block">
						  <span id="bar-three" class="bar">
							<span>{{ $biereRates[3] }}</span>&nbsp;
						  </span> 
						</span>
					  </div>
					  
					  <div class="two histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 2           </span>
						<span class="bar-block">
						  <span id="bar-two" class="bar">
							<span>{{ $biereRates[2] }}</span>&nbsp;
						  </span> 
						</span>
					  </div>
					  
					  <div class="one histo-rate">
						<span class="histo-star">
						  <i class="active icon-star"></i> 1           </span>
						<span class="bar-block">
						  <span id="bar-one" class="bar">
							<span>{{ $biereRates[1] }}</span>&nbsp;
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
<script src="../assets/js/rating/bootstrap-rating-input.min.js" type="text/javascript"></script>

<script type="text/javascript">

/*
For stackoverflow question: http://stackoverflow.com/questions/17859134/how-do-i-create-rating-histogram-in-jquery-mobile-just-like-rating-bar-in-google#17859134
*/

$(document).ready(function() {
  $('.bar span').hide();
  $('#bar-five').animate({
     width: '{{ $bierePercents[5] }}%'}, 1000);
  $('#bar-four').animate({
     width: '{{ $bierePercents[4] }}%'}, 1000);
  $('#bar-three').animate({
     width: '{{ $bierePercents[3] }}%'}, 1000);
  $('#bar-two').animate({
     width: '{{ $bierePercents[2] }}%'}, 1000);
  $('#bar-one').animate({
     width: '{{ $bierePercents[1] }}%'}, 1000);
 
  setTimeout(function() {
    $('.bar span').fadeIn('slow');
  }, 1000);
});

@if (Auth::check())

$( "#user-rating" ).change(function() {
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
@endif
</script>
@stop