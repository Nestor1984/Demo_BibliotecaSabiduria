<?php
    $usuario="root";
    $password="";
    $servidor="localhost";
    $basedatos="bdbibliotecai";
    //creacion de la conexion a la base de datos 
    $conexion=mysqli_connect($servidor,$usuario,$password) or die("No se ha podido conectar al servidor de base de datos");
    //seleccionar la bd a utilizar
    $db=mysqli_select_db($conexion,$basedatos) or die("No se ha podido con la BD");
?>