<?php 

/**
* 
*/
class HomeController extends Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->model = new ProductModel;
	}
	
	public function index()
	{	
		$data = $this->model->get();	
		echo $this->view->render("index", ['data' => $data]);
	}
}

 ?>