color[] colores;

// Estableix colores de l'App
void asignarColores() {
  this.colores = new color[7];
  this.colores[0] = color(#A51C40); //Rojo oscuro
  this.colores[1] = color(#116D70); //Verde oscuro
  this.colores[2] = color(#42C2BE); //Verde claro
  this.colores[3] = color(#CDCFD1); //Gris claro
  this.colores[4] = color(#000000); //Negro
  this.colores[5] = color(#FF6774); //Rojo claro
  this.colores[6] = color(#D1FFFD); //Verde fondo
}

// Getter del número de colores
int obtenerNumColores() {
  return this.colores.length;
}

// Getter del color primario
color obtenerPrimerColor() {
  return  this.colores[0];
}

// Getter del color secundari
color obtenerSegundoColor() {
  return  this.colores[1];
}

// Getter del color terciari
color obtenerTercerColor() {
  return  this.colores[2];
}

// Getter del color i-èssim
color obtenerColorEn(int i) {
  return this.colores[i];
}
