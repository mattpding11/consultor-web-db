<?php

require ("config/conn.php");

echo "Codigo de grupo: ".$_POST["codigo_grupo_materia"];

$sql = "select concat(nombresEstudiante,\" \",apellidosEstudiante) as 'Nombre', 
descripcionMateria as 'Materia', 
round(avg(valorNota),2) as 'Promedio',
 concat(nombresProfesor,\" \",apellidosProfesor) as 'Profesor'
from estudiantes e join grupos_por_materia gpm, materias m, notas n, profesores p
where gpm.codigoGrupoPorMateria = $_POST[codigo_grupo_materia] and e.codigoEstudiante = gpm.codigoEstudiante
and m.codigoMateria = gpm.codigoMateria and n.codigoEstudiante = gpm.codigoEstudiante
and n.codigoMateria = gpm.codigoMateria and p.codigoProfesor = gpm.codigoProfesor";

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
    <title>Grupos por materia detalle</title>
</head>
<body>
<table id="periodo_table">
    <thead>
    <tr>
        <th>Nombre </th>
        <th>Materia</th>
        <th>Promedio</th>
        <th>Profesor</th>
    </tr>
    </thead>
    <tbody>
    <?php
    #validar si la consulta se valida
    if ($response = mysqli_query($conn, $sql)) {
        while ($row = mysqli_fetch_assoc($response)) {
            echo "
                        <tr>
                        <td id='Nombre'>" . $row["Nombre"] . "</td>
                        <td id='Materia'>" . $row["Materia"] . "</td>
                        <td id='Promedio'>" . $row["Promedio"] . "</td>
                        <td id='Profesor'>" . $row["Profesor"] . "</td>
                        </tr>
                        ";
        }
    } else {
        echo "Error : no es posible realizar la consulta";
    }

    #liberar resultado de la consulta
    mysqli_free_result($response);
    #cerrar la conexion de la base de datos
    mysqli_close($conn);

    ?>
    </tbody>
<p>
    <button onclick="window.location.href='grupos_materia.php'">Regresar</button>
</p>
</body>
</html>
