<?php


//Here we are making a connection to the database by checking that all of the credentials match up and once thats confirmed the connection is returned 
function db_connect() {
	$database = new mysqli(DB_SERVER, DB_USER, DB_PASS, DB_NAME);  //create the object $connection
	confirm_db_connect($database);
	return $database; // the function returns the object $connection
	}

//If the database has connected and there are no errors then a messagge will appear saying it's successful 
function confirm_db_connect($database) {
	
	if($database->connect_errno==0) {
		//echo "Connection to DB succeed. <br>";	
	}
	
// If not however then it will give a message that it has failed
	if($database->connect_errno>0) {
		$msg = "Database connection failed: ";
		$msg .= $database->connect_error;
		$msg .= " (" . $database->connect_errno . ")";
		echo $msg;
		echo "<br>";	
	}
	}
	




?>