<?php
$servername = "localhost"; // Cambia si tu servidor es diferente
$username = "root"; // Cambia si tu usuario es diferente
$password = ""; // Añade una contraseña segura aquí
$database = "green_details"; // Nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>

