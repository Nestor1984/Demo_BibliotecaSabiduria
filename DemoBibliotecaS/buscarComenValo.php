<?php
    include 'conexion.php';
    
    if(isset($_POST['enviar'])){
        $nombre = $_POST['nom-libro'];
        $consulta="select cv.valoracion, cv.comentario, l.titulo, v.nombres from ComentariosValoraciones cv inner join libros l on cv.idLibro = l.idLibro inner join visitantes v on cv.idVisitante = v.idVisitantes where l.titulo like'%$nombre%' order by cv.idComentarioValoracion desc";
    }else{
        $consulta="select cv.valoracion, cv.comentario, l.titulo, v.nombres from ComentariosValoraciones cv inner join libros l on cv.idLibro = l.idLibro inner join visitantes v on cv.idVisitante = v.idVisitantes order by cv.idComentarioValoracion desc";
    }
    
    $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");

    echo"<table class='listado'>";
    echo"<tr>";
    echo"<th>Valoracion Libro</th>";
    echo"<th>Comentario Libro</th>";
    echo"<th>Titulo Libro</th>";
    echo"<th>Nombre del Visitante</th>";
    echo"</tr>";

    while($columna=mysqli_fetch_array($resultado)){
        echo"<tr>";
        echo"<td>".$columna['valoracion']."</td><td>".$columna['comentario']."</td><td>".$columna['titulo']."</td><td>".$columna['nombres']."</td>";
        echo"</tr>";
    }

    echo"</table>";

    mysqli_close($conexion);
?>