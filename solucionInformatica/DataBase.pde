int nf = 0;

int obtenerNumFilas(String nombreTabla){
  msql.query( "SELECT COUNT(*) AS n FROM %s", nombreTabla);
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

String [][] selectTablaTalla(){
  
  int numRows = obtenerNumFilas("talla");
  println (numRows);
  String[][] data = new String[numRows][2];
  
  msql.query ("SELECT * FROM `talla`");
  
  while (msql.next()){
    data[nf][0] = String.valueOf(msql.getInt("idTalla"));
    data[nf][1] = msql.getString("Talla");
    nf++;
  }
  return data;
}
