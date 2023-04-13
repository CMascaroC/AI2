int nf;

int obtenerNumFilas(String nombreTabla) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nombreTabla);
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

int obtenerIdModelo(String modelo){
  nf =0;
  msql.query ("SELECT `idModelo` AS n FROM `modelo` WHERE `Nombre`=\"%s\"", modelo);
  msql.next();
  int idModelo = msql.getInt("n");
  return idModelo;
}

int obtenerCantidadColor(String modelo, int idColor) {
  nf =0;
  
  int idModelo = obtenerIdModelo(modelo);
  msql.query ("SELECT SUM(`Cantidad`) AS c FROM `cantidad` WHERE `Modelo_idModelo` = "+idModelo+" AND `Color_idColor` ="+idColor);
  msql.next();
  int Cant = msql.getInt("c");
  
  //printArray(data);
  return Cant;
}

String [] selectTallas() {
  nf=0;
  //String[] data = {"XS", "S","M", "L", "XL", "XXL"};
  int numFilas = obtenerNumFilas("talla");

  String[] data = new String[numFilas];
  msql.query ("SELECT * FROM `talla`");
  while (msql.next()) {
    data[nf] = msql.getString("Talla");
    nf++;
  }
  //printArray(data);
  return data;
}

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
