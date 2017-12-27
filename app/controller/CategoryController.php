<?php 

/**
* 
*/
class CategoryController extends Controller
{
	
	function __construct() {
		parent::__construct();	
		$this->model = new CategoryModel();	
	}

	function index() {
		$data = $this->model->getById($id);
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