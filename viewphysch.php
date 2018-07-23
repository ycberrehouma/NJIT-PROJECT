<?php

	
	try 
	{	
		require "config.php";
		require "common.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT * 
				FROM schedPhy as s 
				INNER JOIN Physician as p  
				INNER JOIN Staff as a 
				ON s.idPhysician = p.idPhysician and p.EmNo = a.EmNo
				WHERE p.idPhysician = :idPhysician";
		
		$idPhysician = $_POST['idPhysician'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':idPhysician', $idPhysician, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	}
	
	catch(PDOException $error) 
	{
		echo $sql . "<br>" . $error->getMessage();
	}

?>

<?php 
if (isset($_POST['submit'])) 
{ 

	if ($result && $statement->rowCount() > 0) 
	{ ?>
		<h2>Available Times</h2>

		<table>
			<thead>
				<tr>
					<th>Physician ID Number</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Day of the Week</th>
					<th>Available Time</th>
				</tr>
			</thead>
			<tbody>
	<?php 
		foreach ($result as $row) 
		{ ?>
			<tr>
				<td><?php echo escape($row["idPhysician"]); ?></td>
				<td><?php echo escape($row["first_name"]); ?></td>
				<td><?php echo escape($row["last_name"]); ?></td>
				<td><?php echo escape($row["dayOfWeek"]); ?></td>
				<td><?php echo escape($row["stime"]); ?></td>
			</tr>
		<?php 
		} ?>
		</tbody>
	</table>
	<?php 
	} 
	else 
	{ ?>
		<blockquote>No results found for <?php echo escape($_POST['idPhysician']); ?>.</blockquote>
	<?php
	} 
}?> 

<h2>Please Enter Physician ID to see available times</h2>

<form method="post">
	<label for="idPhysician">idPhysician</label>
	<input type="text" id="idPhysician" name="idPhysician".>
	<input type="submit" name="submit" value="View Results">
</form>
	
<a href="ClinicStaff.php">Back to Medical Staff Management</a>

