<?php
				require_once '../private/initialize.php';	//initialize the web site
?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel=stylesheet type=text/css href=style.css>
</head>

<body>
<div class="header">
	Rent a Vehicle <br>
	Motorcycles - Cars - Vans
</div>

<div class="row">
  	<div class="column side">
   			<?php include 'navigation_all.html';?> 
	</div>
  	<div class="column middle">
		
<?php 
			$id = $_GET['id'];
	
			if(!$id) {
						echo "problem - redirect";
				}	else {
						echo $id;
				}
				

				$specific_tutor = tutors::find_by_id($id);	//call the find_by_id() function
				
			echo " <p> Details of the selected item </p> ";
				
			echo "<table>";
			echo "<tr> <td><b> tutorName</b> </td> <td>" . $specific_tutor->tutorName . "</td> </tr>";
			echo "<tr> <td> <b> emailAddress </b> </td> <td>" . $specific_tutor->emailAddress . "</td> </tr>";
			echo "<tr> <td> <b> phoneNo </b> </td> <td>" . $specific_tutor->phoneNo . "</td> </tr>";
			echo "<tr> <td> <b> tLevel </b> </td> <td>" . $specific_tutor->tLevel . "</td> </tr>";
			echo "<tr> <td> <b> subjects </b> </td> <td>" . $specific_tutor->subjects . "</td> </tr>";
			echo "<tr> <td> <b> ratePHour </b> </td> <td>" . $specific_tutor->ratePHour . "</td> </tr>";
			echo "</table>";

?>

  	 </div>
  	 
  	 
<div class="footer">
  BIS Design & Development Module<br>
  Not real site
</div>

</body>


</html>
