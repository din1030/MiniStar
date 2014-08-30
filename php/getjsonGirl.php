<?php

$username = "root";
$database = "star";
mysql_connect(localhost, $username, "12345");


mysql_query("SET NAMES 'UTF8'");
@mysql_select_db($database) or die("QQ");

$query = "SELECT * FROM comment2";

$result = mysql_query($query) or die(mysql_error());

$num = mysql_numrows($result);

mysql_close();

$rows = array();
$data = array();
while($r = mysql_fetch_assoc($result))
{
	$rows[] = $r;
	$data['starComment'] = $rows;
}

	echo json_encode($data);

?>