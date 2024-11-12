<?php
if (isset($_POST['submit'])) {
    // Establecer la conexión con la base de datos
    $conexion = new mysqli("localhost", "root", "12345", "greendetails");

    // Verificar la conexión
    if ($conexion->connect_error) {
        die("Error de conexión: " . $conexion->connect_error);
    }

    // Obtener la dirección de correo electrónico del formulario
    $email = $_POST['email'];

    // Preparar la consulta SQL de inserción
    $sql = "INSERT INTO suscriptores (email) VALUES ('$email')";

    // Ejecutar la consulta
    if ($conexion->query($sql) === TRUE) {
        echo "<script>alert('Gracias por .');</script>";
    } else {
        echo "<script>alert('Hubo un error al procesar tu solicitud. Por favor, inténtalo de nuevo más tarde.');</script>";
    }

    // Cerrar la conexión
    $conexion->close();
}
?>
