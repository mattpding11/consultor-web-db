<?php


$host = "localhost"; # or 127.0.0.1 -> corresponde al host de la conexion
$bd = "bd_universidad"; # correpondiente al nombre de la base de datos
$user = ""; # Nombre del usuario configurado en la base de datos
$password = ""; # Clave del usuario configurado para acceder a la base de datos

# Establecer conexion con la base de datos

$conn = mysqli_connect($host, $user, $password, $bd);

# comprobar si la conexion arroja un error

if (mysqli_connect_errno()) {
    echo "Conexion fallida: %s\n", mysqli_connect_error();
}


?>
