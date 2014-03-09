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
		   
		return View::make('brasserie/brasserie', array('bieres' => $bieres, 'brasserie' => $brasserie));
    }

}

?>
