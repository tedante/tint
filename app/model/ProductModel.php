<?php 

/**
* 
*/
class ProductModel extends Model
{
	
	public function get()
	{
		$query = "SELECT * FROM TB_PRODUCT JOIN TB_CATEGORY ON TB_PRODUCT.CATEGORY=TB_CATEGORY.CATEGORY_ID WHERE TB_PRODUCT.DELETED_AT IS NULL";
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
		$query = "SELECT * FROM TB_PRODUCT WHERE PRODUCT_ID='$id'";
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
		$query = "SELECT * FROM TB_AUDIT WHERE TB_NAME='tb_product'";
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
		// var_dump($data);die();
		$query = "INSERT INTO TB_PRODUCT (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRODUCT_DESC, PRODUCT_PRICE, PRODUCT_STOK, PHOTO) VALUES (seq_product_id.nextval, '".$data['name']."', ".$data['category'].", '".$data['desc']."', ".$data['price'].", ".$data['stok'].", '".$data['photo']."')";
		$oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
	    	// var_dump($oracle);
	    	// die();
	    // INSERT INTO TB_PRODUCT (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRODUCT_DESC, PRODUCT_PRICE, PRODUCT_STOK, PHOTO) VALUES (seq_product_id.nextval, 'a', 1, 'a', 2, 2, 'c'
	}

	public function destroy($id) {
		$query = "UPDATE TB_CATEGORY SET DELETED_AT=current_timestamp WHERE CATEGORY_ID=$id"; 
		$oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
	}
}

 ?>