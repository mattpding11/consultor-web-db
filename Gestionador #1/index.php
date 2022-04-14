<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport    "
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pagina web para abir base de datos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Base de datos</h1>
<br>
<hr>
<br>
<h2>1.) Consulta select</h2>
<p>Tabla de materias</p>
<form action="query.php">
    <input type="submit" value="Mostra tabla">
</form>
<hr>
<br>
<h2>2.) Funciones</h2>
<p>Materias por profesor</p>
<form action="function.php">
    <p><input type="number" placeholder="Código de profesor" name="codigo_profesor" required></p>
    <p><input type="submit" value="Buscar"></p>
</form>
<hr>
<br>
<h2>3.) Procedimientos Almacenados</h2>
<p>Mostrar promedio de nota de estudiante por materia</p>
<form action="procedure.php">
    <p><input type="number" placeholder="Código de estudiante" name="codigo_estudiante" required></p>
    <p><input type="number" placeholder="Código de materia" name="codigo_materia" required></p>
    <p><input type="submit" value="Buscar"></p>
</form>
</body>
</html>
