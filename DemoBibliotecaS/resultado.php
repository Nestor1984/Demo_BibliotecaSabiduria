<?php
    include 'conexion.php';
    $idcliente=$_GET['idcliente'];
    $consulta="delete from clientes where idcliente= $idcliente";
    $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");
    echo "Cliente eliminado";
    echo "<p><a href='listarclientes.php'>Listar Empleados</a></p>";
?>    