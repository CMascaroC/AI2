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
 // String [][] colores = selectTablaColor();
  //ImprimirTabla(colores);
}

/*void ImprimirTabla(String[][] nom) {
  for (int i=0; i<nom.length; i++) {
    printArray(nom[i]);
  }
}*/
