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
		$_SESSION['name'] = $data['USER_NAME'];
		$dataAudit = $this->model->getByIdAudit($id);
		// print_r($data);
		echo $this->view->render("admin.index2", ['data' => $data, 'dataAudit' => $dataAudit]);
	}

	public function create() {
    	// code
    }

	public function store() {
    	// code
    }

	public function show() {
    	// code
    }

	public function edit() {
    	// code
    }

	public function update() {
    	// code
    }

	public function destroy() {
    	// code
    }

}

 ?>