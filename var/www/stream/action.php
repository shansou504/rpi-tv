<?php
$response=$_POST['submit'];
$func="stop";
if ( $response == "Start" ) {
	$func="restart";
}
$cmd="sudo systemctl $func stream.service";
exec($cmd);
sleep(5);
header('Location: index.php');
exit;
?>
