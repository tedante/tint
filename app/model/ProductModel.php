<?php 

/**
* 
*/
class ProductModel extends Model
{
	
	public function get($id)
	{
		$query = "SELECT * FROM TB_PRODUCT WHERE PRODUCT_ID='".$id."'";
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

	public function getByIdAudit($id)
	{
		$query = "SELECT * FROM TB_AUDIT WHERE TB_NAME='tb_product' AND ID='".$id."'";
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

	public function insert($data)
	{
		
	}
}

 ?>