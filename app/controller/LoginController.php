<?php 

/**
* 
*/
class LoginController extends Controller
{
	
	function __construct()
	{
		parent::__construct();
	}

	function index() {
		echo $this->view->render("Auth.index");
	}
}

 ?>