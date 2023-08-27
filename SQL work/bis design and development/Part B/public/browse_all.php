<?php
				require_once '../private/initialize.php';	//initialize the web site
?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Pick a Tutor</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel=stylesheet type=text/css href=style.css>
</head>

<body>
<div class="header">
	Tutors <br>
	Find all tutors needed
</div>

<div class="row">
  	<div class="column side">
   			<?php include 'navigation_all.html';?> 
	</div>
  	
<div class="column middle">
		
<?php 

				
				echo "<h2> Full list of actions </h2>";
				
				$tutor_array = tutors::find_all();	//call the find_all() function



		echo "<table border = 1 width=100%>";
			echo "<tr bgcolor=#ADD8E6>";
				echo "<th> tutorName </th>";
				echo "<th> emailAddress </th>";
				echo "<th> subjects </th>";
				echo "<th> &nbsp </th>";
				echo "<th> &nbsp </th>";
				echo "<th> &nbsp </th>";
			echo "</tr>";
  		

		foreach ($tutor_array as $tutor) {
			echo "<tr>";
				echo "<td>" . $tutor->tutorName . "</td>";
				echo "<td>" . $tutor->emailAddress . "</td>";	
				echo "<td>" . $tutor->subjects . "</td>";		
				echo "<td> <a href=view.php?tutorName=" . $tutor->id . "> View </td>";
				echo "<td> <a href=update.php?id=" . $tutor->id . "> Update </td>";
				echo "<td> <a href=> Delete </td>";		
		echo "</tr>";
}

		echo "</table>";
		
?>

</div>
  	 
  	 
<div class="footer">
  BIS Design & Development Module<br>
  Not real site
</div>

</body>


</html>
