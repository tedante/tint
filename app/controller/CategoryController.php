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

    public function show($id) {
    	$data = $this->model->getById($id);
    	// var_dump($data);die();
    	$xml_text = "<?xml version='1.0'?>\n<category>\n";
    	$xml_text .= "\t<category_id>".$data['CATEGORY_ID']."</category_id>\n";
    	$xml_text .= "\t<name>".$data['CATEGORY_NAME']."</name>\n";
    	$xml_text .= "\n</category>";
//membuat file
    	$file = fopen('xml/'.$data['CATEGORY_ID'].'.xml','w+');
//menulis di xml
    	fwrite($file, $xml_text);
//close the file handler
    	fclose($file);
    	// die();
    	if ($xml = simplexml_load_file('xml'.'/'.$data['CATEGORY_ID'].'.xml')) {
			foreach ($xml as $record) {
				$data['id'] = $record->category_id;
				$data['name'] = $record->name;
				// $exist=true;

				echo $this->view->render("category.show", ['data' => $data]);
			}
		}
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