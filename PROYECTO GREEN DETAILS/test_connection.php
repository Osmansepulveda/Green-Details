<?php
include '/db.php'; // Asegúrate de que la ruta sea correcta

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
} else {
    echo "Conexión exitosa a la base de datos.";
}

// Cerrar la conexión
$conn->close();
?>
