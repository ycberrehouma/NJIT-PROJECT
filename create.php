<?php
/**
 * Use an HTML form to create a new entry in the
 * users table.
 *
 */
if (isset($_POST['submit']))
{
	
	require "config.php";
	require "common.php";
	
	try 
	{
		$connection = new PDO($dsn, $username, $password, $options);
		
		$new_user = array(
			"first_name" 	=> $_POST['first_name'],
			"last_name"  	=> $_POST['last_name'],
			"gender"     	=> $_POST['gender'],
			"ssn"       	=> $_POST['ssn'],
			"street"  		=> $_POST['street'],
			"city"  		=> $_POST['city'],
			"state" 		=> $_POST['state'],
			"zip"  			=> $_POST['zip'],
			"phone"  		=> $_POST['phone']
		);
		$sql = sprintf(
				"INSERT INTO %s (%s) values (%s)",
				"People",
				implode(", ", array_keys($new_user)),
				":" . implode(", :", array_keys($new_user))
		);
		
		$statement = $connection->prepare($sql);
		$statement->execute($new_user);
	}
	catch(PDOException $error) 
	{
		echo $sql . "<br>" . $error->getMessage();
	}
	
}
?>



<?php 
if (isset($_POST['submit']) && $statement) 
{ ?>
	<blockquote><?php echo $_POST['first_name']; ?> successfully added.</blockquote>
<?php 
} ?>

<h2>Add a user</h2>

<div class="containter">
    <div class="row">
        <head>
            <h1>Patient Management</h1>
            <script type='text/javascript' src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        </head>
        <body style="margin: 30px">
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#summary" data-toggle="tab">Patient Records</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="summary">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-titel">
                                        <a data-toggle="collapse" data-parent = "#accordion" href = "#collapseOne">Add New Patient Record </a>
                                    </h4>
                                </div>
                                <div id = "collapseOne" class = "panel-collapse collapse">
                                    <div class = "panel-body">
                                        <div class="container">
                                            <table class="table table-bordered">
                                            	<tbody>
                                                	<form method="post">
                                                    	<tr>
                                                        	<th scope="row"><label for="first_name">First Name</label></th>
                                                			<td>]<input type="text" name="first_name" id="first_name"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="last_name">Last Name</label></th>
                                                        	<td><input type="text" name="last_name" id="last_name"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="gender">Gender</label></th>
                                                        	<td><input type="text" name="gender" id="gender"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="ssn">Social Security Number</label></th>
                                                        	<td><input type="text" name="ssn" id="ssn"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="street">Street</label></th>
                                                        	<td><input type="text" name="street" id="street"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="city">City</label></th>
                                                        	<td><input type="text" name="city" id="city"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="state">State</label></th>
                                                        	<td><input type="text" name="state" id="state"></td>
                                                    	</tr>
                                                   		<tr>
                                                        	<th scope="row"><label for="zip">Zip Code</label></th>
                                                        	<td><input type="text" name="zip" id="zip"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="phone">Phone Number</label></th>
                                                        	<td><input type="text" name="phone" id="phone"></td>
                                                    	</tr>
                                                    	<input type="submit" name="submit" value="Submit" button type="button" class="btn btn-success">
                                                	</form>
                                                </tbody>
                                			</table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </div>
</div>



