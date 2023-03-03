<?php 

//check if register form was submited
//by checking if the submit button element name was sent as part of the request

if (isset($_POST['Submit'])) 
{
	// echo "it works";
	//collection form data
	$user_name =  $_POST['uname'];
	$user_pass = $_POST['password'];
	$user_dob = $_POST['dob'];
	$user_fname = $_POST['fname'];
	$user_lname = $_POST['lname'];
	$user_address = $_POST['ad'];
	$user_gender = $_POST['gender'];
	$user_email = $_POST['e-mail'];
	$user_contact = $_POST['con'];
	$user_learnertype = $_POST['leatype'];

	// echo $user_gender;
	// echo "<br>";
	// echo $user_dob;



	//database connection parameters
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "ShiftingGears";

	// // Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// // Check connection
	if ($conn->connect_error) {
		//stop executing the code and echo error
	  die("Connection failed: " . $conn->connect_error);
	}else{
		// echo "connection works";
		// //encrypt password
		// //use the php password_hard function
		$encrypted_pass = password_hash($user_pass, PASSWORD_DEFAULT);
		
		
		// //write query
		$sql = "INSERT INTO Learner (last_name, first_name, gender, date_of_birth, learner_address, contact, email_address, learner_type, user_name, pass_word) VALUES ('$user_lname', '$user_fname', '$user_gender', '$user_dob', '$user_address', '$user_contact', '$user_email', $user_learnertype, '$user_name', '$encrypted_pass')";
		// echo $user_gender;
		
		// echo $sql;
		// $conn->query($sql);
		// // check if query worked
		if ($conn->query($sql) === TRUE) {
			echo "wow";
		  
			//redirect to homepage
			// header("Location: index.html");
			// exit();
		
		} else {
			echo "failed";
			// echo error but continue executing the code to close the session
		//   echo "Error: " . $sql . "<br>" . $conn->error;
		}
		
		// close database connection
		$conn->close();
	}

}
// else
// {
// 	//redirect to register page
// 	header("Location: signup.html");
// 	exit();
// }



?>