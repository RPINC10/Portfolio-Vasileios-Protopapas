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
	echo "my tutorName is: " . $tutorName. "<br>";
				

	$specific_tutor = Tutors::find_by_tutorName($tutorName);	//call the find_by_id() function; we identify the record to be updated; get all its values
				
	echo " <p> Use the following form to update the selected item <br> ";
	echo "ATTENTION: all *** fields must be numbers </p>";
			
				
	echo  "<form action=update.php?id=" . $tutorName . " method='post'>";
		echo "<table>";
			echo "<tr> <td> Type </td> <td> <input type='text' name ='type' value='$specific_vehicle->type' > </td> </tr>";
			echo "<tr> <td> Company </td> <td> <input type='text' name ='company' value='$specific_vehicle->company' > </td> </tr>";
			echo "<tr> <td> Year *** </td> <td> <input type='text' name ='year' value='$specific_vehicle->year' > </td> </tr>";
			echo "<tr> <td> Colour </td> <td> <input type='text' name ='colour' value='$specific_vehicle->colour' > </td> </tr>";
    		echo "<tr> <td> Description </td> <td> <textarea name='description' rows='5' cols='30'>$specific_vehicle->description</textarea> </td> </tr>";
    		echo "<tr> <td> Availability *** </td> <td> <input type='text' name ='available' value='$specific_vehicle->available' > </td> </tr>";
   			echo "<tr> <td> Cost per day *** </td> <td> <input type='text' name ='price' value='$specific_vehicle->price'> </td> </tr>";  
		echo "</table>";    
    		echo " <input type='submit' value='Update Record' />";
	echo "</form>";
		

?>

  	 </div>
  	 
  	 
<div class="footer">
  BIS Design & Development Module<br>
  Not real site
</div>

</body>


</html>
