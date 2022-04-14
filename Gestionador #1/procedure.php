<?php
require('config/conn.php');
$procedure = "promedio_notas_estudiante($_REQUEST[codigo_estudiante],$_REQUEST[codigo_materia])";
$colum_name = "Promedio";
$sql = "call $procedure";

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <title>Función</title>
</head>
<body>
<p><strong>3.) Procedimientos Almacenados</strong></p>
<p>Mostrar promedio de nota del estudiante por materia</p>

<table>
    <thead>
    <tr >
        <th>Promedio</th>
    </tr>
    </thead>
    <tbody align="center">
    <?php
    #validar si la consulta se valida
    if ($response = mysqli_query($conn, $sql)) {
        while ($line = mysqli_fetch_assoc($response)) {
            if (!is_null($line[$colum_name])) {
                echo "
                        <tr>
                        <td>" . substr($line[$colum_name], 0, 4) . "</td>
                        </tr>
                        ";
            } else {
                echo "
                        <tr>
                        <td><p>No se encontro el estudiante o la materia.</p></td>
                        </tr>";
            }

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
</table>
<p>
    <button onclick="window.location.href='index.php'">Regresar</button>
</p>

</body>
</html>
