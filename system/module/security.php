<?php 

session_start();

/**
* 
*/
class Session 
{
	function __construct() {

		
	}

	public static function checkAuthAdmin()
	{
		// $_SESSION['login'] = FALSE;
		if ($_SESSION['login'] == TRUE && $_SESSION['username'] == "admin") {
			return TRUE;
		} else {
			header("location:index.php?controller=home&action=index");
		}
	}
}


 ?>