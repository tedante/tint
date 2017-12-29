<?php 

/**
* 
*/
class CartController extends Controller
{
	private $productModel;
	private $userModel;
	private $orderModel;

	function __construct() {
		parent::__construct();	
		$this->model = new CartModel;	
		$this->userModel = new AdminModel;	
		$this->orderModel = new OrderModel;	
		$this->productModel = new ProductModel;	
	}

	function index() {
		$data = $this->model->get();
		// $data = $this->model->get();
		$jumlah = $this->model->getTotal($_SESSION['id']);
		// var_dump($jumlah['SUM(TB_PRODUCT.PRODUCT_PRICE)']);die();
		$dataAudit = $this->model->getAudit();
		// print_r($data);
		echo $this->view->render("cart.index", ['data' => $data, 'dataAudit' => $dataAudit, 'jumlah' => $jumlah['SUM(TB_PRODUCT.PRODUCT_PRICE)']]);
	}

	public function create() {
		$dataCategory = $this->categoryModel->get();
		echo $this->view->render("product.create", [ 'category' => $dataCategory]);
    	// code
    }

	public function store($product, $user) {
		$statusCart = $this->model->statusCart($user);
		$cart = $this->model->lastCart();
		// var_dump($statusCart);
		// var_dump(count($statusCart));
		// die();
		if(count($statusCart) > 1) {
			$this->orderModel->insert($cart['CART_ID'],$product);
			// echo "string";
			// die();
			$_SESSION['row_cart']+=1;
    	header("location:". Config::$baseurl ."index.php?controller=cart&action=index");
		} else {
			$this->model->insert($user);
			// echo "string";
			// die();
			$_SESSION['row_cart']+=1;
			$this->orderModel->insert($cart['CART_ID'], $product);
    	header("location:". Config::$baseurl ."index.php?controller=cart&action=index");
		}
    	// $store = $this->model->insert($info);
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
    	header("location:". Config::$baseurl ."index.php?controller=cart&action=index");
    }

	public function buy($id) {
    	$this->model->buy($id);
    	header("location:". Config::$baseurl ."index.php?controller=cart&action=index");
    }

}

 ?>