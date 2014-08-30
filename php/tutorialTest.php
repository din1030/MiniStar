<?php

$username = "root";
$database = "star";

mysql_connect(localhost, $username, '12345');

mysql_select_db($database) or die("QQ");


$id = $_GET["id"];
$name = $_GET["name"];
$zodiac = $_GET["zodiac"];
$sex = $_GET["sex"];
$content = $_GET["content"];
$count = $_GET["count"];
$date = $_GET["date"];


$query1 = "INSERT INTO comment2 VALUES ('$id', '$name', '$zodiac',  '$sex', '$content', 'count', '$date' ) ";
mysql_query("SET NAMES 'utf8'");
mysql_query($query1) or die (mysql_error("error"));

$query2 = "SELECT * FROM  `comment2` ORDER BY  `id` ASC";
mysql_query("SET NAMES 'utf8'");
mysql_query($query2) or die (mysql_error("error"));

mysql_close();

/*$query = "INSERT INTO  `star`.`comment` (
`id` ,
`name` ,
`zodiac` ,
`sex` ,
`content` ,
`count` ,
`date`
)
VALUES ('$id', '$name', '$zodiac',  '$sex', '$content', 'count', '$date' )";

mysql_query($query) or die("QQQ");

mysql_close();*/

?>