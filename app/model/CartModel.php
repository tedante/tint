<?php 

/**
* 
*/
class CartModel extends Model
{
	
	public function get()
	{
		// $query = "SELECT * FROM TB_CART, TB_PRODUCT, TB_USER WHERE TB_CART.DELETED_AT IS NULL";
		$query = "SELECT * FROM TB_CART 
						join TB_ORDER 
						on TB_CART.CART_ID=TB_ORDER.CART
						join TB_PRODUCT
						on TB_ORDER.BARANG=TB_PRODUCT.PRODUCT_ID
						WHERE TB_CART.STATUS=0 AND TB_CART.DELETED_AT IS NULL";
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

	public function getTotal($id)
	{
		// $query = "SELECT * FROM TB_CART, TB_PRODUCT, TB_USER WHERE TB_CART.DELETED_AT IS NULL";
		$query = "SELECT sum(TB_PRODUCT.PRODUCT_PRICE) FROM TB_CART 
						join TB_ORDER 
						on TB_CART.CART_ID=TB_ORDER.CART
						join TB_USER
						on TB_USER.USER_ID=TB_CART.USER_ID
						join TB_PRODUCT
						on TB_ORDER.BARANG=TB_PRODUCT.PRODUCT_ID
						WHERE TB_USER.USER_ID=$id AND TB_CART.STATUS=0 AND TB_CART.DELETED_AT IS NULL";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		$items = oci_fetch_assoc($oracle);

		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	$items[] = $baris;
		// }
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

	public function insert($data)
	{
		// var_dump($data);die();
		$query = "INSERT INTO TB_CART (CART_ID, USER_ID, STATUS) VALUES (seq_cart_id.nextval, ".$data.", 0)";
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
		$query = "DELETE FROM TB_ORDER WHERE ORDER_ID=$id"; 
		$oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
	}

	public function statusCart($id) {
		$query = "SELECT * FROM TB_CART WHERE USER_ID='$id' AND STATUS=0";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		// $items = array();

		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	$items[] = $baris;
		// }
		$data = oci_fetch_assoc($oracle);
		// echo "string";
		// var_dump($data);die();
		return $data;
	}

	public function lastCart() {
		$query = "SELECT * FROM TB_CART ORDER BY CART_ID DESC";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		// $items = array();

		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	$items[] = $baris;
		// }
		$data = oci_fetch_assoc($oracle);

		return $data;
	}

	function buy($id)
	{
		$query = "UPDATE TB_CART SET STATUS=1 WHERE CART_ID=$id";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
	}
}
// echo "string";die();
 ?>