<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="example-count-with-distinct- php mysql examples | w3resource">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div class="row">
<div class="col-md-12">
<h2>Number of rooms Occupied By Wing</h2>
<table class='table table-bordered'>
<tr>
<th>Wing</th><th>Occupied Rooms</th><th>Available Rooms</th>
</tr>
<?php
$hostname="localhost";
$username="root";
$password="root";
$db = "term_project";
$dbh = new PDO("mysql:host=$hostname;dbname=$db", $username, $password);
foreach($dbh->query('SELECT wing,COUNT(DISTINCT(room))
FROM InPatient GROUP BY wing') as $row) {
echo "<tr>";
echo "<td>" . $row['wing'] . "</td>";
echo "<td>" . $row['COUNT(DISTINCT(room))'] . "</td>";
echo "<td>" . $row['COUNT(DISTINCT(room))'] . "</td>";
echo "</tr>";
}




?>
</tbody></table>
</div>
</div>
</div>
</body>
</html>

	
<a href="Patient.php">Back to Patient Management</a>

