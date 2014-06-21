<?php

class UserController extends BaseController
{

	/**
     * Return all the beers brewed by this brewery
     */
    public function listBeersTested($brasserie_id)
    {
		$bieres = Biere::where('brasserie', '=', $brasserie_id)->where('->get();
		
		 foreach ($bieres as $tmpBiere) {
			$bieresShortView[] = View::make('biere/biere_short_view', array('biere' => $tmpBiere));
		}
		   
		return View::make('brasserie/brasserie', array('bieres' => $bieresShortView, 'brasserie' => $brasserie));
    }

}

?>
