<?php

//phpinfo();

#Establecer conexion con base de datos
require('config/conn.php');

#Crear conexion de la base de datos
$sql = "select * from materias";


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <title>Pagina web para abir base de datos</title>
</head>
<body>
<h1>Base de datos universidad</h1>

<h2>1.) Consulta select</h2>
<p>Mostrar tabla de materias</p>
<table>
    <thead>
    <tr>
        <th>codigo</th>
        <th>Nombre de la materia</th>
    </tr>
    </thead>
    <tbody>
    <?php
    #validar si la consulta se valida
    if ($response = mysqli_query($conn, $sql)) {
        if (!is_null($response->num_rows)) {
            while ($line = mysqli_fetch_assoc($response)) {
                echo "
                        <tr>
                        <td>" . $line["codigoMateria"] . "</td>
                        <td>" . $line["descripcionMateria"] . "</td>
                        </tr>
                        ";
            }
        } else {
            echo "
              <tr>
              <td><p>No se encontraron materias.</p></td>
              </tr>";
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