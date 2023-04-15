// Librería de MySQL y Processing
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

// Objeto de connexión a la BBDD
MySQL msql;

void conectarBBDD() {

  // Parámetres de la connexión
  String user = "admin";
  String pass = "12345";
  String database = "stock_roba";

  // Establecer la connexión
  msql = new MySQL( this, "localhost", database, user, pass );
  msql.connect();
}
