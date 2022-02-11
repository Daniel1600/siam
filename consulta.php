<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Construir un formulario de sesión</h2>
<?php
    //si el formulario no se ha enviado
    //genera un nuevo formulario
    if (!isset($_POST['submit'])) {
?>

<form action="consulta.php" method="post">
    Nombre de usuario: <br />
    <input type="text" name="correo" placeholder="Correo Electronico" required>
    <p>
    Contraseña: <br />
    <input type="password" name="contrasena" placeholder="contraseña" required>
    <p>
    <input type="submit" name="submit" value="Ingresar">
</form>

<?php
    //si el formulario ha sido enviado
    //verifica los datos proporcionados
    //contra la base de datos
    }else{
        $correo = $_POST['correo'];
        $contrasena = $_POST['contrasena'];
        
    //verifica datos de entrada
    if(empty($correo)) {
        die('ERROR: Por favor escriba su correo electrónico');
    }
    if(empty($contrasena)) {
        die('ERROR: Por favor escriba su contraseña');
    }
    
    //Intenta establecer conexión con la base de datos
    try {
        $pdo = new PDO('mysql:dbname=siam;host=localhost', 'root', '123456');
    } catch (PDOException $e) {
        die("ERROR: No fue posible conectar: ". $e->getMessage());
    }
        
    //Limpia los caracteres especiales de los datos de entrada
    $correo = $pdo->quote($correo);
    
    //verifica si existe el nombre de usuario
        $sql = "SELECT COUNT(*) FROM usuarios WHERE correo = $correo";
        
    }
    
    if($result = $pdo->query($sql)) {
        $row = $result->fetch();
        //si es positivo, busca la contraseña cifrada
        if($row[0] == 1) {
            $sql = "SELECT contrasena FROM usuarios WHERE correo = $correo";
        //cifra la contraseña ingresada en el formulario
        //La verifica contra la contraseña cifrada que reside en la base de datos
        //si ambas coinciden, la contraseña es correcta
        if($result = $pdo->query($sql)) {
            $row = $result->fetch();
            $salt = $row[0];
            if (crypt($contrasena, $salt) == $salt) {
                echo 'Sus credenciales de acceso fueron verificadas positivamente';
            }elseif {
                echo "Ha ingresado una contraseña incorrecta";
            }elseif{
            echo "ERROR: No fue posible ejecutar $sql. " . print_r($pdo->errorInfo());
        }elseif{
            echo "Ha ingresado un correo electronico incorrecto";
        }
        else{
            echo "ERROR: No fue posible ejecutar $sql. " . print_r($pdo->errorInfo());
        }
        
        //cierra conexion
        unset($pdo);
    } 
    }
}
    
?>
</body>
</html>