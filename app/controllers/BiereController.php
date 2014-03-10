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

}

?>
