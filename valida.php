<?php

include_once 'config/conexion.php';

/*
$correo = $_POST['correo'];
$password = $_POST['password'];

echo $correo;
echo "<br>";
echo $password;
*/
//Si el formulario no ha sido enviado genera un nuevo formulario
if (!isset($_POST['guardar'])) {
 //Si el formulario no ha sido enviado
 //verifica los datos proporcionados
 //contra la base de datos
}else{
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];
    
    //verifica datos de entrada
    if(empty($correo)) {
        die('ERROR: Por favor escriba su correo electrónico');
    }if(empty($contrasena)) {
        die('ERROR: Por favor escriba su contraseña');
    }
    
    // Limpia los caracteres especiales de los datos de entrada
    $correo = $con->quote($correo);
    
    //verifica si existe el correo
    $sql = "SELECT COUNT(*) FROM usuarios WHERE correo = $correo";
    if($resultado = $con->query($sql)) {
        $row = $resultado->fetch();
        if($row[0] == 1) {
            $sql = "SELECT * FROM usuarios WHERE correo = $correo";
            if($resultado = $con->query($sql)) {
                echo 'Sus credenciales de acceso fueron verificadas exitosamente';
                #header('Location: principal.php');
            }else {
                echo "ERROR: No fue posible ejecitar $sql. " .print_r($con->errorInfo());
            }
        }else {
            echo 'Ha ingresado un correo incorrecto';
        }
    }else{
        echo "ERROR: No fue posible ejecutar $sql. " . print_r($con->errorInfo());
    }
    #unset($con);
}
?>