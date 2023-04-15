//Contador del número de fila
int nf;

//Obtener el número de filas de una tabla
int obtenerNumFilas(String nombreTabla) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nombreTabla);
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

//Obtener el ID de un modelo conociendo el nombre
int obtenerIdModelo(String modelo) {
  nf =0;
  msql.query ("SELECT `idModelo` AS n FROM `modelo` WHERE `Nombre`=\"%s\"", modelo);
  msql.next();
  int idModelo = msql.getInt("n");
  return idModelo;
}

//Obtener el número de prendas disponibles por color de un modelo concreto
int obtenerCantidadColor(String modelo, int idColor) {
  nf =0;

  int idModelo = obtenerIdModelo(modelo);
  msql.query ("SELECT SUM(`Cantidad`) AS c FROM `cantidad` WHERE `Modelo_idModelo` = "+idModelo+" AND `Color_idColor` ="+idColor);
  msql.next();
  int Cant = msql.getInt("c");

  return Cant;
}

//Obtener las tallas
String [] selectTallas() {
  nf=0;
  int numFilas = obtenerNumFilas("talla");

  String[] data = new String[numFilas];
  msql.query ("SELECT * FROM `talla`");
  while (msql.next()) {
    data[nf] = msql.getString("Talla");
    nf++;
  }
  return data;
}

//Obtener la tabla tallas
String [][] selectTablaTalla() {
  nf=0;
  int numRows = obtenerNumFilas("talla");
  //println (numRows);
  String[][] data = new String[numRows][2];

  msql.query ("SELECT * FROM `talla`");

  while (msql.next()) {
    data[nf][0] = String.valueOf(msql.getInt("idTalla"));
    data[nf][1] = msql.getString("Talla");
    nf++;
  }
  return data;
}

//Obtener la cantidad de prendas de un modelo, talla y color
int obtenerCantidadColorTalla(String modelo, int idColor, int idTalla) {
  nf =0;

  int idModelo = obtenerIdModelo(modelo);
  msql.query ("SELECT SUM(`Cantidad`) AS c FROM `cantidad` WHERE `Modelo_idModelo` = "+idModelo+" AND `Color_idColor` ="+idColor+" AND `Talla_idTalla`="+idTalla);
  msql.next();
  int Cant = msql.getInt("c");

  return Cant;
}

//Obtener la tabla modelo
String [][] selectTablaModelo() {
  nf=0;
  int numRows = obtenerNumFilas("modelo");
  //println (numRows);
  String[][] data = new String[numRows][5];

  msql.query ("SELECT * FROM `modelo`");

  while (msql.next()) {
    data[nf][0] = String.valueOf(msql.getInt("idModelo"));
    data[nf][1] = msql.getString("Nombre");
    data[nf][2] = msql.getString("Marca_idMarca");
    data[nf][3] = msql.getString("Tipo_idTipo");
    data[nf][4] = msql.getString("Imágen_idImágen");
    nf++;
  }
  return data;
}

//Obtener la marca a partir de su id
String obtenerMarca(int idMarca) {
  msql.query ("SELECT `Nombre` AS n FROM `marca` WHERE `idMarca`="+ idMarca);
  msql.next();
  String marca = msql.getString("n");
  return marca;
}

//Obtener el tipo de prenda a partir de su id
String obtenerTipo(int idTipo) {
  msql.query ("SELECT `Nombre` AS n FROM `tipo` WHERE `idTipo`="+ idTipo);
  msql.next();
  String tipo = msql.getString("n");
  return tipo;
}

//Obtener el modelo a partir de su id
String obtenerModelo(int idModelo) {
  msql.query ("SELECT `Nombre` AS n FROM `modelo` WHERE `idModelo`="+ idModelo);
  msql.next();
  String modelo = msql.getString("n");
  return modelo;
}

//Obtener los modelos por orden alfabetico
String [][] selectTablaModeloAlfabetico() {
  nf=0;
  int numRows = obtenerNumFilas("modelo");
  //println (numRows);
  String[][] data = new String[numRows][5];

  msql.query ("SELECT * FROM `modelo` ORDER BY `Nombre`");

  while (msql.next()) {
    data[nf][0] = String.valueOf(msql.getInt("idModelo"));
    data[nf][1] = msql.getString("Nombre");
    data[nf][2] = String.valueOf(msql.getString("Marca_idMarca"));
    data[nf][3] = String.valueOf(msql.getString("Tipo_idTipo"));
    data[nf][4] = String.valueOf(msql.getString("Imágen_idImágen"));
    nf++;
  }
  return data;
}

//Obtener los modelos segun la cantidad
String [][] selectTablaModeloCant() {
  nf=0;
  int numRows = obtenerNumFilas("modelo");
  //println (numRows);
  String[][] data = new String[numRows][5];

  msql.query ("SELECT m.idModelo, m.Nombre, m.Marca_idMarca, m.Tipo_idTipo, m.Imágen_idImágen FROM cantidad c INNER JOIN modelo m ON c.Modelo_idModelo = m.idModelo GROUP BY c.Modelo_idModelo ORDER BY SUM(`Cantidad`) DESC;");

  while (msql.next()) {
    data[nf][0] = String.valueOf(msql.getInt("idModelo"));
    data[nf][1] = msql.getString("Nombre");
    data[nf][2] = String.valueOf(msql.getString("Marca_idMarca"));
    data[nf][3] = String.valueOf(msql.getString("Tipo_idTipo"));
    data[nf][4] = String.valueOf(msql.getString("Imágen_idImágen"));
    nf++;
  }
  return data;
}

//Obtener los modelos segun su relación con un texto (buscador)
String [][] selectTablaModeloOrdenTexto(String texto) {  
  msql.query("SELECT COUNT(*) AS n FROM modelo m INNER JOIN marca mc ON m.Marca_idMarca = mc.idMarca INNER JOIN tipo t ON m.Tipo_idTipo = t.idTipo WHERE m.Nombre LIKE '"+texto+"%' OR mc.Nombre LIKE '"+texto+"%' OR t.Nombre LIKE '"+texto+"%' ORDER BY m.Nombre;");
  msql.next();
  int numRows = msql.getInt("n");
  String[][] data = new String[numRows][5];

  msql.query ("SELECT * FROM modelo m INNER JOIN marca mc ON m.Marca_idMarca = mc.idMarca INNER JOIN tipo t ON m.Tipo_idTipo = t.idTipo WHERE m.Nombre LIKE '"+texto+"%' OR mc.Nombre LIKE '"+texto+"%' OR t.Nombre LIKE '"+texto+"%' ORDER BY m.Nombre;");
  nf=0;
  while (msql.next()) {
    data[nf][0] = String.valueOf(msql.getInt("idModelo"));
    data[nf][1] = msql.getString("Nombre");
    data[nf][2] = msql.getString("Marca_idMarca");
    data[nf][3] = msql.getString("Tipo_idTipo");
    data[nf][4] = msql.getString("Imágen_idImágen");
    nf++;
  }
  return data;
}
