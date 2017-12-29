<?php 

/**
* 
*/
class OrderModel extends Model
{
	
	public function get()
	{
		$query = "SELECT * FROM TB_CART WHERE DELETED_AT IS NULL";
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
		$query = "SELECT * FROM TB_CART WHERE CART_ID='$id'";
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
		$query = "SELECT * FROM TB_AUDIT WHERE TB_NAME='tb_cart'";
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

	public function insert($data, $product)
	{
		// var_dump($data);die();
		$query = "INSERT INTO TB_ORDER (ORDER_ID, CART, BARANG, QTY) VALUES (seq_order_id.nextval, $data, $product, 1)";
		$oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
	    $query = "commit";
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

	public function statusCart($id) {
		$query = "SELECT * FROM TB_CART WHERE USER='$id' AND STATUS=1";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		// $items = array();

		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	$items[] = $baris;
		// }
		$data = oci_fetch_assoc($oracle);
		return $data;
	}
}

 ?>