//Clase Lista Colores Disponibles

class ListaColoresDisponibles {
  //Atributos
  color[] colors = {color(0), color(255), color(0, 0, 255), color(0, 255, 0), color(255, 0, 0), color(150)};
  int[][] cantidades;
  String[] tallasPrendas = new String[6];
  int[] cantCol;

  //Constructor
  ListaColoresDisponibles (int n) {
    cantidades = new int[n][n];
    cantCol = new int[n];
  }

//Setters
  void asignarDisponibilidad(int[][] dp) {
    this.cantidades = dp;
  }
  
  void asignarDisponibilidadColores(int[] dc) {
    this.cantCol = dc;
  }
  
  void asignarLCD(String modelo) {
    this.tallasPrendas = new String[6];
    tallasPrendas = selectTallas();

    this.cantCol = new int[6];
    for (int i=0; i<6; i++) {
      cantCol[i] = obtenerCantidadColor(modelo, i+1);
    }

    this.cantidades = new int[6][6];
    for (int i=0; i<6; i++) {
      for (int j=0; j<6; j++) {
        cantidades[i][j] = obtenerCantidadColorTalla(modelo, i+1, j+1);
      }
    }
  }
  
  //Dibujar la disponibilidad solo por colores (Pantalla Inicio)
  void dibujarColoresDisponibles(float x, float y, float r) {
    pushStyle();
    for (int i=0; i<colors.length; i++) {
      //Colores
      fill(colors[i]);
      stroke(0);
      strokeWeight(2);
      ellipse(x + (2*r - 100)*i, y, 2*r, 2*r);
      fill(0);
      //Cantidad
      textAlign(CENTER);
      textSize(24);
      text(cantCol[i], x+(2*r-100)*i, y+2*r+20);
    }
    popStyle();
  }
  
  //Dibujar la disponibilidad detallada de un modelo
  void dibujarColoresDisponibles(float x, float y) {
    pushStyle();
    for (int i=0; i<colors.length; i++) {
      //Colores
      fill(colors[i]);
      stroke(0);
      strokeWeight(2);

      if ((i%2) == 0) {
        ellipse(x, (2*15 + 200)*(i/2) + y, 2*15, 2*15);
      } else {
        ellipse(x+400, (2*15 + 200)*(i/2) + y, 2*15, 2*15);
      }
      
      //Tallas y cantidad
      fill(0);
      textAlign(LEFT);
      textSize(24);

      if ((i%2) == 0) {
        for (int j=0; j<6; j++) {
          text(tallasPrendas[j], x+50, (2*15 + 200)*(i/2) + y+7 + 35*j);
          text(cantidades[i][j], x+100, (2*15 + 200)*(i/2) + y+7+35*j);
        }
      } else {
        for (int j=0; j<6; j++) {
          text(tallasPrendas[j], x+450, (2*15 + 200)*(i/2) + y+7 + 35*j);
          text(cantidades[i][j], x+500, (2*15 + 200)*(i/2) + y+7+35*j);
        }
      }
    }
    popStyle();
  }
}
