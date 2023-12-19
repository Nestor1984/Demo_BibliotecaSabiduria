<?php
    include 'conexion.php';
    
    if(isset($_POST['enviar'])){
        $autor = $_POST['nomautor'];
        $consulta="select * from autores where nombresYApellidos like'%$autor%' order by idAutor desc";
    }else{
        $consulta="select * from autores order by idAutor desc";
    }
    
    $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");

    echo"<table class='listado'>";
    echo"<tr>";
    echo"<th>Id</th>";
    echo"<th>Nombre Autor</th>";
    echo"<th>Sitio Web</th>";
    echo"<th>Nacionalidad</th>";
    echo"<th>Fecha de Nacimiento</th>";
    echo"<th>Fecha de fallecimiento</th>";
    echo"<th>Genero</th>";
    echo"</tr>";

    while($columna=mysqli_fetch_array($resultado)){
        echo"<tr>";
        echo"<td>".$columna['idAutor']."</td><td>".$columna['nombresYApellidos']."</td><td>".$columna['sitioWeb']."</td><td>".$columna['nacionalidad']."</td><td>".$columna['anioNacimiento']."</td><td>".$columna['anioFallecimiento']."</td><td>".$columna['genero']."</td>";
        echo"</tr>";
    }

    echo"</table>";

    mysqli_close($conexion);
?>