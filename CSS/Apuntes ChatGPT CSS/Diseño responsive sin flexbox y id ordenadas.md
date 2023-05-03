# Diseño responsive

Si bien Flexbox es una técnica muy útil para crear diseños responsivos, también es posible crear diseños responsivos utilizando otros métodos de diseño en CSS. Un enfoque común es utilizar la técnica de diseño de cuadrícula con la propiedad `float`.

Aquí hay un ejemplo de cómo se podría implementar un diseño responsive utilizando `float`:

## HTML:

'<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Demo Responsive Design sin Flexbox</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>Logo</h1>
		<nav>
			<ul>
				<li><a href="#">Inicio</a></li>
				<li><a href="#">Nosotros</a></li>
				<li><a href="#">Contacto</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<section>
			<h2>Sección 1</h2>
			<p>Contenido de la sección 1</p>
		</section>
		<section>
			<h2>Sección 2</h2>
			<p>Contenido de la sección 2</p>
		</section>
		<section>
			<h2>Sección 3</h2>
			<p>Contenido de la sección 3</p>
		</section>
	</main>
	<footer>
		<p>Derechos de autor &copy; 2023</p>
	</footer>
</body>
</html>'

## CSS:

```css
'/* Estilos generales */
body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

header {
	overflow: hidden;
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
}

nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
	float: right;
}

nav li {
	display: inline-block;
	margin-left: 10px;
}

nav a {
	display: block;
	padding: 10px;
	color: #fff;
	text-decoration: none;
}

main {
	overflow: hidden;
	margin: 0 auto;
	padding: 20px;
	max-width: 1200px;
}

section {
	float: left;
	margin-right: 20px;
	margin-bottom: 20px;
	width: 100%;
}

@media screen and (min-width: 600px) {
	section {
		float: left;
		margin-right: 20px;
		margin-bottom: 20px;
		width: calc(50% - 20px);
	}
	
	section:nth-child(2n) {
		margin-right: 0;
	}
}

@media screen and (min-width: 900px) {
	section {
		float: left;
		margin-right: 20px;
		margin-bottom: 20px;
		width: calc(33.33% - 20px);
	}
	
	section:nth-child(3n) {
		margin-right: 0;
	}
}

footer {
	background-color: #ddd;
	padding: 10px 20px;
	text-align: center;
}'

```

En este ejemplo, en lugar de usar Flexbox, se utiliza la propiedad `float` para crear un diseño de cuadrícula. Los elementos flotantes se colocan uno al lado del otro y se ajustan automáticamente al ancho del contenedor.



# Supongamos que tenemos 1 section con class, otro section con id y 2 aside con id y lo necesitamos poner en un orden en específico. ¿Cómo se haría?



Si no se desea utilizar Flexbox, también se puede establecer un orden específico utilizando la propiedad `float` y la técnica de diseño de cuadrícula.

Aquí hay un ejemplo de cómo se podría implementar un orden específico para los elementos que mencionaste utilizando `float` y una cuadrícula:

## HTML:

```html
<div class="container">
  <section class="section-1">Sección 1</section>
  <section id="section-2">Sección 2</section>
  <aside id="aside-1">Aside 1</aside>
  <aside id="aside-2">Aside 2</aside>
</div>
```

## CSS:

```css
cssCopy code.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
}

.section-1 {
  width: 100%;
  float: left;
  clear: both;
}

#section-2 {
  width: 100%;
  float: left;
  clear: both;
}

#aside-1 {
  width: 25%;
  float: right;
  margin-left: 20px;
}

#aside-2 {
  width: 25%;
  float: right;
}

@media screen and (max-width: 768px) {
  .section-1,
  #section-2,
  #aside-1,
  #aside-2 {
    width: 100%;
    float: none;
    margin: 0;
  }
}
```

En este ejemplo, se utiliza `float` para establecer un orden específico para los elementos. La sección 1 y la sección 2 se colocan en la primera columna de la cuadrícula, mientras que los elementos aside se colocan en la segunda columna. En la media consulta, se establece que todos los elementos deben ocupar el 100% del ancho y que no se deben flotar, lo que resulta en una disposición apilada en pantallas pequeñas.



# Ahora tendría que mostrar en 2 columnas la section 2 y el aside 1



Para mostrar la `section 2` y el `aside 1` en dos columnas, se puede utilizar la técnica de diseño de cuadrícula en CSS, aplicando estilos CSS a los elementos relevantes para establecer su anchura y colocación.

Aquí hay un ejemplo de cómo se podría implementar esta disposición de dos columnas:

## HTML:

```html
<div class="container">
  <section class="section-1">Sección 1</section>
  <section id="section-2">Sección 2</section>
  <aside id="aside-1">Aside 1</aside>
  <aside id="aside-2">Aside 2</aside>
</div>
```

## CSS:

```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 20px;
}

.section-1 {
  grid-column: 1 / -1;
}

#section-2 {
  grid-column: 1 / 2;
}

#aside-1 {
  grid-column: 2 / 3;
}

#aside-2 {
  grid-column: 2 / 3;
}

@media screen and (max-width: 768px) {
  .container {
    grid-template-columns: repeat(1, 1fr);
  }
}
```

En este ejemplo, se utiliza `display: grid` para crear una cuadrícula con dos columnas de ancho igual (`repeat(2, 1fr)`) y un espacio entre ellas (`grid-gap: 20px`). Se establece la propiedad `grid-column` para cada elemento para especificar en qué columnas de la cuadrícula deben aparecer. La `section-1` ocupa las dos columnas, mientras que la `section-2` ocupa la primera columna y el `aside-1` ocupa la segunda columna. El `aside-2` se coloca en la misma columna que el `aside-1`. En la media consulta, se establece que la cuadrícula debe tener solo una columna para dispositivos móviles.