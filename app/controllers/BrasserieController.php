<?php

class BrasserieController extends BaseController
{

	/**
     * Return all the beers brewed by this brewery
     */
    public function brasseriePresentation($brasserie_id)
    {
        //Find main dta about this brewery
		$brasserie = Brasserie::find($brasserie_id); 
		
		//Find the country :
		$country = Country::find($brasserie->country);
		
		//Find the beers
		$bieres = Biere::where('brasserie', '=', $brasserie_id)
					->get();
		
		$bieresShortView = array();
		foreach ($bieres as $tmpBiere) {
			$bieresShortView[] = View::make('biere/biere_short_view', array('biere' => $tmpBiere));
		}
		
		//Find the fans :
		$fans = User::join('user_brasserie', 'user_brasserie.id_user', '=', 'users.id')
							->where('id_brasserie', '=', $brasserie_id)
							->where('fan', '=', '1')
							->get();
		
		//Find and group the beers per color :
		$colorsRate = Biere::select(DB::raw('couleur, COUNT(*) as count, biere_couleur.nom_couleur'))
							->where('brasserie', '=', $brasserie_id)
							->groupBy('biere.couleur')
							->join('biere_couleur', 'biere_couleur.id_couleur', '=', 'biere.couleur')
							->get();

		//Find and group all rates about this brewery
		$breweryRatesSQL = UserBiere::select(DB::raw('note_biere, COUNT(*) as total'))
							->join('biere', 'biere.id_biere', '=', 'user_biere.id_biere')
							->where('brasserie', '=', $brasserie_id)
							->groupBy('note_biere')
							->get();
							
		$breweryRates = array(0,0,0,0,0,0);
		$breweryPercents = array(0,0,0,0,0,0);
		$breweryAverageRate = 0;
		$breweryTotalVotes = 0;
		
		foreach($breweryRatesSQL as $tmpRate)
		{
			$breweryTotalVotes += $tmpRate->total;
			$breweryAverageRate += $tmpRate->total*$tmpRate->note_biere;
			$breweryRates[round($tmpRate->note_biere)] = $tmpRate->total;
		}
		
		if($breweryTotalVotes > 0)
		{
			$breweryAverageRate = $breweryAverageRate/$breweryTotalVotes;
			for($i = 0; $i < 5; $i++)
			{
				$breweryPercents[$i+1] = round($breweryRates[$i+1] * 100 / $breweryTotalVotes,2);
			}
		}
		else
			$breweryAverageRate = 0;
							
		//Find more datas about beers :
		$beersProduced = Biere::where('brasserie', '=', $brasserie_id)
							->where('still_available', '=', '1')
							->count();
		
		return View::make('brasserie/brasserie', array(	'bieres' => $bieresShortView, 
														'brasserie' => $brasserie, 
														'fans' => $fans, 
														'fansTotal' => count($fans), 
														'colorsRate' => $colorsRate, 
														'country' => $country, 
														'beersProduced' => $beersProduced, 
														'beersTotal' => count($bieresShortView), 
														'breweryRates' => $breweryRates, 
														'breweryPercents' => $breweryPercents, 
														'breweryAverageRate' => $breweryAverageRate,
														'breweryTotalVotes' => $breweryTotalVotes
												));
    }

	/**
     * Return comments about brewery
     */
    public function brasserieComments($brasserie_id, $commentsNumber, $from)
    {
		$usersComments = User::select(DB::raw('users.id, users.username, user_brasserie.user_brasserie_id, user_brasserie.commentaire, user_brasserie.fan, user_brasserie.updated_at'))
							->join('user_brasserie', 'user_brasserie.id_user', '=', 'users.id')
							->where('id_brasserie', '=', $brasserie_id)
							->where('commentaire', '!=', '')
							->skip($from)
							->take($commentsNumber)
							->get();
		
		$comments = array();
		
		foreach($usersComments as $tmpUser)
		{
			$comments[]["id_user"] = $tmpUser->id;
			$comments[count($comments)-1]["avatar"] = $tmpUser->getAvatarId();
			$comments[count($comments)-1]["username"] = $tmpUser->username;
			$comments[count($comments)-1]["commentaire"] = $tmpUser->commentaire;
			$comments[count($comments)-1]["commentaire_id"] = $tmpUser->user_brasserie_id;
			$comments[count($comments)-1]["updated_at"] = date("d/m/y H:i", strtotime($tmpUser->updated_at));
			$comments[count($comments)-1]["fan"] = $tmpUser->fan;
		}
		
		return Response::json( $comments);
	}
}

?>
