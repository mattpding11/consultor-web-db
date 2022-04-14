<?php

require ('config/conn.php');
$codigo_periodo = '';
if(isset($_POST['codigo_periodo'])){
    $codigo_periodo = $_POST['codigo_periodo'];
}
$sql = "select gpm.codigoGrupoPorMateria , m.descripcionMateria
    from grupos_por_materia gpm join materias m 
      where  codigoPeriodo ='$codigo_periodo' and m.codigoMateria = gpm.codigoMateria";
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <title>Periodos detalle</title>
</head>
<body>

<p>Periodo <strong><?php echo $codigo_periodo ?></strong></p>
<table>
    <thead>
    <tr>
        <th>Codigo de grupo</th>
        <th>Materia</th>
    </tr>
    </thead>
    <tbody>
    <?php
    #validar si la consulta se valida
    if ($response = mysqli_query($conn, $sql)) {
        if ($response->num_rows !=0) {
            while ($row = mysqli_fetch_assoc($response)) {
                echo "
                        <tr>
                        <td>" . $row["codigoGrupoPorMateria"] . "</td>
                        <td>" . $row["descripcionMateria"] . "</td>
                        </tr>
                        ";
            }
        }else{
          echo "
                   <tr>
                   <td><p>No se encontraro grupos en este periodo.</p></td>
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
    <button onclick="window.location.href='periodos.php'">Regresar</button>
</p>

</body>

</html>