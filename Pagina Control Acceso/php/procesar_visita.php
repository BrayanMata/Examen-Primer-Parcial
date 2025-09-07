<?php
    require "conexion.php";
    session_start();

    date_default_timezone_set("America/Ciudad_Juarez");

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $nombre = trim($_POST["nombre"]);
        $motivo = trim($_POST["motivo"]);
        $horaRegistro = date("Y-m-d H:i:s");

        $stmt = $conn->prepare("INSERT INTO acceso_visitantes (nombre, motivo, hora_registro) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $nombre, $motivo, $horaRegistro);

        if ($stmt->execute()) {
            $_SESSION["nombre_visita"] = $nombre;

            header("Location: ../bienvenida.php");
            exit();
        } else {
            echo "<p style='color:red;'>Error al registrar los datos: " . $stmt->error . "</p>";
        }

        $stmt->close();
    }

    $conn->close();
?>