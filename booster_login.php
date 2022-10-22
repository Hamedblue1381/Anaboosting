
<?php
session_start();
$_SESSION["status"]=false;
if(isset($_POST['uname']) && !empty($_POST['uname']) && isset($_POST['psw']) && !empty($_POST['psw']))
{
    $username= $_POST['uname'];
    $password= $_POST['psw'];


}
else
    exit("wrong username or password");
$link=mysqli_connect("localhost","root","","ana");
if(mysqli_connect_errno())
    exit("this error happend:". mysqli_connect_errno());
$query="SELECT * FROM boosters WHERE username='$username' AND password='$password'";
$result=mysqli_query($link,$query);
$row=mysqli_fetch_array($result);
if($row) {
    $_SESSION["status"]=true;
    $_SESSION['username']=$row['username'];
    $_SESSION['number']=$row['number'];
    $_SESSION['boost_type']=$row['boosterstat'];
    $_SESSION['coach_type']=$row['coachstat'];
    $_SESSION['calib_type']=$row['calibratestat'];
    $_SESSION['bcup_type']=$row['battlecupstat'];

if($row['score']<0){
    mysqli_query($link,"DELETE FROM `boosters` WHERE `score` < -2;");
    echo ("YOU ARE BLACKLISTED");
}

 ?>

    <script>
        window.alert("Welcome to Site");
        location.replace("index.php");
    </script>

    <?php


}
else
    echo("<h3 style='color:red;'><b> your username is not allowed to login </b></h3>");


?>
