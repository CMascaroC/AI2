enum PANTALLA {INICIO, PRENDA, AÑADIR, ELIMINADOS};
PANTALLA pantalla = PANTALLA.INICIO;

void setup() {
  asignarColores();
  asignarMultimedia();
  conectarBBDD();
  size(1920, 960);
  background(255);
  noStroke();                         // Sin bordes
  textAlign(CENTER); textSize(18);
    
  setGUI();
}

void draw() {
  
  switch(pantalla){
    case INICIO: dibujarPantalla1(); break;
    case PRENDA: dibujarPantalla2(); break;
    case AÑADIR: //dibujarPantalla3(); break;
    case ELIMINADOS: //dibujarPantalla4(); break;
  }
  //println("X: "+mouseX+", Y:"+mouseY);
}
