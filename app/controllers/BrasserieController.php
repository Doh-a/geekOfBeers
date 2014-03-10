<?php

class BrasserieController extends BaseController
{

	/**
     * Return all the beers brewed by this brewery
     */
    public function brasseriePresentation($brasserie_id)
    {
        $brasserie = Brasserie::find($brasserie_id); 
		
		$bieres = Biere::where('brasserie', '=', $brasserie_id)->get();
		
		 foreach ($bieres as $tmpBiere) {
			$bieresShortView[] = View::make('biere/biere_short_view', array('biere' => $tmpBiere));
		}
		   
		return View::make('brasserie/brasserie', array('bieres' => $bieresShortView, 'brasserie' => $brasserie));
    }

}

?>
