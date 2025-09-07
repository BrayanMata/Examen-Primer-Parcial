<?php
    require "php/conexion.php";

    date_default_timezone_set("America/Ciudad_Juarez");

    $fechaHoy = date("Y-m-d");
    $stmt = $conn->prepare("SELECT COUNT(*) as total_visitas FROM acceso_visitantes WHERE DATE(hora_registro) = ?");
    $stmt->bind_param("s", $fechaHoy);
    $stmt->execute();
    $resultado = $stmt->get_result();
    $visitasHoy = 0;
    if ($fila = $resultado->fetch_assoc()) {
        $visitasHoy = $fila["total_visitas"];
    }

    $stmt->close();
    $conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estiloGeneral.css">
    <link rel="stylesheet" href="css/estiloInicio.css">
    <title>Acceso</title>
</head>
<body>
    <header>
        <h1>Bienvenidos a la editorial.</h1>
    </header>
    <main>
        <div class="conteo">
            <h2>Visitantes del dia: <?php echo $visitasHoy; ?> </h2>
        </div>
        <div class="seleccion">
            <h3>¿Eres un empleado o un visitante?</h3>
            <div class="visitante">
                <a href="formularioVisitante.html">
                    <h3>Visitante</h3>
                </a>
            </div>
            <div class="empleados">
                <a href="formularioEmpleado.html">
                    <h3>Empleado</h3>
                </a>
            </div>
        </div>
        
    </main>
</body>
</html>