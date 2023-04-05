// Declaració
Prenda p1, p2, p3, p4;
Boton[] botones;
PopUp eliminar;


color[] colors = {color(0), color(255), color(0, 0, 255), color(0, 255, 0), color(255, 0, 0)};
int[] cantidades = {10, 20, 7, 3, 9};
String[] tallas = {"S", "M", "L", "XL", "XXL"};

void setGUI(){
  crearPrendas();
  crearBotones();
  crearPopUp();
}

void crearPrendas(){
   p1 = new Prenda("Chaqueta", "SX450-3", "JHK", obtenerImgEn(0));
   p1.setDisponibilidadColores(cantidades, colors);
   
   p2 = new Prenda("Sudadera", "PM", "Sol's", obtenerImgEn(0));
   p2.setDisponibilidadColores(cantidades, colors);
   
   p3 = new Prenda("Camiseta", "PZ89", "Fruit", obtenerImgEn(0));
   p3.setDisponibilidadColores(cantidades, colors);
   
   p4 = new Prenda("Sudadera", "Fit-3", "Sol's", obtenerImgEn(0));
   p4.setDisponibilidadColores(cantidades, colors);
}

void crearBotones(){
this.botones = new Boton[8];

botones[0] = new Boton("Añadir", margen1, 700, 250, 60, 30);
botones[1] = new Boton("Eliminados", margen1, 800, 250, 60, 30);
botones[2] = new Boton("", margen1, logoAltura+2*margenL, 250, 40, 20);
botones[3] = new Boton("Por nombre", margen2, 465, 200, 50, 20);
botones[4] = new Boton("Por cantidad", margen2, 575, 200, 50, 20);
botones[5] = new Boton("Editar", 1100, 800, 250, 60, 30);
botones[6] = new Boton("Eliminar", 1100+350, 800, 250, 60, 30);
botones[7] = new Boton("Acceptar", 610 + 350 - buttonW/2, 280 + 400 - buttonH*2, buttonW, buttonH, 30);
}

void crearPopUp(){
   eliminar = new PopUp("Eliminar Prenda", "¿Está seguro que desea eliminar la prenda?", 610, 280, 700, 400);
}
