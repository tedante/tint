<?php 

/**
* 
*/
class Connection
{
	protected $koneksi = NULL;
	
	function __construct() {
		if (!$koneksi) {
			$this->index();
		}
	}

	public function index()
	{
		$koneksi = oci_connect(Config::$username(), Config::$password(), Config::$database());
		if (!$koneksi) {
			$err = oci_error();
			echo "Gagal tersambung ke ORACLE". $err['text'];
		}
	}
}

?>