<?php
require('config/conn.php');
$function = "ASINATURAS_DE_PROFESOR($_REQUEST[codigo_profesor]) as 'Nombre / Asignatura'";
$colum_name = 'Nombre / Asignatura';
$sql = "select $function";

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <title>Funcion</title>
</head>
<body>
<p><strong>2.) Funciones</strong></p>
<p>Visualizar materias por profesor</p>


<table >
    <thead >
    <tr>
        <th> Nombre / Asignaturas</th>
    </tr>
    </thead>
    <tbody>
    <?php
    #validar si la consulta se valida
    if ($response = mysqli_query($conn, $sql)) {
        while ($line = mysqli_fetch_assoc($response)) {
            if (!is_null($line[$colum_name])) {
                echo "
                        <tr>
                        <td>" . $line[$colum_name] . "</td>
                        </tr>
                        ";
            } else {
                echo "
                        <tr>
                        <td><p>No existe el codigo de profesor <strong>$_REQUEST[codigo_profesor]</strong></p></td>
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
