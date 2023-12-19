<?php
    include 'conexion.php';
    
    if(isset($_POST['enviar'])){
        $nombre = $_POST['nom-libro'];
        $consulta="select l.idLibro, l.titulo, l.cantidadPaginas, l.fechaPublicacion, l.descripcion, l.genero, l.idioma, l.isbn, l.idFormato, f.nombre from libros l inner join formatos f on l.idFormato = f.idFormatos where l.titulo like'%$nombre%' order by l.idLibro desc";
    }else{
        $consulta="select l.idLibro, l.titulo, l.cantidadPaginas, l.fechaPublicacion, l.descripcion, l.genero, l.idioma, l.isbn, l.idFormato, f.nombre from libros l inner join formatos f on l.idFormato = f.idFormatos order by l.idLibro desc";
    }
    
    $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");

    echo"<table class='listado'>";
    echo"<tr>";
    echo"<th>Id Libro</th>";
    echo"<th>Titulo</th>";
    echo"<th>Cantidad de Pag.</th>";
    echo"<th>Fecha de publicacion</th>";
    echo"<th>Descripcion</th>";
    echo"<th>Genero</th>";
    echo"<th>Idioma</th>";
    echo"<th>ISBN</th>";
    echo"<th>Id Formato</th>";
    echo"<th>Nombre formato</th>";
    echo"</tr>";

    while($columna=mysqli_fetch_array($resultado)){
        echo"<tr>";
        echo"<td>".$columna['idLibro']."</td><td>".$columna['titulo']."</td><td>".$columna['cantidadPaginas']."</td><td>".$columna['fechaPublicacion']."</td><td>".$columna['descripcion']."</td><td>".$columna['genero']."</td><td>".$columna['idioma']."</td><td>".$columna['isbn']."</td><td>".$columna['idFormato']."</td><td>".$columna['nombre']."</td>";
        echo"</tr>";
    }

    echo"</table>";

    mysqli_close($conexion);
?>