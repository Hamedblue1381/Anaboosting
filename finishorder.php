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
$date = date('Y-m-d');

$boostername=$_SESSION['username'];

$selectquery="SELECT * FROM `inprogress` WHERE `ID`='$id'";
$result=mysqli_query($link,$selectquery);
$row=mysqli_fetch_array($result);
$selectboosterquery="SELECT * FROM `boosters` WHERE `username`='$boostername'";
$resultbooster=mysqli_query($link,$selectboosterquery);
$rowbooster=mysqli_fetch_array($resultbooster);
$score=$rowbooster['score'];


if ($score<-5){
    $querydelete="DELETE FROM `boosters` WHERE `username`='$boostername'";
    $final_querydelete= mysqli_query($link,$querydelete);
    if($final_querydelete===true){
        echo("<p style='color:red;'><b> YOU ARE BLACKLISTED </b> </p>");
        mysqli_close($link);
        ?>
        <script>
            window.alert("شما به علت امتیاز پایین بلک لیست شدید");
            location.replace("logout.php")
        </script>

        <?php
    }
} else {
//echo $score;
    $accepted = $row['accepted'];
    $finished = $row['finished'];
    $username = $row['username'];
    $startdate = new DateTime($accepted);
    $enddate = new DateTime($date);
    $diff = date_diff($enddate, $startdate);
    $daysdiff = $diff->format('%d');

    if ($daysdiff > 7) {
        $score += -2;
        $queryscore = "UPDATE `boosters` SET `score`='$score' WHERE `username`='$boostername';";
    }
    if ($daysdiff <= 7) {
        $score++;
        $queryscore = "UPDATE `boosters` SET `score`='$score' WHERE `username`='$boostername';";
    }

    $query = "INSERT INTO `finished`(`ID`, `username`, `booster_name`, `accepted`, `finished`)
 VALUES ('$id','$username','$boostername','$accepted','$date') ";
    $query2 = "DELETE FROM `inprogress`
WHERE inprogress.ID=$id;";
    $querydelete = "DELETE FROM `$table` WHERE `ID`='$id';";
    $final_query1 = mysqli_query($link, $query);
    $final_query2 = mysqli_query($link, $query2);
    $final_query3 = mysqli_query($link, $querydelete);
    $final_queryscore = mysqli_query($link, $queryscore);

    if ($final_query1 && $final_query2 && $final_query3 && $final_queryscore  === true) {


        echo("<p style='color:green;'><b>ثبت شد </b></p>");

        ?>

        <script>
            window.alert("تحویل سفارش انجام شد!");
            location.replace("index.php")
        </script>

        <?php
    } else
        echo("<p style='color:red;'><b> code is not working </b> </p>");
    mysqli_close($link);
}



?>


