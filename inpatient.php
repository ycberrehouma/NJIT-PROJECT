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
    
    $date_inArr = array($_POST['year'], $_POST['month'], $_POST['day']);
    $dateOfVisitIn = implode('-', $date_inArr);

    $date_outArr = array($_POST['year'], $_POST['month'], $_POST['day']);
    $dateOfVisitOut = implode('-', $date_outArr);

    try 
    {
        $connection = new PDO($dsn, $username, $password, $options);
        $new_user = array(
            "idPatient"         => $_POST['idPatient'],
            "idPhysician"       => $_POST['idPhysician'],
            "idNurse"           => $_POST['idNurse'],
            "idPrescription"    => $_POST['idPrescription'],
            "date_in"           => $dateOfVisitIn,
            "date_out"          => $dateOfVisitOut,
            "nursing_unit"      => $_POST['nursing_unit'],
            "wing"              => $_POST['wing'],
            "room"              => $_POST['room'],
            "bed"               => $_POST['bed']
        );
        $sql = sprintf(
                "INSERT INTO %s (%s) values (%s)",
                "InPatient",
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
	<blockquote><?php echo $_POST['idPatient']; ?> successfully added.</blockquote>
<?php 
} ?>

<div class="container">
    <div class="row">
        <head>
            <h1>Add to Hospital/In-Patient Stay</h1>
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
                                                        	<th scope="row"><label for="idPatient">Patient Id Number</label></th>
                                                			<td><input type="text" name="idPatient" id="idPatient"></td>
                                                    	</tr>
                                                        <tr>
                                                            <th scope="row"><label for="idPhysician">Attending Physician Id Number</label></th>
                                                            <td><input type="text" name="idPhysician" id="idPhysician"></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><label for="idNurse">Attending Nurse Id Number</label></th>
                                                            <td><input type="text" name="idNurse" id="idNurse"></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><label for="idPrescription">Presciption Id Number</label></th>
                                                            <td><input type="text" name="idPrescription" id="idPrescription"></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><label for="date_in">Check-In Date</label></th>
                                                            <td><select name = "month"><option>Month</option>
                                                                    <?php
                                                                        for($month = 1; $month <= 12; $month++){
                                                                            echo"<option value = '".$month."'>".$month."</option>";
                                                                        }
                                                                    ?>
                                                                </select>
                                                                <select name = "day"><option>Day</option>
                                                                    <?php
                                                                        for($day = 1; $day <= 31; $day++){
                                                                            echo "<option value = '".$day."'>".$day."</option>";
                                                                        }
                                                                    ?>
                                                                </select>
                                                                <select name = "year"><option>Year</option>
                                                                    <?php
                                                                        $y = date("Y", strtotime("+8 HOURS"));
                                                                        for($year = 1950; $y >= $year; $y--){
                                                                            echo "<option value = '".$y."'>".$y."</option>";
                                                                        }
                                                                    ?>
                                                                </select></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><label for="date_out">Check-Out Date</label></th>
                                                            <td><select name = "month"><option>Month</option>
                                                                    <?php
                                                                        for($month = 1; $month <= 12; $month++){
                                                                            echo"<option value = '".$month."'>".$month."</option>";
                                                                        }
                                                                    ?>
                                                                </select>
                                                                <select name = "day"><option>Day</option>
                                                                    <?php
                                                                        for($day = 1; $day <= 31; $day++){
                                                                            echo "<option value = '".$day."'>".$day."</option>";
                                                                        }
                                                                    ?>
                                                                </select>
                                                                <select name = "year"><option>Year</option>
                                                                    <?php
                                                                        $y = date("Y", strtotime("+8 HOURS"));
                                                                        for($year = 1950; $y >= $year; $y--){
                                                                            echo "<option value = '".$y."'>".$y."</option>";
                                                                        }
                                                                    ?>
                                                                </select></td>
                                                        </tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="nursing_unit">Nursing Unit</label></th>
                                                        	<td><input type="text" name="nursing_unit" id="nursing_unit"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="wing">Wing</label></th>
                                                        	<td><input type="text" name="wing" id="wing"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="room">Room</label></th>
                                                        	<td><input type="text" name="room" id="room"></td>
                                                    	</tr>
                                                    	<tr>
                                                        	<th scope="row"><label for="bed">Bed</label></th>
                                                        	<td><input type="text" name="bed" id="bed"></td>
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
        </body>
    </div>
</div>

<a href="in_patient.php">Back to In-Patient Management</a>



