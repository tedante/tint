<?php 

use duncan3dc\Laravel\BladeInstance;
/**
* 
*/
class Controller
{
	protected $view;
	
	public function __construct()
	{
		$this->view = new BladeInstance("./app/view", "./resources/cache/views");
	}
}

 ?>