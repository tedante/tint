<?php 

/**
* 
*/
class AdminController extends Controller
{
	
	function __construct() {
		parent::__construct();	
		$this->model = new AdminModel();	
	}

	function index() {
		$id = $_SESSION['id'];
		$data = $this->model->getById($id);
		$dataAudit = $this->model->getByIdAudit($id);
		// print_r($data);
		echo $this->view->render("admin.index2", ['data' => $data, 'dataAudit' => $dataAudit]);
	}

}

 ?>