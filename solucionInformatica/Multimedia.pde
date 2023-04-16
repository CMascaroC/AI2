// Informació de la Multimedia de la App

// URL de la carpeta donde estan las imagenes
String URL_IMGS = "Imagenes/";
String URL_TIPOGRAFIAS = "Tipografias/";

// Array de imagenes (JPG, PNG, GIF)
PImage[] imgs;
//PShape[] iconos;
PFont[] tipografias;

// Establece las imagenes de la App
void asignarMultimedia() {
  // Añadir imagenes de prendas y otros
  this.imgs = new PImage[15]; 
  this.imgs[0] = loadImage(URL_IMGS+"logo.jpeg"); 
  this.imgs[1] = loadImage(URL_IMGS+"lupa.png");
  this.imgs[2] = loadImage(URL_IMGS+"Sudadera1.png");
  this.imgs[3] = loadImage(URL_IMGS+"Camiseta1.png");
  this.imgs[4] = loadImage(URL_IMGS+"Camiseta2.png");
  this.imgs[5] = loadImage(URL_IMGS+"Polo1.png");
  this.imgs[6] = loadImage(URL_IMGS+"Sudadera2.png");
  this.imgs[7] = loadImage(URL_IMGS+"Pantalon1.png");
  this.imgs[8] = loadImage(URL_IMGS+"Chaqueta1.png"); 
  this.imgs[9] = loadImage(URL_IMGS+"Camiseta3.png");
  this.imgs[10] = loadImage(URL_IMGS+"Camiseta4.png");
  this.imgs[11] = loadImage(URL_IMGS+"Camiseta5.png");
  this.imgs[12] = loadImage(URL_IMGS+"Camiseta6.png");
  this.imgs[13] = loadImage(URL_IMGS+"Polo2.png");
  this.imgs[14] = loadImage(URL_IMGS+"Sudadera3.png");
  
  
  // Añadir tipografias
  this.tipografias = new PFont[3];
  this.tipografias[0] = createFont(URL_TIPOGRAFIAS+"arial.ttf", 12);
  this.tipografias[1] = createFont(URL_TIPOGRAFIAS+"Optima nova LT Light Regular.otf", 12);
  this.tipografias[2] = createFont(URL_TIPOGRAFIAS+"VeraMono.ttf", 12);
}

//Getter tipografia
PFont obtenerTipografiaEn(int i){
  return this.tipografias[i];
}

// Getter del número de imagenes
int obtenerNumImagenes() {
  return this.imgs.length;
}

// Getter de la imagen del logo
PImage obtenerLogo() {
  return  this.imgs[0];
}

// Getter de la imagen i-ésima
PImage obtenerImgEn(int i) {
  return this.imgs[i];
}


// Dibujar el logo
void dibujarLogo(float x, float y, float w, float h) {
  image(obtenerLogo(), x, y, w, h);
  stroke(0);
  strokeWeight(1.5);
  noFill();
  rect(x, y, w, h);
  noStroke();
}

// Dibujar la imagen i-ésima
void dibujarImg(int i, float x, float y, float w, float h) {
  image(obtenerImgEn(i), x, y, w, h);
}
