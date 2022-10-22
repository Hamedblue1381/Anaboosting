<?php
session_start();
if (isset($_POST['id']) && isset($_POST['tablename']))  {
    $id = $_POST['id'];
    $table=$_POST['tablename'];
    echo $id;
    echo $table;
}
else
    exit("no orders selected");
$link=mysqli_connect("localhost","root","","ana");
if(mysqli_connect_errno())
    exit("this error happend:". mysqli_connect_errno());
$boostername=$_SESSION['username'];
$date = date('Y-m-d');
$selectquery="SELECT * FROM `$table` WHERE `ID`='$id'";
$result=mysqli_query($link,$selectquery);
$row=mysqli_fetch_array($result);
$accepted=$row['accepted'];
$finished=$row['finished'];
$username=$row['username'];

$query="INSERT INTO `inprogress`(`ID`, `username`, `booster_name`, `accepted`, `finished`)
 VALUES ('$id','$username','$boostername','$date','$finished') ";
if(mysqli_query($link,$query)===true) {


    echo("<p style='color:green;'><b>سفارش توسط شما دریافت شد </b></p>");

    ?>

    <script>
        window.alert("بزودی با شما تماس حاصل خواهد شد");
        location.replace("index.php")
    </script>

    <?php
}

else
    echo("<p style='color:red;'><b> code is not working </b> </p>");

mysqli_close($link);


?>