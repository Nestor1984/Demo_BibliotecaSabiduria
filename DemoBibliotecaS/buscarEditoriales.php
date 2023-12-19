<?php
    include 'conexion.php';
    
    if(isset($_POST['enviar'])){
        $nombre = $_POST['nom-editorial'];
        $consulta="select * from editoriales where nombre like'%$nombre%' order by idEditorial desc";
    }else{
        $consulta="select * from editoriales order by idEditorial desc";
    }
    
    $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");

    echo"<table class='listado'>";
    echo"<tr>";
    echo"<th>Id Editorial</th>";
    echo"<th>Nombre Editorial</th>";
    echo"<th>Pais</th>";
    echo"<th>Cuidad</th>";
    echo"<th>Telefono</th>";
    echo"<th>Fecha de fundacion</th>";
    echo"</tr>";

    while($columna=mysqli_fetch_array($resultado)){
        echo"<tr>";
        echo"<td>".$columna['idEditorial']."</td><td>".$columna['nombre']."</td><td>".$columna['pais']."</td><td>".$columna['ciudad']."</td><td>".$columna['telefono']."</td><td>".$columna['anioFundacion']."</td>";
        echo"</tr>";
    }

    echo"</table>";

    mysqli_close($conexion);
?>