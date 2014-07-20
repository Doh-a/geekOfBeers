<?php

class BiereController extends BaseController
{

	/**
     * Return all the beers brewed by this brewery
     */
    public function biereDatasAsText($biere_id)
    {
        $biere = Biere::find($biere_id); 
		
		$couleur = Couleur::find($biere->couleur)->first();
		   
		return View::make('brasserie/brasserie', array('bieres' => $bieresShortView, 'brasserie' => $brasserie));
    }
	
	public function addForm()
	{
		//Beers datas
		$brasseries = Brasserie::orderBy('nom_brasserie', 'asc')->lists('nom_brasserie', 'id_brasserie');
		$couleurs = Couleur::orderBy('nom_couleur', 'asc')->lists('nom_couleur', 'id_couleur');
		$fermentations = Fermentation::orderBy('nom_fermentation', 'asc')->lists('nom_fermentation', 'id_fermentation');
		$maltages = Maltage::orderBy('nom_maltage', 'asc')->lists('nom_maltage', 'id_maltage');
		$typesAmericain = TypeAmericain::orderBy('nom_type', 'asc')->lists('nom_type', 'id_type');
		$typesBelge = TypeBelge::orderBy('nom_type2', 'asc')->lists('nom_type2', 'id_type2');
	
		$initBrasseries = array(
			-2 => "-----------",
			-1 => "Nouvelle brasserie",
		);
		$brasseries = $initBrasseries + $brasseries;
		
		//breweries datas
		$countries = Country::orderBy('name', 'asc')->lists('name', 'id_country');
	
		//Ok lets send of all this
		return View::make('biere/add', array('brasseriesList' => $brasseries, 'couleursList' => $couleurs, 'fermentationsList' => $fermentations, 'maltagesList' => $maltages, 'typesAmericainList' => $typesAmericain, 'typesBelgeList' => $typesBelge, 'countriesList' => $countries));
	}
	
	public function addBiere()
	{
		//TODO : traiter les cas où des champs obligatoires n'ont pas été remplis
		
		//TODO : ajouter la biere et s'assurer que le cas est bien traite.
		$newBrasserie = false;
		if(Input::get('addBrasserie') == "true")
		{
			$brasserie = new Brasserie;
			
			$brasserie->nom_brasserie = Input::get('brewerie_name');
			$brasserie->country = Input::get('country');
			$brasserie->description_brasserie = Input::get('brewerie_description');
			
			$brasserie->save();
			
			$newBrasserie = $brasserie->id_brasserie;
		}
		
		$biere = new Biere;
		
		//TODO : verifier token et format des donnees
		//TODO : ajouter l'etiquette
		$biere->nom_biere = Input::get('beer_name');
		$biere->degre = Input::get('beer_degres');
		if($newBrasserie != false)
			$biere->brasserie = $newBrasserie;
		else
			$biere->brasserie = Input::get('brasserie');
		$biere->couleur = Input::get('couleur');
		$biere->fermentation = Input::get('fermentation');
		$biere->maltage = Input::get('maltage');
		$biere->type = Input::get('typeAmericain');
		$biere->type2 = Input::get('typeBelge');
		
		$biere->save();
		
		$newBeerId = $biere->id_biere;
		
		//TODO : rediriger vers la page biere avec une confirmation de l'ajout
		$this->bierePresentation($newBeerId);
	}
	
	public function bierePresentation($biere_id)
	{
		$biere = Biere::find($biere_id); 
		
		//Get the user feedback about this beer
		if(Auth::user())
			$biereUser = UserBiere::where("id_user", "=", Auth::user()->getAuthIdentifier())->where("id_biere", "=", $biere_id)->first();
		else
			$biereUser = null;
			
		//Get the community notations about this beer
		$biereRates = DB::table('user_biere')
                     ->select(DB::raw('note_biere, count(*) as rate_count'))
                     ->groupBy('note_biere')
					 ->where('id_biere', '=', $biere_id)
                     ->get();
		
		$biereFinalRates = array(0,0,0,0,0,0);
		$biereFinalPercents = array(0,0,0,0,0,0);
		$totalVotes = 0;
		$totalPoints = 0;
		
		foreach($biereRates as $tmpRate)
		{
			$biereFinalRates[$tmpRate->note_biere] += $tmpRate->rate_count;
			$totalVotes += $tmpRate->rate_count;
			$totalPoints += $tmpRate->rate_count * $tmpRate->note_biere;
		}
		
		for($i = 0; $i < 5; $i++)
			if($totalVotes > 0)
				$biereFinalPercents[$i+1] = round($biereFinalRates[$i+1] / $totalVotes * 100);
		
		$biereAverageRate = 0;
		if($totalVotes > 0)
			$biereAverageRate = round($totalPoints/$totalVotes, 2);
		
		return View::make('biere/presentation', array('biere' => $biere, 'biereUser' => $biereUser, 'biereAverageRate' => $biereAverageRate, 'biereTotalVotes' => $totalVotes, 'biereRates' => $biereFinalRates, 'bierePercents' => $biereFinalPercents));
	}
}

?>
