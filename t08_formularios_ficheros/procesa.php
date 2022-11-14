<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Recogida datos formulario con PHP</title>
  
  <style>
  section {border: 1px solid blue; padding: 1em; margin:1em;}
  code { 
    color: blue;
  }

  pre {
    margin: 0 2em;
  }

  .out {
    background-color: black;
    color: white;
    padding:0.5em;
  }
  </style>
</head>

<body>
  <h1>Página PHP: recibe parámetros de un formulario</h1>

  <p> Recibe parámetros de un formulario y los muestra. Para ello se ven varias posibilidades de PHP.</p>

  <section>
    <h2>Con print_r sobre el objeto <code>REQUEST</code></h2>
    <p>The print_r() function is used to print human-readable information about a variable. </p>

    <pre><code> 
    &lt;?php print_r($_REQUEST); ?&gt;
	  </code></pre>
    <pre class="out"><?php  print_r($_REQUEST); ?></pre>
  </section> 

  <section>
    <h2>Con var_dump </h2>
    <ul>
	    <li>Si el valor de la variable es una cadena de texto, var_dump imprime la cadena entre dobles comillas, print_r no.</li>
	    <li>print_r no imprime nada visible para false y cadenas vacías.</li>
	    <li>var_dump proporciona información sobre el tamaño y tipo de datos de la variable y, en el caso de arrays y objetos, de los elementos que la componen. print_r no da información sobre el tamaño de la variable ni sobre el tipo de datos.</li>
    </ul>

    <pre><code> 
    &lt;?php var_dump($_REQUEST); ?&gt;
    </code></pre>

    <pre class="out"><?php  var_dump($_REQUEST); ?> </pre>

  </section> 


  <section>
    <h2>Con bucle <code>foreach</code> que recorra objeto <code>REQUEST</code></h2>
  
    <pre><code> 
    &lt;?php
    foreach($_REQUEST as $key=&gt;$value){
      echo $key, ' =&gt; ', $value, &quot;&lt;br/&gt;&quot;;
    }
    ?&gt;
    </code></pre>
    
    <pre class="out"><?php
      foreach($_REQUEST as $key=>$value){
          echo $key, ' => ', $value, "<br/>";
      }
      ?>
	  </pre>

  </section>

  <section>
  	<h2>Recorremos con foreach pero generamos salida a tabla HTML</h2>


    <?php
	    echo "<table border='1'>";
      echo "<tr><th scope='col'>Campo</th> <th scope='col'>Valor</th></tr>";
		  foreach($_REQUEST as $key=>$value){
		     echo "<tr> <td>" , $key, '</td><td> ', $value, "</td></tr>";
		  }
		  echo "</table>";
	 ?>



  </section>
</body>

</html>