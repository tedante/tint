<?php 

/**
* 
*/
class ProductController extends Controller
{
	private $categoryModel;
	function __construct() {
		parent::__construct();	
		$this->model = new ProductModel();	
		$this->categoryModel = new CategoryModel();	
	}

	function index() {
		$data = $this->model->get();
		$dataAudit = $this->model->getAudit();
		// print_r($data);
		echo $this->view->render("product.index", ['data' => $data, 'dataAudit' => $dataAudit]);
	}

	public function create() {
		$dataCategory = $this->categoryModel->get();
		echo $this->view->render("product.create", [ 'category' => $dataCategory]);
    	// code
    }

	public function store($data, $file) {
		// var_dump($file);die();
		// $lokasi_file = $files['photo']['tmp_name'];
		// $nama_file = $files['photo']['name'];
		// $tipe_file = $files['photo']['type'];
		// $ukuran_file = $files['photo']['size'];
		// $extensi = end(explode(".",$_FILES["photo"]["name"]));
		// $nama_photo = "user_".date("YmdHis")."_".$row["kode_user"].".".strtolower($extensi);
		//  if (move_uploaded_file($file["tmp_name"], $target_file)) {
	 //        echo "The file ". basename( $file["name"]). " has been uploaded.";
	 //    } else {
	 //        echo "Sorry, there was an error uploading your file.";
	 //    }
		// die();
		// var_dump($target_file);die();
		$target_dir = "resources/uploads/product/";
		$target_file = $target_dir . basename($file["name"]);
		$uploadOk = 1;
		$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
		move_uploaded_file($file["tmp_name"], $target_file);
		$info = $data;
		$info['photo'] = $target_file;
    	$store = $this->model->insert($info);
    	header("location:". Config::$baseurl ."index.php?controller=product&action=index");
    }

	public function show() {
    	// code
    }

	public function edit($id) {
    	$data = $this->model->getById($id);
		echo $this->view->render("product.edit", ['data' => $data]);
    }

	public function update() {
    	// code
    }

	public function destroy($id) {
    	$this->model->destroy($id);
    	header("location:". Config::$baseurl ."index.php?controller=product&action=index");
    }

}

 ?>