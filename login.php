<?php
  var_dump($_POST);
  $conn = mysqli_connect('classdb.it.mtu.edu', 'cjholmes', 'buddy', 'cjholmes');

  if(!$conn)
  {
	echo 'Database Error: ' . mysqli_connect_error();
	exit;
  }

  $sql = "SELECT username FROM users WHERE username = cjholmes";
  $result = mysqli_query($conn, $sql);
  while ($row = mysqli_fetch_array($result))
  {
	$results[] = $row['column'];
  }
  echo "<br />";
  echo "Welcome, ";
  echo $_POST["username"];
  date_default_timezone_set("America/Detroit");
  echo "! Today is ".date('m/d/y');
?>
