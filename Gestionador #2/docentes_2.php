<?php

require ('config/conn.php');

$sql = "select * from profesores where codigoProfesor = $_POST[codigo_profesor]";

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <title>Docentes detalle</title>
</head>
<body>
    <?php

        if($response = mysqli_query($conn,$sql)){
            if($row = mysqli_fetch_assoc($response)){
                echo "
                      <p> Código: <strong>".$row["codigoProfesor"]."</strong></p>  
                      <p> Apellidos: <strong>".$row["apellidosProfesor"]."</strong></p>  
                      <p> Nombres: <strong>".$row["nombresProfesor"]."</strong></p> 
                ";
            }
        }else {
                echo "Error : no es posible realizar la consulta";
            }

    ?>

    <p>
        <button onclick="window.location.href='docentes.php'">Regresar</button>
    </p>

</body>
</html>
