<?php 

/**
* 
*/
class AdminModel extends Model
{
	
	public function getById($id)
	{
		$query = "SELECT USER_ID, USER_NAME, USER_PHONE, USER_EMAIL FROM TB_USER WHERE USER_ID='".$id."'";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	print_r($baris);
		// }
		$data = oci_fetch_assoc($oracle);
		// var_dump($data);
		// die();
		return $data;
	}

	public function getByIdAudit($id)
	{
		$query = "SELECT * FROM TB_AUDIT WHERE TB_NAME='tb_user' AND ID='".$id."'";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	print_r($baris);
		// }
		$data = oci_fetch_assoc($oracle);
		// var_dump($data);
		// die();
		return $data;
	}
}

 ?>