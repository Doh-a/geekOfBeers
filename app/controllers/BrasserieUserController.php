<?php

class BrasserieUserController extends BaseController
{

	 /**
     * Return all the beers of this brewery already tried by this user
     */
    public function bieresTestee($brasserie_id, $user_id)
    {
	   $brasserie = Brasserie::find($brasserie_id); 
		
		$bieresTestees = DB::table('biere')
			->where('brasserie', '=', $brasserie_id)
            ->whereExists(function($query)
            {
                $query->select(DB::raw(1))
                      ->from('user_biere')
                      ->whereRaw('user_biere.id_user = 22 AND user_biere.id_biere = biere.id_biere');
            })
            ->count();
			
		$bieresTotal = DB::table('biere')
			->where('brasserie', '=', $brasserie_id)
            ->count();
		
		$response = array(
            'total' => $bieresTotal,
            'tested' => $bieresTestees,
        );
		   
		return Response::json( $response );
    }

}

?>
