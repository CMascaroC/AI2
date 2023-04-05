class ListaColoresDisponibles{

  color[] colores;
  int[] disponibilidad;
  String[] tallas;
  
  ListaColoresDisponibles (int n){
    colores = new color[n];
    disponibilidad = new int[n];
    tallas = new String[n];
  }
  
  void asignarColores(color[] cs){
    this.colores = cs;
  }
  
  void asignarDesponibilidad(int[] dp){
    this.disponibilidad = dp;
  }
  
  void asignarTallas(String[] tl){
    this.tallas = tl;
  }
  
  void dibujarColoresDisponibles(float x, float y, float r){
    pushStyle();
      for (int i=0; i<colores.length; i++){
        fill(colores[i]); stroke(0); strokeWeight(2);
        ellipse(x + (2*r - 100)*i, y, 2*r, 2*r);
        fill(0); textAlign(CENTER); textSize(24);
        text (disponibilidad[i], x+(2*r-100)*i, y+2*r+20);
       // text (tallas[i], x+(2*r-100)*i, y+2*r+20+50);
      }
    popStyle();
  }
  
  void dibujarColoresDisponibles(float x, float y){
    pushStyle();
      for (int i=0; i<colores.length; i++){
        fill(colores[i]); stroke(0); strokeWeight(2);
        
        if((i%2) == 0){
        ellipse(x, (2*15 + 100)*(i/2) + y, 2*15, 2*15);
        }
        else{
        ellipse(x+400, (2*15 + 100)*(i/2) + y, 2*15, 2*15);
        }
        fill(0); textAlign(LEFT); textSize(24);
        
        if((i%2) == 0){
        text(disponibilidad[i], x+50, (2*15 + 100)*(i/2) + y+7);
        }
        else{
        text(disponibilidad[i], x+450, (2*15 + 100)*(i/2) + y+7);
        }
      }
    popStyle();
  }
}
