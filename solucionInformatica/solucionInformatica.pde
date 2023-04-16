//Variable para cambiar la pantalla
enum PANTALLA {REGISTRO, INICIO, PRENDA, AÑADIR, EDITAR};
PANTALLA pantalla = PANTALLA.REGISTRO;

void setup() {
  
  //Funciones de arranque
  asignarColores();
  asignarMultimedia();
  conectarBBDD();
  setGUI();
  
  size(1920, 960);
  background(255);
  noStroke(); // Sin bordes
  textAlign(CENTER); textSize(18);
}

void draw() {
  
  //Dibujar cada pantalla según el valor de la variable de control
  switch(pantalla){
    case REGISTRO:dibujarPantalla0(); break;
    case INICIO: dibujarPantalla1(); break;
    case PRENDA: dibujarPantalla2(); break;
    case AÑADIR: dibujarPantalla3(); break;
    case EDITAR: dibujarPantalla4(); break;
  }
}
