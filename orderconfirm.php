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
$querydelete="DELETE FROM `finished` WHERE `ID`='$id'";
$final_querydelete= mysqli_query($link,$querydelete);
if($final_querydelete===true) {
    echo("<p style='color:red;'><b>ممنون از انتخاب شما!</b> </p>");
    mysqli_close($link);
    ?>
    <script>
        window.alert("از اینکه خدمات آانا بوستینگ را انتخاب کردید متشکریم!");
        location.replace("index.php")
    </script>

    <?php

} else
    echo("<p style='color:red;'><b> code is not working </b> </p>");

mysqli_close($link);


?>