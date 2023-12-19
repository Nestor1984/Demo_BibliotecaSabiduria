<?php
    include 'conexion.php';
    
    if(isset($_POST['enviar'])){
        $nombre = $_POST['nom-formato'];
        $consulta="select * from formatos where nombre like'%$nombre%' order by idFormatos desc";
    }else{
        $consulta="select * from formatos order by idFormatos desc";
    }
    
    $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");

    echo"<table class='listado'>";
    echo"<tr>";
    echo"<th>Id Formato</th>";
    echo"<th>Nombre</th>";
    echo"<th>Descripcion</th>";
    echo"</tr>";

    while($columna=mysqli_fetch_array($resultado)){
        echo"<tr>";
        echo"<td>".$columna['idFormatos']."</td><td>".$columna['nombre']."</td><td>".$columna['descripcion']."</td>";
        echo"</tr>";
    }

    echo"</table>";

    mysqli_close($conexion);
?>