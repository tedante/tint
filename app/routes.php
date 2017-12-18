<?php 

if (isset($_GET['controller']) && isset($_GET['action'])){
	$controller=$_GET['controller'];
	$action=$_GET['action'];
} else {
	$controller="";
	$action="";
}

if($controller = "login" && $action = "index") {
	$login->index();
} else {
	$home->index();
}