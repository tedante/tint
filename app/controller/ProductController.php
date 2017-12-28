<?php 

/**
* 
*/
class ProductController extends Controller
{
	private $modelAdmin;
	function __construct() {
		parent::__construct();	
		$this->model = new ProductModel();	
		$this->modelAdmin = new AdminModel();	
	}

	function index() {
		$data = $this->model->getById($id);

		// $id = $_SESSION['id'];
		// $data .= $this->modelAdmin->getById($id);
		// $dataAudit .= $this->modelAdmin->getByIdAudit($id);
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