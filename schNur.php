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

    $stime = $_POST['stime'];
    $the_time = date('h:i A', strtotime($stime));

    try 
    {
        $connection = new PDO($dsn, $username, $password, $options);
        $new_user = array(
            "idNurse"         => $_POST['idNurse'],
            "dayOfWeek"         => $_POST['dayOfWeek'],
            "stime"              => $the_time,
            "status"            => $_POST['status']
        );
        $sql = sprintf(
                "INSERT INTO %s (%s) values (%s)",
                "schedNurse",
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
	<blockquote><?php echo $_POST['idNurse']; ?> successfully added.</blockquote>
<?php 
} ?>

<div class="container">
    <div class="row">
        <head>
            <h1>Available Schedule</h1>
            <script type='text/javascript' src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        </head>
        <body style="margin: 30px">
            <div class="container">
                <div class="tab-content">
                    <div class="tab-pane active" id="summary">
                            <div class="panel panel-default">
                                <div class = "panel-body">
                                     <div class="container">
                                        <table class="table table-bordered">
                                            <tbody>
                                                <form method="post">
                                                    	<tr>
                                                        	<th scope="row"><label for="idNurse">Nurse Id Number</label></th>
                                                			<td><input type="text" name="idNurse" id="idNurse"></td>
                                                    	</tr>
                                                        <tr>
                                                            <th scope="row"><label for="dayOfWeek">Day of Week</label></th>
                                                            <td><input type="text" name="dayOfWeek" id="dayOfWeek"></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><label for="stime">Time</label></th>
                                                            <td><input type="time" name="stime" id="stime"></td>
                                                        </tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="status">Status(0 - available / 1 - Not)</label></th>
                                                        	<td><input type="text" name="status" id="status"></td>
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
        </body>
    </div>
</div>

<a href="ClinicStaff.php">Back to Medical Staff Management</a>



