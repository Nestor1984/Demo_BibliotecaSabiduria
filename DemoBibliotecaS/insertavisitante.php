<?php
    include 'conexion.php';
?>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimun-scale=1.0"/>
    <link rel="stylesheet" href="css/estilos.css"/>
    <title>Lista de visitantes de la biblioteca</title>
  </head>
<body>
<div class="main-container">
      <aside class="main-aside"><a href="https://utb.edu.bo/"><img src="img/logoutb.png" class="logo"/></a>
        <ul class="menu ed-menu">
          <li class="menu__item"><a href="listarAutores.php" class="menu__link icon-compras">Listar autores</a></li>
          <li class="menu__item"><a href="listarFormatos.php" class="menu__link icon-ventas">Listar formatos</a></li>
          <li class="menu__item"><a href="listarVisitantes.php" class="menu__link icon-ventas">Listar visitantes</a></li>
          <li class="menu__item"><a href="listarEditoriales.php" class="menu__link icon-ventas">Listar editoriales</a></li>
          <li class="menu__item"><a href="listarLibros.php" class="menu__link icon-ventas">Listar libros</a></li>
          <li class="menu__item"><a href="listarComenValo.php" class="menu__link icon-ventas">Listar Comentarios</a></li>
          <li class="menu__item"><a href="insertaautor.php" class="menu__link icon-lista-productos">Inserta autores</a></li>
          <li class="menu__item"><a href="insertaformatos.php" class="menu__link icon-lista-productos">Inserta formatos</a></li>
          <li class="menu__item"><a href="insertavisitante.php" class="menu__link icon-lista-productos">Inserta visitantes</a></li>
          <li class="menu__item"><a href="insertaeditorial.php" class="menu__link icon-lista-productos">Inserta editoriales</a></li>
          <li class="menu__item"><a href="insertalibros.php" class="menu__link icon-lista-productos">Inserta libros</a></li>
          <li class="menu__item"><a href="insertaComenValo.php" class="menu__link icon-lista-productos">Inserta comentarios</a></li>
        </ul>
      </aside>
      <main class="main-content">
        <h1> Insertar visitante</h1>
        <form id="form1" name="form1" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            Nombres:<input name="nombres" type="text" id="nombres" />
            Apellidos:<input name="apellidos" type="text" id="apellidos" />
            CI:<input name="ci" type="text" id="ci" />
            Direccion:<input name="direccion" type="text" id="direccion" />
            Telefono:<input name="telefono" type="text" id="telefono" />
            Email:<input name="email" type="text" id="email" />
            Genero: <br><br>
            Masculino:<input type="radio" name="genero" id="genero" value="M" checked/>
            Femenino:<input type="radio" name="genero" id="genero" value="F" /> <br>
            <input type="submit" name="submit" value="Guardar" />
        </form>

        <?php
        if(isset($_POST['submit'])){
            $nombres = $_POST['nombres'];
            $apellidos = $_POST['apellidos'];
            $ci = $_POST['ci'];
            $direccion = $_POST['direccion'];
            $telefono = $_POST['telefono'];
            $email = $_POST['email'];
            $genero = $_POST['genero'];
            $consulta="insert into visitantes(nombres, apellidos, ci, direccion, telefono, email, genero) values('$nombres','$apellidos', '$ci', '$direccion', '$telefono', '$email', '$genero')";
            $resultado=mysqli_query($conexion,$consulta) or die("Algo ha salido mal en la consulta");
            echo "Registro añadido con exito!!!";
            header("Location: listarVisitantes.php");

        }else{
        //echo "Ha sucedido un Error.";
        }

        ?>       
      </main>
    </div>

   
</body>
</html>