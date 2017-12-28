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

// Category Route Group
else if($controller == "category" && $action == "index"){
	$category->index();
} else if($controller == "category" && $action == "create"){
	$category->create();
} else if($controller == "category" && $action == "store"){
	if(isset($_POST['submit'])) {
		$data['name'] = $_POST['name'];
		$category->store($data);	
	}
} else if($controller == "category" && $action == "edit"){
	$id = $_GET['id'];
	$category->edit($id);
} else if($controller == "category" && $action == "destroy"){
	$id = $_GET['id'];
	$category->destroy($id);
}

// Category Route Group
else if($controller == "product" && $action == "index"){
	$product->index();
} else if($controller == "product" && $action == "create"){
	$product->create();
} else if($controller == "product" && $action == "store"){
	if(isset($_POST['submit'])) {
		// var_dump($_POST);var_dump($_FILES['photo']);die();
		$product->store($_POST, $_FILES['photo']);	
	}
} else if($controller == "product" && $action == "edit"){
	$id = $_GET['id'];
	$product->edit($id);
} else if($controller == "product" && $action == "destroy"){
	$id = $_GET['id'];
	$product->destroy($id);
}
else {
	$home->index();
}