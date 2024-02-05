<?php

$showError = "false";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include '_dbconnect.php';
    $user_name = $_POST['signupName'];
    $user_email = $_POST['signupEmail'];
    $pass = $_POST['signupPassword'];
    $cpass = $_POST['signupcPassword'];

    // check wether this email exist
    $existSql = "SELECT * FROM `user_table` WHERE user_email ='$user_email'";
    $result = mysqli_query($conn, $existSql);
    $numRows = mysqli_num_rows($result);
    if ($numRows > 0) {
        $showError = "Email already in use";
    } 
    else {
        if ($pass == $cpass) {
            $hash = password_hash($pass, PASSWORD_DEFAULT);
            $Sql = "INSERT INTO `user_table` (`usname`, `user_email`, `user_pass`, `timestamp`) VALUES ('$user_name', '$user_email', '$hash', current_timestamp())";
            
            $result = mysqli_query($conn, $Sql);
            if ($result) {
                $showAlert = true;
                header("Location: /forums/index.php?signupsuccess=true");
                exit();
            }
        } else {
            $showError = "Passwords do not match";
            
        }
    }
    header ("Location: /forums/index.php?signupsuccess=false&error=$showError");
}

?>