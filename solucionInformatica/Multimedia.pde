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
  this.imgs = new PImage[2]; 
  this.imgs[0] = loadImage(URL_IMGS+"logo.jpeg"); 
  this.imgs[1] = loadImage(URL_IMGS+"lupa.png");
  
  // Añadir tipografias
  this.tipografias = new PFont[3];
  this.tipografias[0] = createFont(URL_TIPOGRAFIAS+"arial.ttf", 12);
  this.tipografias[1] = createFont(URL_TIPOGRAFIAS+"Optima nova LT Light Regular.otf", 12);
  this.tipografias[2] = createFont(URL_TIPOGRAFIAS+"VeraMono.ttf", 12);
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


// Dibuja el logo
void dibujarLogo(float x, float y, float w, float h) {
  image(obtenerLogo(), x, y, w, h);
  stroke(0);
  strokeWeight(1.5);
  noFill();
  rect(x, y, w, h);
  noStroke();
}

// Dibuja la imagen i-ésima
void dibujarImg(int i, float x, float y, float w, float h) {
  image(obtenerImgEn(i), x, y, w, h);
}
