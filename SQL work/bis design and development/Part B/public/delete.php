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
			$tutorName = $_GET['tutorName'];
	

			$deleted_tutor = tutors::find_by_id($id); 
			$deleted_tutor -> delete();
				
				
			echo "<p> The following entry is deleted </p>";
				
			echo "<table>";
			echo "<tr> <td><b> Vehicle id </b> </td> <td>" . $deleted_vehicle->id . "</td> </tr>";
			echo "<tr> <td> <b> Type </b> </td> <td>" . $deleted_vehicle->type . "</td> </tr>";
			echo "<tr> <td> <b> Company </b> </td> <td>" . $deleted_vehicle->company . "</td> </tr>";
			echo "<tr> <td> <b> Year </b> </td> <td>" . $deleted_vehicle->year . "</td> </tr>";
			echo "<tr> <td> <b> Colour </b> </td> <td>" . $deleted_vehicle->colour . "</td> </tr>";
			echo "<tr> <td> <b> Description </b> </td> <td>" . $deleted_vehicle->description . "</td> </tr>";
			echo "<tr> <td> <b> Availability </b> </td> <td>" . $deleted_vehicle->available . "</td> </tr>";
			echo "<tr> <td> <b> Cost per day </b> </td> <td>" . $deleted_vehicle->price . "</td> </tr>";
			echo "</table>";

?>

  	 </div>
  	 
  	 
<div class="footer">
  BIS Design & Development Module<br>
  Not real site
</div>

</body>


</html>
