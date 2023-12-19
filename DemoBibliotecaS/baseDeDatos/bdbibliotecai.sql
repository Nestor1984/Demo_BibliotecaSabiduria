-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2023 a las 06:25:22
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdbibliotecai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `idAutor` int(11) NOT NULL,
  `nombresYApellidos` varchar(60) NOT NULL,
  `sitioWeb` varchar(45) NOT NULL,
  `nacionalidad` varchar(15) NOT NULL,
  `anioNacimiento` date NOT NULL,
  `anioFallecimiento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`idAutor`, `nombresYApellidos`, `sitioWeb`, `nacionalidad`, `anioNacimiento`, `anioFallecimiento`, `genero`) VALUES
(1, 'Gabriel Garcia Marquez', 'https://www.gabrielgarciamarquezfundacion.com', 'Colombiana', '1927-03-06', '2000-04-17', 'M'),
(2, 'Antoine de Saint-Exupery', ' Ninguno', 'Francesa', '1900-06-29', '1944-07-31', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariosvaloraciones`
--

CREATE TABLE `comentariosvaloraciones` (
  `idComentarioValoracion` int(11) NOT NULL,
  `idVisitante` int(11) DEFAULT NULL,
  `idLibro` int(11) DEFAULT NULL,
  `valoracion` varchar(20) DEFAULT NULL,
  `comentario` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentariosvaloraciones`
--

INSERT INTO `comentariosvaloraciones` (`idComentarioValoracion`, `idVisitante`, `idLibro`, `valoracion`, `comentario`) VALUES
(1, 1, 1, 'cinco estrellas', 'El libro me parece algo largo, pero interesante'),
(2, 1, 1, 'cinco estrellas', 'Excelente pieza literaria. Remenbrar una parte de la historia de Colombia con el estilo limpio, hilvanado adecuadamente de principio a fin y con una adecuada estructura de la novela.'),
(3, 1, 2, 'dos estrellas', 'El libro nos habla de un pequeño niño que no conoce mas allá de su propio planeta con unos arboles gigantes y una flor que el mismo crió.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_prestamos`
--

CREATE TABLE `det_prestamos` (
  `idPrestamo` int(11) DEFAULT NULL,
  `idEjemplar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `idEditorial` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `anioFundacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`idEditorial`, `nombre`, `pais`, `ciudad`, `telefono`, `anioFundacion`) VALUES
(1, 'Santillan', 'Espania', 'Madrid', '91234567', '2000-03-11'),
(2, 'Editorial Quatro Hermanos', 'Bolivia', 'La Paz', '22805509', '2006-10-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplares`
--

CREATE TABLE `ejemplares` (
  `idEjemplar` int(11) NOT NULL,
  `idLibro` int(11) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formatos`
--

CREATE TABLE `formatos` (
  `idFormatos` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `formatos`
--

INSERT INTO `formatos` (`idFormatos`, `nombre`, `descripcion`) VALUES
(1, 'Hardcover with Dust Jacket', 'Libro de tapa dura con sobrecubierta: Similar'),
(2, 'Softcover with Flaps', 'Libro de tapa blanda con solapas: Similar al '),
(3, 'Hardcover in Cloth', 'Libro de tapa dura en rústica: Un formato de ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idLibro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `cantidadPaginas` int(11) NOT NULL,
  `fechaPublicacion` date NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `idioma` varchar(40) NOT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `idFormato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`idLibro`, `titulo`, `cantidadPaginas`, `fechaPublicacion`, `descripcion`, `genero`, `idioma`, `isbn`, `idFormato`) VALUES
(1, 'Cien anios de soledad', 496, '1967-05-11', 'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez', 'Alta fantasia', 'Espaniol', '9789510445365', 1),
(2, 'El principito', 500, '2001-10-15', 'El principito es una novela corta y la obra más famosa del escritor y aviador francés Antoine de Saint-Exupéry', 'Alta fantasia', 'Espaniol', '9284770435301', 1),
(3, 'Como programar en Java 7a Edicion', 566, '2008-10-02', 'Una introducion completa y autorizada del codigo activo de Deitel a la programacion orientada a objetos', 'Infomatica', 'Espaniol', '9789702611905', 1),
(4, 'Codigo Limpio', 464, '2012-06-12', 'Cada año, se invierten innumerables horas y se pierden numerosos recursos debido a código mal escrito', 'Infomatica', 'Espaniol', '‎8441532109', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_autores`
--

CREATE TABLE `libros_autores` (
  `idLibro` int(11) DEFAULT NULL,
  `idAutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_editoriales`
--

CREATE TABLE `libros_editoriales` (
  `idLibro` int(11) DEFAULT NULL,
  `idEditorial` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `idVisitante` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fechaPedido` date DEFAULT NULL,
  `estadoDelPedido` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_libros`
--

CREATE TABLE `pedidos_libros` (
  `idPedido` int(11) DEFAULT NULL,
  `idLibro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idPrestamo` int(11) NOT NULL,
  `fechaDePrestamo` date DEFAULT NULL,
  `fechaDeDevolucion` date DEFAULT NULL,
  `idVisitante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitantes`
--

CREATE TABLE `visitantes` (
  `idVisitantes` int(11) NOT NULL,
  `nombres` varchar(35) NOT NULL,
  `apellidos` varchar(35) NOT NULL,
  `ci` varchar(15) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `genero` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visitantes`
--

INSERT INTO `visitantes` (`idVisitantes`, `nombres`, `apellidos`, `ci`, `direccion`, `telefono`, `email`, `genero`) VALUES
(1, 'Nestor Jhoel', 'Mamani Mamani', '13892511', 'Alto las Delicias', '72065804', 'nestorjhoel2@gmail.com', 'M'),
(2, 'Margarita ', 'Sanz.', '12992166', 'Villa Fatima', '61062202', 'marga@gmail.com', 'F'),
(3, 'Guillermo', 'Diaz', '11922161', 'Obrajes', '62061201', 'guilled@gmail.com', 'M');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indices de la tabla `comentariosvaloraciones`
--
ALTER TABLE `comentariosvaloraciones`
  ADD PRIMARY KEY (`idComentarioValoracion`),
  ADD KEY `fk_cv_Visitante` (`idVisitante`),
  ADD KEY `fk_cv_libro` (`idLibro`);

--
-- Indices de la tabla `det_prestamos`
--
ALTER TABLE `det_prestamos`
  ADD KEY `fk_det_prestamos_ejemplar` (`idEjemplar`),
  ADD KEY `fk_det_prestamos_prestamos` (`idPrestamo`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`idEditorial`);

--
-- Indices de la tabla `ejemplares`
--
ALTER TABLE `ejemplares`
  ADD PRIMARY KEY (`idEjemplar`),
  ADD KEY `fk_ejemplares_libros` (`idLibro`);

--
-- Indices de la tabla `formatos`
--
ALTER TABLE `formatos`
  ADD PRIMARY KEY (`idFormatos`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`idLibro`),
  ADD KEY `fk_libros_formatos` (`idFormato`);

--
-- Indices de la tabla `libros_autores`
--
ALTER TABLE `libros_autores`
  ADD KEY `fk_librosAutores_libros` (`idLibro`),
  ADD KEY `fk_librosAutores_Autores` (`idAutor`);

--
-- Indices de la tabla `libros_editoriales`
--
ALTER TABLE `libros_editoriales`
  ADD KEY `fk_librosEditoriales_libros` (`idLibro`),
  ADD KEY `fk_librosEditoriales_editoriales` (`idEditorial`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_pedidos_visitantes` (`idVisitante`);

--
-- Indices de la tabla `pedidos_libros`
--
ALTER TABLE `pedidos_libros`
  ADD KEY `fk_PedidosLibros_Pedidos` (`idPedido`),
  ADD KEY `fk_PedidosLibros_Libros` (`idLibro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `fk_prestamos_visitantes` (`idVisitante`);

--
-- Indices de la tabla `visitantes`
--
ALTER TABLE `visitantes`
  ADD PRIMARY KEY (`idVisitantes`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comentariosvaloraciones`
--
ALTER TABLE `comentariosvaloraciones`
  MODIFY `idComentarioValoracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `idEditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ejemplares`
--
ALTER TABLE `ejemplares`
  MODIFY `idEjemplar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formatos`
--
ALTER TABLE `formatos`
  MODIFY `idFormatos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `idLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitantes`
--
ALTER TABLE `visitantes`
  MODIFY `idVisitantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentariosvaloraciones`
--
ALTER TABLE `comentariosvaloraciones`
  ADD CONSTRAINT `fk_cv_Visitante` FOREIGN KEY (`idVisitante`) REFERENCES `visitantes` (`idVisitantes`),
  ADD CONSTRAINT `fk_cv_libro` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`);

--
-- Filtros para la tabla `det_prestamos`
--
ALTER TABLE `det_prestamos`
  ADD CONSTRAINT `fk_det_prestamos_ejemplar` FOREIGN KEY (`idEjemplar`) REFERENCES `ejemplares` (`idEjemplar`),
  ADD CONSTRAINT `fk_det_prestamos_prestamos` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamos` (`idPrestamo`);

--
-- Filtros para la tabla `ejemplares`
--
ALTER TABLE `ejemplares`
  ADD CONSTRAINT `fk_ejemplares_libros` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_libros_formatos` FOREIGN KEY (`idFormato`) REFERENCES `formatos` (`idFormatos`);

--
-- Filtros para la tabla `libros_autores`
--
ALTER TABLE `libros_autores`
  ADD CONSTRAINT `fk_librosAutores_Autores` FOREIGN KEY (`idAutor`) REFERENCES `autores` (`idAutor`),
  ADD CONSTRAINT `fk_librosAutores_libros` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`);

--
-- Filtros para la tabla `libros_editoriales`
--
ALTER TABLE `libros_editoriales`
  ADD CONSTRAINT `fk_librosEditoriales_editoriales` FOREIGN KEY (`idEditorial`) REFERENCES `editoriales` (`idEditorial`),
  ADD CONSTRAINT `fk_librosEditoriales_libros` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_visitantes` FOREIGN KEY (`idVisitante`) REFERENCES `visitantes` (`idVisitantes`);

--
-- Filtros para la tabla `pedidos_libros`
--
ALTER TABLE `pedidos_libros`
  ADD CONSTRAINT `fk_PedidosLibros_Libros` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `fk_PedidosLibros_Pedidos` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_prestamos_visitantes` FOREIGN KEY (`idVisitante`) REFERENCES `visitantes` (`idVisitantes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
