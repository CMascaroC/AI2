// Declaració
Prenda [] prendas;
Boton[] botones;
PopUp eliminar;

color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255), color(150), color(0)};
int[] cantidades = {10, 20, 7, 3, 9, 4};
String[] tallas = new String[6];

void setGUI() {
  String[][] tallasPrendas = selectTablaTalla();
  for (int i=0; i<6; i++) {
    tallas[i] = tallasPrendas[i][1];
    println(tallas[i]);
  }
  crearPrendas();
  crearBotones();
  crearPopUp();
}

void crearPrendas() {
  this.prendas = new Prenda[8];

  prendas[0] = new Prenda("Chaqueta", "SX450-3", "JHK", obtenerImgEn(8));
  prendas[0].setDisponibilidadColores(cantidades, colors, tallas);

  prendas[1] = new Prenda("Sudadera", "PM", "Sol's", obtenerImgEn(12));
  prendas[1].setDisponibilidadColores(cantidades, colors, tallas);

  prendas[2] = new Prenda("Camiseta", "PZ89", "Fruit", obtenerImgEn(3));
  prendas[2].setDisponibilidadColores(cantidades, colors, tallas);

  prendas[3] = new Prenda("Sudadera", "Fit-3", "Sol's", obtenerImgEn(14));
  prendas[3].setDisponibilidadColores(cantidades, colors, tallas);

  prendas[4] = new Prenda("Camiseta", "Regent", "Sol's", obtenerImgEn(3));
  prendas[4].setDisponibilidadColores(cantidades, colors, tallas);

  prendas[5] = new Prenda("Camiseta", "TSRA150", "JHK", obtenerImgEn(4));
  prendas[5].setDisponibilidadColores(cantidades, colors, tallas);

  prendas[6] = new Prenda("Polo", "3407", "Fruit", obtenerImgEn(10));
  prendas[6].setDisponibilidadColores(cantidades, colors, tallas);

  prendas[7] = new Prenda("Pantalón", "Opla", "JHK", obtenerImgEn(9));
  prendas[7].setDisponibilidadColores(cantidades, colors, tallas);
}

void crearBotones() {
  this.botones = new Boton[11];

  botones[0] = new Boton("Añadir", margen1, 700, 250, 60, 30);
  botones[1] = new Boton("Eliminados", margen1, 800, 250, 60, 30);
  botones[2] = new Boton("", margen1, logoAltura+2*margenL, 250, 40, 20);
  botones[3] = new Boton("Por nombre", margen2, 465, 200, 50, 20);
  botones[4] = new Boton("Por cantidad", margen2, 575, 200, 50, 20);
  botones[5] = new Boton("Editar", 1100, 800, 250, 60, 30);
  botones[6] = new Boton("Eliminar", 1100+350, 800, 250, 60, 30);
  botones[7] = new Boton("Acceptar", 610 + 350 - buttonW/2, 280 + 400 - buttonH*2, buttonW, buttonH, 30);
  botones[8] = new Boton(">", 1840, 880, 60, 60, 30);
  botones[9] = new Boton("<", 370, 880, 60, 60, 30);
  botones[10] = new Boton("<", 370, 20, 60, 60, 30);
}

void crearPopUp() {
  eliminar = new PopUp("Eliminar Prenda", "¿Está seguro que desea eliminar la prenda?", 610, 280, 700, 400);
}
