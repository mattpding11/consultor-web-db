<?php

require ("config/conn.php");

$sql = "select * from grupos_por_materia";

if($response = mysqli_query($conn,$sql)){
}

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
    <title>Grupos por materia</title>
</head>
<body>

<form action="grupos_materia_2.php" method="POST" autocomplete="off">
    <p>Seleccione el codigo para mostrar la informacion detallada.</p>
    <input list="grupos_materia" name="codigo_grupo_materia" placeholder="Código" required>
    <datalist id="grupos_materia">
        <?php
        if($response = mysqli_query($conn,$sql)){
            while($option = mysqli_fetch_assoc($response)){
                echo " <option value=".$option["codigoGrupoPorMateria"]."></option>";
            }
        }else {
            echo "Error : no es posible realizar la consulta";
        }

        ?>
    </datalist>
  <p><input type="submit" value="buscar"></p>
</form>
<p>
    <button onclick="window.location.href='index.php'">Regresar</button>
</p>
</body>
</html>
