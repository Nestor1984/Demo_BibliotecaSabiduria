<?php
    include 'conexion.php';
    
    if(isset($_POST['enviar'])){
        $nombres = $_POST['nom-visitante'];
        $consulta="select * from visitantes where nombres like'%$nombres%' order by idVisitantes desc";
    }else{
        $consulta="select * from visitantes order by idVisitantes desc";
    }
    
    $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");

    echo"<table class='listado'>";
    echo"<tr>";
    echo"<th>Id Visitante</th>";
    echo"<th>Nombres</th>";
    echo"<th>Apellidos</th>";
    echo"<th>CI</th>";
    echo"<th>Direccion</th>";
    echo"<th>Telefono</th>";
    echo"<th>Email</th>";
    echo "<th>Genero</th>";
    echo"</tr>";

    while($columna=mysqli_fetch_array($resultado)){
        echo"<tr>";
        echo"<td>".$columna['idVisitantes']."</td><td>".$columna['nombres']."</td><td>".$columna['apellidos']."</td><td>".$columna['ci']."</td><td>".$columna['direccion']."</td><td>".$columna['telefono']."</td><td>".$columna['email']."</td><td>".$columna['genero']."</td>";
        echo"</tr>";
    }

    echo"</table>";

    mysqli_close($conexion);
?>