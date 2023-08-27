<?php

require_once('credentials.php');
require_once('database_functions.php');
require_once('class_tutors.php');



$database = db_connect(); // call the connection; 

Tutors::set_database($database); // class 'becomes aware'about the database 




?>