<?php
$cmd="systemctl status stream.service | grep Active | grep running";
$status=exec($cmd, $out);
$label="Stop";
if ( $status == "" ) {
	$label="Start";
}
?>
<html>
<body>
<form method="POST" action="action.php">
<input style="font-size: 4em;" type="submit" name="submit" value="<?php echo $label;?>"></input>
</body>
</html>
