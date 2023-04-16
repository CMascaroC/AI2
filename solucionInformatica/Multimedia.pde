// Informació de la Multimedia de la App

// URL de la carpeta donde estan las imagenes
String URL_IMGS = "Imagenes/";
String URL_TIPOGRAFIAS = "Tipografias/";

// Array de imagenes (JPG, PNG, GIF)
PImage[] imgs;
PImage imagenAñadir ;
//PShape[] iconos;
PFont[] tipografias;

// Establece las imagenes de la App
void asignarMultimedia() {
  // Añadir imagenes de prendas y otros
  this.imgs = new PImage[16]; 
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
  this.imgs[15] = loadImage(URL_IMGS+"SubirImg.png");
  
  imagenAñadir = imgs[15];
  
  
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

PImage obtenerImagenAñadir(String img){
  PImage imagen=obtenerImgEn(15);
  println(img);
  switch(img){
    case "Sudadera1": imagen = obtenerImgEn(2); idImagenAñadir=1; break;
    case "Camiseta1": imagen = obtenerImgEn(3); idImagenAñadir=2; break;
    case "Camiseta2": imagen = obtenerImgEn(4); idImagenAñadir=3; break;
    case "Polo1": imagen = obtenerImgEn(5); idImagenAñadir=4; break;
    case "Sudadera2": imagen = obtenerImgEn(6); idImagenAñadir=5; break;
    case "Pantalon1": imagen = obtenerImgEn(7); idImagenAñadir=6; break;
    case "Chaqueta1": imagen = obtenerImgEn(8); idImagenAñadir=7; break;
    case "Camiseta3": imagen = obtenerImgEn(9); idImagenAñadir=8; break;
    case "Camiseta4": imagen = obtenerImgEn(10); idImagenAñadir=9; break;
    case "Camiseta5": imagen = obtenerImgEn(11); idImagenAñadir=10; break;
    case "Camiseta6": imagen = obtenerImgEn(12); idImagenAñadir=11; break;
    case "Polo2": imagen = obtenerImgEn(13); idImagenAñadir=12; break;
    case "Sudadera3": imagen = obtenerImgEn(14); idImagenAñadir=13; break;
  }
  return imagen;  
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
