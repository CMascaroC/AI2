// Declaració
Prenda [] prendas;
Boton[] botones;
PopUp eliminar;
CampoTexto[] camposTexto;
Contador[] contadores;
Desplegable[] desplegables;
String[] tallas = {"XS", "S", "M", "L", "XL", "XXL"};
String[] imagenes = {"Sudadera1", "Camiseta1", "Camiseta2", "Polo1", "Sudadera2", "Pantalon1",
     "Chaqueta1", "Camiseta3", "Camiseta4", "Camiseta5", "Camiseta6", "Polo2", "Sudadera3"};

//Llamada a las funciones para definir cada tipo de elemento
void setGUI() {
  crearBotones();
  crearPopUp();
  crearCampoTexto();
  crearContadores();
  crearDesplegables();
  crearPrendasNoOrden();
}

//Crear las prendas por orden "aleatorio", segun la inserción en la base de datos
void crearPrendasNoOrden() {

  //Array con la información de los modelos
  String[][] tablaPrendas = selectTablaModelo();

  //Crear las prendas
  crearPrendas(tablaPrendas);
}

//Crear las prendas por orden alfabético
void crearPrendasOrdenAlfabetico() {
  String[][] tablaPrendas = selectTablaModeloAlfabetico();
  crearPrendas(tablaPrendas);
}

//Crear las prendas por orden según la cantidad
void crearPrendasOrdenCant() {
  String[][] tablaPrendas = selectTablaModeloCant();
  crearPrendas(tablaPrendas);
}

//Crear las prendas según el texto introducido en el buscador
void crearPrendasTexto(String t) {
  String[][] tablaPrendas = selectTablaModeloOrdenTexto(t);
  crearPrendas(tablaPrendas);
}

void crearPrendasSinStock() {
  String[][] tablaPrendas = selectTablaSinStock();
  crearPrendas(tablaPrendas);
}

//Crear las prendas a partir de un array con la información de la base de datos
void crearPrendas(String[][] tablaPrendas) {

  //Definir array de prendas
  this.prendas = new Prenda[tablaPrendas.length];

  for (int i=0; i<tablaPrendas.length; i++) {

    //A través del id (clave externa) de la información de la prenda
    //Se obtiene la información a mostrar
    String tipo = obtenerTipo(int(tablaPrendas[i][3]));
    String modelo = tablaPrendas[i][1];
    String marca = obtenerMarca(int(tablaPrendas[i][2]));

    //Se crean las prendas con esa información
    prendas[i] = new Prenda(tipo, modelo, marca, obtenerImgEn(int(tablaPrendas[i][4])+1));
    prendas[i].asignarDisponibilidad();
  }
}

//Crear los botones
void crearBotones() {
  this.botones = new Boton[13];

  botones[0] = new Boton("Añadir", margen1, 700, 250, 60, 30);
  botones[1] = new Boton("Sin Stock", margen1, 800, 250, 60, 30);
  botones[2] = new Boton("Introducir", width/2-125, 800, 250, 60, 30);
  botones[3] = new Boton("Por modelo", margen2, 465, 200, 50, 20);
  botones[4] = new Boton("Por cantidad", margen2, 575, 200, 50, 20);
  botones[5] = new Boton("Editar", 1100, 800, 250, 60, 30);
  botones[6] = new Boton("Eliminar", 1100+350, 800, 250, 60, 30);
  botones[7] = new Boton("Aceptar", 610 + 2*700/3 - buttonW/2, 280 + 400 - buttonH*2, buttonW, buttonH, 30);
  botones[8] = new Boton(">", 1840, 880, 60, 60, 30);
  botones[9] = new Boton("<", 370, 880, 60, 60, 30);
  botones[10] = new Boton("<", 370, 20, 60, 60, 30);
  botones[11] = new Boton("Cancelar", 610 + 700/3 - buttonW/2, 280 + 400 - buttonH*2, buttonW, buttonH, 30);
  botones[12] = new Boton("Finalizar", 625, 800, 250, 60, 30);
}

//Crear el pop-up
void crearPopUp() {
  eliminar = new PopUp("Eliminar Prenda", "¿Está seguro que desea eliminar \n toda la disponibilidad de la prenda?", 610, 280, 700, 400);
}

//Crear campos de texto
void crearCampoTexto() {
  this.camposTexto = new CampoTexto[12];

  // buscador
  camposTexto[0] = new CampoTexto(margen1, logoAltura+2*margenL, 250, 40);
  camposTexto[1] = new CampoTexto(710, 500, 500, 50);
  camposTexto[2] = new CampoTexto(710, 650, 500, 50);
  for (int i=3; i<9; i++) {
    camposTexto[i] = new CampoTexto(1250, 300+100*(i-3), 300, 50);
    camposTexto[i].rellenarColorSobre = obtenerColorEn(3);
    camposTexto[i].rellenarColor = color(255);
    camposTexto[i].textoY = camposTexto[i].textoY + 27.5;
    camposTexto[i].textoX = camposTexto[i].textoX - 30;
  }

  for (int i=9; i<12; i++) {
    camposTexto[i] = new CampoTexto (1400, 50+70*(i-9), 400, 50);
    camposTexto[i].rellenarColorSobre = obtenerColorEn(3);
    camposTexto[i].rellenarColor = color(255);
    camposTexto[i].textoY = camposTexto[i].textoY + 27.5;
    camposTexto[i].textoX = camposTexto[i].textoX - 30;
  }
}

void crearContadores() {
  this.contadores = new Contador[6];

  for (int i=0; i<6; i++) {
    contadores[i] = new Contador(1600, 300+100*i, 100, 50);
  }
}

void crearDesplegables(){
  this.desplegables = new Desplegable[1];
  
  desplegables[0] = new Desplegable(imagenes, 650, 50, 300, 50);
}
