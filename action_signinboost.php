<?php
if((isset($_POST['Username']) && !empty($_POST['Username'])) && isset($_POST['email']) && !empty($_POST['email']) &&
    (isset($_POST['password']) && !empty($_POST['password'])) && (isset($_POST['number']) && !empty($_POST['number'])))
{
    $username= $_POST['Username'];

    $password= $_POST['password'];
    $email=$_POST['email'];
    $number=$_POST['number'];
    $boost=0;
        $coach=0;
            $calibrate=0;
                $battlecup=0;
}
else
    exit("please enter all information needed" );
if(isset($_POST['boost'])){
    $boost=1;
}
if(isset($_POST['coach'])){
    $coach=1;
}
if(isset($_POST['calibrate'])){
    $calibrate=1;
}
if(isset($_POST['battlecup'])){
    $battlecup=1;
}
if(filter_var($email,FILTER_VALIDATE_EMAIL)===false)
    exit("pls enter a valid Email address");

$link=mysqli_connect("localhost","root","","ana");
if(mysqli_connect_errno())
    exit("this error happend:". mysqli_connect_error());

$query="INSERT INTO `boosters`(`username`, `email`, `password`, `number`, `boosterstat`, `coachstat`, `calibratestat`, `battlecupstat`)
 VALUES ('$username', '$email', '$password', '$number', '$boost', '$coach','$calibrate','$battlecup');";
if(mysqli_query($link,$query)===true)
{
    session_start();

    echo("<p style='color:green;'><b> $username </b></p>" );
    ?>

    <script>
        window.alert("your register was succesful" );
        location.replace("index.php")
    </script>

    <?php
}

else
    echo("<p style='color:red;'><b> عضویت شما با خطا مواجه شد(نام کاربری تکراری) </b> </p>");
mysqli_close($link);

?>
