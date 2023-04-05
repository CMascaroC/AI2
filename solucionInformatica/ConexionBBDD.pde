// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

// Objecte de connexió a la BBDD
MySQL msql;

void conectarBBDD() {

  // Paràmetres de la connexió
  String user = "admin";
  String pass = "12345";
  String database = "stock_roba";

  // Establim la connexió
  msql = new MySQL( this, "localhost", database, user, pass );

  // Si la connexió s'ha establert
  if (msql.connect()) {
    // La connexió ha funcionat!!!
    println("Connected to database!!");
  } else {
    // La connexió ha fallat!!!
    println("Connection failed !");
  }
}

/*
String[][] getInfoPrenda(String idModel){
  
  int numRows = getNumRows("model");
  
  String[][] data = new String[numRows][4];
  String q ="SELECT * FROM model WHERE idmodel='"+idModel+"'";
  msql.query(q);
  int nr=0;
  while(msql.next()){
    data[nr][0] = String.valueOf(msql.getInt("idmodel"));
    data[nr][1] = msql.getString("nommodel");
    nr++;
  }
  return data;
}
*/
