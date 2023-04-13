class Prenda {
  String nombre;
  String modelo;
  String marca;
  PImage imagen;
  ListaColoresDisponibles lcd;
  String observaciones;

  Prenda(String nombre, String modelo, String marca, PImage imagen) {
    this.nombre = nombre;
    this.modelo = modelo;
    this.imagen = imagen;
    this.marca = marca;
  }

  void setDisponibilidadColores(int[][] s, color[] c, String[] t) {
    lcd = new ListaColoresDisponibles(s.length);
    lcd.asignarColores(c);
    lcd.asignarDisponibilidad(s);
    lcd.asignarTallas(t);
    printArray(t);
  }

  PImage obtenerImagen() {
    return this.imagen;
  }

  String obtenerModelo() {
    return this.modelo;
  }

  String obtenerNombre() {
    return this.nombre;
  }

  String obtenerMarca() {
    return this.marca;
  }

  void dibujarPrendas(int i) {
    pushStyle();

    stroke(0);
    strokeWeight(3);
    fill(obtenerColorEn(3));
    rect(barraLateralAnchura+prendaMargenX, prendaMargenY+margenPrendas*i, prendaAnchura, prendaAltura, 10);

    image(this.imagen, prendaImgX, prendaMargenY+prendaMargenImg+margenPrendas*i, prendaImgMedidaX, prendaImgMedidaY);
    stroke(0);
    strokeWeight(1.5);
    noFill();
    rect(prendaImgX, prendaMargenY+prendaMargenImg+margenPrendas*i, prendaImgMedidaX, prendaImgMedidaY);
    noStroke();


    textMode(LEFT);
    fill(0);
    textSize(30);
    text(nombre, prendaNombreX, prendaTextoY+margenPrendas*i);
    text(modelo, prendaModeloX, prendaTextoY+margenPrendas*i);
    text(marca, prendaMarcaX, prendaTextoY+margenPrendas*i);

    lcd.dibujarColoresDisponibles(1750, 175+margenPrendas*i, 15);
    popStyle();
  }

  void dibujarPrenda() {
    pushStyle();
    textAlign(LEFT);

    stroke(0);
    strokeWeight(3);
    fill(obtenerColorEn(3));

    image(this.imagen, 550, 125, 400, 600);
    stroke(0);
    strokeWeight(1.5);
    noFill();
    rect(550, 125, 400, 600);
    noStroke();

    fill(0);
    textSize(35);
    text(nombre, textoPrendaX, 780);
    text(modelo, textoPrendaX, 840);
    text(marca, textoPrendaX, 900);

    lcd.dibujarColoresDisponibles(1100, 125);

    botones[5].dibujarBoton();
    botones[6].dibujarBoton();

    popStyle();
  }

  boolean ratonSobrePrenda(int i) {
    return (mouseX >= 450) &&
      (mouseX <= 1820) &&
      (mouseY>= 100+(50+150)*i) &&
      (mouseY<= 250+(50+150)*i);
  }
}
