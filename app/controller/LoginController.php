<?php 

/**
* 
*/
class LoginController extends Controller
{
	function __construct() {
		parent::__construct();
		$this->model = new LoginModel();
	}

	function index() {
		
		echo $this->view->render("Auth.index");
	}

	function login_proccess($data) {
		$login = $this->model->getLogin($data);
		// var_dump(count($login));
		// 	die();
		// echo $row;die();
		if(count($login) >= 1) {
            $_SESSION['login'] = true;
			$_SESSION["id"] = $login['USER_ID'];
			$_SESSION["username"] = $login['USERNAME'];
			// $_SESSION["level"] = $data['USER_LEVEL'];
			// var_dump($_SESSION);
			// die();
			if($_SESSION["username"] == 'admin') {
				header("location:index.php?controller=admin&action=index");
			} else {
				header("location:index.php?controller=user&action=index");
			}
		} else {
			header("location:index.php?controller=login&action=index");
		}
	}

	function logout() {
		session_unset(); 
		session_destroy();
		header("location:index.php?controller=home&action=index");
	}
}

 ?>