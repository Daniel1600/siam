<?php session_start();
    #if(!isset($_SESSION['guardar'])){
     #   header('Location: index.php');
    #}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SIAM | Sistema de Informacion y Analisis de Mantenimiento</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="css/_all-skins.min.css">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <!--- Estilos del contenido- ---->
    <link rel="stylesheet" href="css/content.css">

  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">

        <!-- Logo -->
        <a href="principal.php" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>SI</b>AM</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>SIAM</b></span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Navegación</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <small class="bg-red">Activo</small>
                  <span class="hidden-xs">Usuarios</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    
                    <p>
                      Estamos trabajando para darte una mejor experiencia.
                      <small>Aprendices Sena</small>
                    </p>
                  </li>
                  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <!--
                     <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Perfil</a>
                    </div>
                    -->
                    <div class="pull-right">
                      <a href="salir.php" class="btn btn-default btn-flat">Cerrar sesión</a>
                    </div>
                  </li>
                </ul>
              </li>
              
            </ul>
          </div>

        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
                    
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header"></li>
            <li class="treeview">
              <a href="principal.php">
                <i class="fa fa-home"></i>
                <span>Inicio</span>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Diagnóstico del vehículo</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="modulos/Diagnosticovehiculo/disponible.php"><i class="fa fa-signal"></i> Disponibilidad</a></li>
                <li><a href="modulos/Mantenimiento/mantenimiento.php"><i class="fa fa-key"></i> Mantenimiento</a></li>
                <li><a href="modulos/Diagnosticovehiculo/programacionMantenimiento.php"><i class="fa fa-keyboard-o"></i> Programar mantenimiento</a></li>
              </ul>
            </li>
            
            <li class="treeview">
              <a href="modulos/Mantenimiento/mantenimiento.php">
                <i class="fa fa-key"></i>
                <span>Mantenimiento</span>
              </a>
            </li>
            
             <li class="treeview">
              <a href="modulos/vehiculos/vehiculos.php">
                <i class="fa fa-car"></i>
                <span>Vehículos</span>
              </a>
            </li>
            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-spinner"></i>
                <span>Repuestos</span>
                 <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="modulos/reportes/solicitados.php"><i class="fa fa-chevron-circle-right"></i> Solicitar</a></li>
                <li><a href="modulos/reportes/disponibles.php"><i class="fa fa-tag"></i> Disponibles</a></li>
                <li><a href="modulos/reportes/nuevos_repuestos.php"><i class="fa fa-archive"></i> Nuevos repuestos</a></li>
              </ul>
            </li>
                       
            <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span>Acceso a usuarios</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="modulos/configuracion/usuarios.php"><i class="fa fa-user "></i>Usuarios</a></li>
              </ul>
            </li>
             <li>
              <a href="#">
                <i class="fa fa-plus-square"></i> <span>Ayuda</span>
                <small class="label pull-right bg-red">PDF</small>
              </a>
            </li>
            <li>
              <a href="modulos/acerca.php">
                <i class="fa fa-info-circle"></i> <span>Acerca Del Sistema</span>
              </a>
            </li>
                        
          </ul>
        </section>
        <!-- /.sidebar -->
        </aside>
        
       <!--Contenido-->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        
        <!-- Main content -->
        <section class="content">
          
          <div class="row">
            <div class="col-md-12">
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Sistema de Información y Análisis Mantenimiento</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  	<div class="row">
	                  	<div class="col-md-12">
		                          <!--Contenido-->
		                      <h3 class="box-title" style="font-size: 20px;text-align:center;">Menu principal</h3>
                             <div class="container"><i class="fal fa-car-mechanic"></i>
                                 <div class="btn-menu-main btn-1"><a href="modulos/Mantenimiento/mantenimiento.php" class="btn-text">Mantenimiento</a>
                                <i class="icon-btn fa fa-key"></i>   
                                 </div>
                                 <div class="btn-menu-main btn-2"><a href="modulos/vehiculos/vehiculos.php" class="btn-text">Vehículos</a>
                                 <i class="icon-btn fa fa-car"></i>
                                 </div>
                                 <div class="btn-menu-main btn-3"><a href="modulos/Diagnosticovehiculo/programacionMantenimiento.php" class="btn-text">Programar Vehículo</a><i class="icon-btn fa fa-keyboard-o"></i>
                                 </div> 
                                <div class="btn-menu-main btn-4"><a href="modulos/reportes/solicitados.php" class="btn-text">Solicitar repuestos</a>
                                <i class="icon-btn fa fa-chevron-circle-right"></i>   
                                 </div>
                                 <div class="btn-menu-main btn-5"><a href="modulos/reportes/disponibles.php" class="btn-text">Repuestos</a>
                                 <i class="icon-btn fa fa-tags"></i>
                                 </div>
                                 <div class="btn-menu-main btn-6"><a href="modulos/configuracion/usuarios.php" class="btn-text">Usuarios</a><i class="icon-btn fa fa-user"></i>
                                 </div> 
                                  
                             </div>
                            <!--Fin Contenido-->
                           </div>
                        </div>
		                    
                  		</div>
                  	</div><!-- /.row -->
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <!--Fin-Contenido-->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Versión</b> 2.0
        </div>
        <strong>Copyright © 2020 <a href=""></a>.</strong>  SIAM ALL RIGHTS RESERVED. LICENCIA AUTORIZADA PARA ESTE ES MI BUS.
      </footer>

      
    <!-- jQuery 2.1.4 -->
    <script src="js/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="js/app.min.js"></script>
    
  </body>
</html>
