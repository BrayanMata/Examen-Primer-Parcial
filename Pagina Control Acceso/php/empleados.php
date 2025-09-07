<?php
    require "conexion.php";
    session_start(); 
    
    if ($conn->connect_error) {
        die("Error de conexión: " . $conn->connect_error);
    }

    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $claveEmpleado = trim($_POST["claveEmpleado"]);

        
        $stmt = $conn->prepare("SELECT id_empleado, nombre FROM empleados WHERE clave_acceso = ?");
        $stmt->bind_param("s", $claveEmpleado);
        $stmt->execute();
        $resultado = $stmt->get_result();

        if ($resultado->num_rows > 0) {
            
            $empleado = $resultado->fetch_assoc();
            $idEmpleado = $empleado["id_empleado"];
            $nombre     = $empleado["nombre"];

            $_SESSION["nombre_empleado"] = $nombre;

            date_default_timezone_set("America/Ciudad_Juarez");
            $horaRegistro = date("Y-m-d H:i:s");

            $insert = $conn->prepare("INSERT INTO acceso_empleados (id_empleado, nombre, hora_registro) VALUES (?, ?, ?)");
            $insert->bind_param("iss", $idEmpleado, $nombre, $horaRegistro);

            if ($insert->execute()) {
                header("Location: ../bienvenida.php");
                exit();
            } else {
                echo "<p style='color:red;'>Error al registrar acceso: " . $insert->error . "</p>";
            }

            $insert->close();
        } else {
            echo "<p style='color:red;'>Clave incorrecta. Intente de nuevo.</p>";
        }

        $stmt->close();
    }

    $conn->close();
?>