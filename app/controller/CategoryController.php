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
		$data = $this->model->get();
		$dataAudit = $this->model->getAudit();
		// print_r($data);
		echo $this->view->render("category.index", ['data' => $data, 'dataAudit' => $dataAudit]);
	}

	public function create() {
		echo $this->view->render("category.create");
    	// code
    }

	public function store($data) {
    	$store = $this->model->insert($data);
    	header("location:". Config::$baseurl ."index.php?controller=category&action=index");
    }

	public function show() {
    	// code
    }

	public function edit($id) {
    	$data = $this->model->getById($id);
		echo $this->view->render("category.edit", ['data' => $data]);
    }

	public function update() {
    	// code
    }

	public function destroy($id) {
    	$this->model->destroy($id);
    	header("location:". Config::$baseurl ."index.php?controller=category&action=index");
    }

}

 ?>