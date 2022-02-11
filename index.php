<?php

    include_once 'config/conexion.php';
    if (!isset($_POST['guardar'])) {
        $correo = (isset($_COOKIE['correo'])) ? $_COOKIE['correo'] : '';

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title> SIAM | Inicia Sesión</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="description" content="App de programacion de mantenimientos">
    <meta name="keywords" content="Este es mi bus, Siam, Programación de Mantenimientos">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
      <?php  
 
    if (empty($_GET['alert'])) {
        echo "";
      } 

      elseif ($_GET['alert'] == 1) {
        echo "<div class='alert alert-danger alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                <h4>  <i class='icon fa fa-times-circle'></i> Error al entrar!</h4>
               Usuario o la contraseña es incorrecta, vuelva a verificar su nombre de usuario y contraseña.
              </div>";
      }

      elseif ($_GET['alert'] == 2) {
        echo "<div class='alert alert-success alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true';'&times;</button>
                <h4>  <i class='icon fa fa-check-circle';'></i> Exito!!</h4>
              Has salido con éxito.
              </div>";
      }
    ?>      
    <div class="container">
        <div class="container-logo">
            <img class="img-logo" src="img/Siam.jpg" alt="">
        </div>
        <div class="container-form">
            <form action="index.php" method="post">
                <input class="item-form" type="text" name="correo" placeholder="Correo Electrónico" value="" required autofocus autocomplete="off">
                <input class="item-form" type="password" name="contrasena" placeholder="Contraseña" required autocomplete="off">
                <input type="checkbox" name="rastreo" checked style="display:none;">
                <input class="item-submit" type="submit" name="guardar" value="INGRESAR >">
            </form>
        </div>
    </div>
</body>
</html>
<?php
    
    }else{
        $correo = $_POST['correo'];
        $contrasena = md5($_POST['contrasena']);
        
        if(empty($correo)) {
            die('ERROR: Por favor escriba su correo electrónico');
        }
      if(empty($contrasena)) {
                die('ERROR: Por favor escriba su contraseña');
        // Limpia los caracteres especiales de los datos de entrada
        }
        $correo = $con->quote($correo);
    
        //verifica si existe el correo
        $sql = "SELECT COUNT(*) FROM usuarios WHERE correo = $correo";
         if($resultado = $con->query($sql)) {
            $row = $resultado->fetch();
            if($row[0] == 1) {
            $sql = "SELECT contrasena FROM usuarios WHERE correo = $correo";
            //cifra la contraseña ingresada en el formuario
            //la verifica contra la contraseña cifrada que reside en la base de datos
            //si ambas coinciden, la contraseña es correcta
            if($resultado = $con->query($sql)) {
                $row = $resultado->fetch();
                $salt = $row[0];
                if (crypt($contrasena, $salt) == $salt) {
                    //contraseña correcta
                    //inicia una nueva sesión
                    //guarda el correo del usuario para la sesión
                    //de rquerirse, establece una coockie con el nombre de usuario
                    //redirecina el explorador a la pagina principal de la aplicacion
                    session_start();
                    $_SESSION['correo'] = $correo;
                    if ($_POST['rastreo']) {
                        setcookie('nombre', $_POST['correo'], mktime()+86400);
                    }
                    header('Location: principal.php');
                } else {
                    echo "<script> alert('Ha ingresado una contraseña incorrecto')</script>";
                    header('Location: principal.php');
                }
            }else {
                echo "ERROR: No fue posible ejecitar $sql. " .print_r($con->errorInfo());
            }
        }else {
            echo "<script> alert('Ha ingresado un correo incorrecto')</script>";
            }
    }else{
        echo "ERROR: No fue posible ejecutar $sql. " . print_r($con->errorInfo());
    }
    unset($con);
}?>