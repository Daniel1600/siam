<?php

    include_once 'config/conexion.php';
    
    if(isset($_POST['guardar'])) {
        $id_vehiculo=$_POST['id_vehiculo'];
        $placa=$_POST['placa'];
        $novedad=$_POST['novedad'];
        
        if(!empty($id_vehiculo) && !empty($placa) && !empty($novedad)) {
            if(!filter_var($placa,FILTER_SANITIZE_STRIPPED)){
                echo "<script>alert('numero de placa no valido')</script>";
            }else{
                $consulta_insert=$con->prepare('INSERT INTO mantenimiento (id_vehiculo,placa,novedad)VALUES(:id_vehiculo,:placa,:novedad)');
                $consulta_insert->execute(array(
                ':id_vehiculo'=>$id_vehiculo,
                ':placa'=>$placa,
                ':novedad'=>$novedad                
                ));
                
                header('Location: modulos/Mantenimiento/mantenimiento.php');
            }
        }else{
            echo "<script>alert('Los campos estan vacios o te falto rellenar uno')</script>";
        }
        
    }

?>




/*
// Llamando a los campos
$user_report = $_POST['user_report'];
$id_movil = $_POST['id_movil'];
$telefono = $_POST['telefono'];
$mensaje = $_POST['mensaje'];

// Datos para el correo
$destinatario = "dfperdomo3@misena.edu.co";
$asunto = "Novedad de Alimentación";

$carta = "De: $user_report \n";
$carta .= "Movil: $id_movil \n";
$carta .= "Telefono: $telefono \n";
$carta .= "NOVEDAD: $mensaje";

#Enviando Mensaje
mail($destinatario, $asunto, $carta);
header('Location:mensaje-de-envio.php');
*/
?>