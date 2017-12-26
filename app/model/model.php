<?php 

/**
* 
*/
class Model
{
	
	function __construct()
	{
		
	}

	function get($table) {
		$query = "SELECT * FROM $table";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		$data = oci_fetch_assoc($oracle);
		return $data;
	}
	
}


 ?>