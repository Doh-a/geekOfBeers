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
					<img src="../assets/img/avatars/{{ Auth::user()->getAvatarId() }}_40.jpg" alt="Your avatar" class="img-rounded"> <b>Vous et cette brasserie</b>
				</div>
				<div id="user-context-content">
					<div id="achievementChart" style="width: 250px; height: 250px; margin: 0 auto"></div>
				</div>
			@endif
		</div>
	</div>
@stop

@section('more-content')

<div class="panel panel-default">
	<div class="panel-body">
		<b>Bi&egrave;res brass&eacute;es</b>
		
		@foreach($bieres as $biere)
			{{ $biere }}
		@endforeach
	</div>
</div>
@stop

{{-- Content --}}
@section('content')
<div class="panel panel-default">
	<div class="panel-body">
		<div id="alert_placeholder"></div>
		<h1>{{{ $brasserie->nom_brasserie }}}</h1>
		{{HTML::image((asset("assets/img/brasseries/$brasserie->img")), 'Logo', array("width" => "200px;", "align" => "left"))}}
		<p>{{{ $brasserie->description_brasserie }}}</p>
	</div>
</div>
@stop

@section('footer-scripts')

@if (Auth::check())
<script src="../assets/js/charts/highcharts.js"></script>
<script type="text/javascript">

$( document ).ready(function() {

	$.getJSON( "../brasseriesUser/{{ $brasserie->id_brasserie }}/{{ Auth::user()->getAuthIdentifier() }}", 
		function(data)
		{
			$('#achievementChart').highcharts({
				chart: {
					plotBackgroundColor: null,
					plotBorderWidth: 0,
					plotShadow: false
				},
				title: {
					text: '<h2>' + Math.round(data.tested * 100 / data.total) + '%</h2> <br />bieres degustees.',
					align: 'center',
					verticalAlign: 'middle',
					y: 80
				},
				tooltip: {
					pointFormat: ''
				},
				plotOptions: {
					pie: {
						dataLabels: {
							enabled: true,
							distance: -50,
							style: {
								fontWeight: 'bold',
								color: 'white',
								textShadow: '0px 1px 2px black'
							}
						},
						startAngle: -90,
						endAngle: 90,
						center: ['50%', '75%']
					}
				},
				series: [{
					type: 'pie',
					name: '% de bieres deja degustees de chez cette brasserie.',
					innerSize: '50%',
					data: [
						['Degustees',   data.tested],
						['A tester',       data.total - data.tested],
					]
				}]
			});
		}
	)
});
    
</script>
@endif

@stop