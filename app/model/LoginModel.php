<?php 

/**
* 
*/
class LoginModel extends Model
{
	
	public function getLogin($data)
	{
		$query = "SELECT * FROM V_LOGIN WHERE USERNAME='".$data['username']."' AND PASSWORD='".$data['password']."'";
	    $oracle = oci_parse(Connection::index(), $query);
	    oci_execute($oracle);
		
		// while ($baris = oci_fetch_assoc($oracle)) {
		// 	print_r($baris);
		// }
		$data = oci_fetch_assoc($oracle);
		return $data;
	}
}

 ?>