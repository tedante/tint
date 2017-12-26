<?php 

if (isset($_GET['controller']) && isset($_GET['action'])){
	$controller=$_GET['controller'];
	$action=$_GET['action'];
} else {
	$controller="";
	$action="";
}

if($controller == "login" && $action == "index") {
	$login->index();
} else if($controller == "login" && $action == "login_proccess") {
	if(isset($_POST['submit'])) {
		$data['username'] = $_POST['username'];
		$data['password'] = $_POST['password'];
		$login->login_proccess($data);	
	}
} else if($controller == "admin" && $action == "index"){
	SESSION::checkAuthAdmin();
	$admin->index();
} else if($controller == "login" && $action == "logout"){
	$login->logout();
}
else {
	$home->index();
}