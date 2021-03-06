<?php

/**
 * Function to query information based on 
 * a parameter: in this case, location.
 *
 */

if (isset($_POST['submit'])) 
{
	
	try 
	{	
		require "config.php";
		require "common.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT * 
						FROM Allergy as a inner join Patient as p
						ON a.idPatient = p.idPatient
						WHERE p.idPatient = :idPatient";

		$idPatient = $_POST['idPatient'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':idPatient', $idPatient, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	}
	
	catch(PDOException $error) 
	{
		echo $sql . "<br>" . $error->getMessage();
	}
}
?>

<?php 
if (isset($_POST['submit'])) 
{ 

	if ($result && $statement->rowCount() > 0) 
	{ ?>
		<h2>Allergy History</h2>

		<table>
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Patient ID Number</th>
					<th>Date of Visit</th>
					<th>Name of Allergy</th>
					<th>Description of Allergy</th>
				</tr>
			</thead>
			<tbody>
	<?php 
		foreach ($result as $row) 
		{ ?>
			<tr>
				<td><?php echo escape($row["first_name"]); ?></td>
				<td><?php echo escape($row["last_name"]); ?></td>
				<td><?php echo escape($row["idPatient"]); ?></td>
				<td><?php echo escape($row["dov"]); ?></td>
				<td><?php echo escape($row["allergy_name"]); ?></td>
				<td><?php echo escape($row["description"]); ?></td>
			</tr>
		<?php 
		} ?>
		</tbody>
	</table>
	<?php 
	} 
	else 
	{ ?>
		<blockquote>No results found for <?php echo escape($_POST['idPatient']); ?>.</blockquote>
	<?php
	} 
}?> 

<h2>View Patient Allergy History</h2>

<form method="post">
	<label for="idPatient">idPatient</label>
	<input type="text" id="idPatient" name="idPatient".>
	<input type="submit" name="submit" value="View Results">
</form>
	
<a href="Patient.php">Back to Patient Management</a>

