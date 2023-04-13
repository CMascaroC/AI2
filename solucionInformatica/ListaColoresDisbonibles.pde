class ListaColoresDisponibles {

  color[] colores;
  int[][]disponibilidad;
  String[] tallas;

  ListaColoresDisponibles (int n) {
    colores = new color[n];
    disponibilidad = new int[n][n];
    tallas = new String[n];
  }

  void asignarColores(color[] cs) {
    this.colores = cs;
  }

  void asignarDisponibilidad(int[][] dp) {
    this.disponibilidad = dp;
  }

  void asignarTallas(String[] tl) {
    this.tallas = tl;
  }
  

  void dibujarColoresDisponibles(float x, float y, float r) {
    pushStyle();
    for (int i=0; i<colores.length; i++) {
      fill(colores[i]);
      stroke(0);
      strokeWeight(2);
      ellipse(x + (2*r - 100)*i, y, 2*r, 2*r);
      fill(0);
      textAlign(CENTER);
      textSize(24);
      //for(int j=0; j<6; j++){
      
      //}
      text(disponibilidad[i][1], x+(2*r-100)*i, y+2*r+20);
    }
    popStyle();
  }

  void dibujarColoresDisponibles(float x, float y) {
    pushStyle();
    for (int i=0; i<colores.length; i++) {
      fill(colores[i]);
      stroke(0);
      strokeWeight(2);

      if ((i%2) == 0) {
        ellipse(x, (2*15 + 200)*(i/2) + y, 2*15, 2*15);
      } else {
        ellipse(x+400, (2*15 + 200)*(i/2) + y, 2*15, 2*15);
      }
      fill(0);
      textAlign(LEFT);
      textSize(24);

      if ((i%2) == 0) {
        for (int j=0; j<6; j++) {
          text(tallas[j], x+50, (2*15 + 200)*(i/2) + y+7 + 35*j);
          //text(disponibilidad[i][i], x+100, (2*15 + 200)*(i/2) + y+7+35*j);
        }
      } else {
        for (int j=0; j<6; j++) {
          text(tallas[j], x+450, (2*15 + 200)*(i/2) + y+7 + 35*j);
          //text(disponibilidad[i][j], x+500, (2*15 + 200)*(i/2) + y+7+35*j);
        }        
      }
    }
    popStyle();
  }
}
