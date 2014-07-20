<?php

class UserController extends BaseController
{
	public function userPresentation($user_id)
	{
		$user = User::find($user_id);
		
		//var_dump($user);
	}
}

?>
