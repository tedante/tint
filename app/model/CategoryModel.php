<?php 

/**
* 
*/
class CategoryModel extends Model
{
	
	public function get()
	{
		$query = "SELECT * FROM TB_CATEGORY WHERE DELETED_AT IS NULL";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		$items = array();

		while ($baris = oci_fetch_assoc($oracle)) {
			$items[] = $baris;
		}
		// var_dump($data);
		// die();
		return $items;
	}

	public function getById($id)
	{
		$query = "SELECT * FROM TB_CATEGORY WHERE CATEGORY_ID='$id'";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		// $items = array();

		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	$items[] = $baris;
		// }
		$data = oci_fetch_assoc($oracle);
		return $data;
	}

	public function getAudit()
	{
		$query = "SELECT * FROM TB_AUDIT WHERE TB_NAME='tb_category'";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		$items = array();

		while ($baris = oci_fetch_assoc($oracle)) {
			$items[] = $baris;
		}
		// var_dump($data);
		// die();
		return $items;
	}

	public function insert($data)
	{
		$query = "INSERT INTO TB_CATEGORY (category_id, category_name) VALUES (seq_category_id.nextval, '".$data['name']."')";
		$oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
	    	// var_dump($oracle);
	    	// die();
	}

	public function destroy($id) {
		$query = "UPDATE TB_CATEGORY SET DELETED_AT=current_timestamp WHERE CATEGORY_ID=$id"; 
		$oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
	}
}

 ?>