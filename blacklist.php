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

$selectboosterquery="SELECT * FROM $table WHERE `ID`='$id'";
$resultbooster=mysqli_query($link,$selectboosterquery);
$rowbooster=mysqli_fetch_array($resultbooster);
$boostername=$rowbooster['booster_name'];
    $querydelete="DELETE FROM `boosters` WHERE `username`='$boostername'";
    $final_querydelete= mysqli_query($link,$querydelete);
$querydelete2="DELETE FROM `finished` WHERE `ID`='$id'";
$final_querydelete2= mysqli_query($link,$querydelete2);
    if($final_querydelete && $final_querydelete2===true) {
        echo("<p style='color:red;'><b> YOU ARE BLACKLISTED </b> </p>");
        mysqli_close($link);
        ?>
        <script>
            window.alert("بوستر مورد نظر بلک لیست شد");
            location.replace("index.php")
        </script>

        <?php

    } else { exit();}
?>