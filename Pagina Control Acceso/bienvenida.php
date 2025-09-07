<?php
    session_start();

    if (!isset($_SESSION["nombre_empleado"]) && !isset($_SESSION["nombre_visita"])) {
        header("Location: index.html");
        exit();
    }

    $nombreMostrar = $_SESSION["nombre_empleado"] ?? $_SESSION["nombre_visita"];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estiloGeneral.css">
    <link rel="stylesheet" href="css/estiloBienvenida.css">
    <title>Bienvenida</title>
</head>
<body>
    <main>
        <div>
            <h2 id="bienvenida">
                Gracias por su visita <br> 
                que tenga un excelente día <br>
                <?php echo htmlspecialchars($nombreMostrar); ?>
            </h2>
            <h2 id="conteo">10</h2>
            <div class="regresar">
                <a href="php/logout.php">Regresar al inicio</a>
            </div>
        </div>
    </main>

    <script>
        let tiempo = 10;
        const conteoElem = document.getElementById("conteo");

        const intervalo = setInterval(() => {
            tiempo--;
            conteoElem.textContent = tiempo;
            if (tiempo <= 0) {
                clearInterval(intervalo);
                window.location.href = "php/logout.php";
            }
        }, 1000);
    </script>
</body>
</html>