<?php

class BiereUserController extends BaseController
{

	 /**
     * Return all the beers of this brewery already tried by this user
     */
    public function rateBiere($biere_id, $user_id, $newNote)
    {
	    $biereUser = UserBiere::where("id_user", "=", $user_id)->where("id_biere", "=", $biere_id)->first();
		
		$response = 0;
		
		if($biereUser != null)
		{
			if($newNote == -1)
			{
				$biereUser->delete();
			}
			else
			{
				$biereUser->note_biere = $newNote;
				$reponse = $biereUser->save();
			}
		}
		else
		{
			if($newNote != -1)
			{
				$newBiereUser = new UserBiere;
				$newBiereUser->id_user = $user_id;
				$newBiereUser->id_biere = $biere_id;
				$newBiereUser->note_biere = $newNote;
				$response = $newBiereUser->save();
			}
		}
		   
		return Response::json( array('response' => $response) );
    }

}

?>
