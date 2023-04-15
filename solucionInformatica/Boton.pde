//Clase botón

class Boton {
  
 // Propiedades de un botón:
 float x, y, w, h;  // Posición y dimensiones
 
 // colores de contorno, relleno, activo y desactivo
 color rellenarColor, bordeColor;
 color rellenarColorSobre, rellenarColorDeshabilitado;
 
 String textoBoton;  // Texto
 int numLetras; //Tamaño de la letra
 boolean habilitado, dibujado;  // Habilitado / deshabilitado, dibujado/no dibujado
 
 // Método Constructor
 Boton(String texto, float x, float y, float w, float h, int numLetras){
   this.textoBoton = texto;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.numLetras = numLetras;
   this.habilitado = true;
   this.dibujado = false;
   rellenarColor = color(obtenerColorEn(2));
   rellenarColorSobre = color(obtenerColorEn(1));
   rellenarColorDeshabilitado = color(150);
   bordeColor = color(0);
 }
 
 // Setters
 
 void asignarHabilitado(boolean b){
   this.habilitado = b;
 }
 
 // Dibujar el botón
 void dibujarBoton(){
   pushStyle();
   this.dibujado=true;
   if(!habilitado){
     fill(rellenarColorDeshabilitado);  // Color desabilitat
     cursor(ARROW);
   }
   else if(ratonSobreBoton()){
     fill(rellenarColorSobre); // Color quan ratolí a sobre
     cursor(HAND);
   }
   else{
     fill(rellenarColor);          // Color actiu però ratolí fora
     cursor(ARROW);
   }
   
   stroke(bordeColor); strokeWeight(2);        //Color i gruixa del contorn
   rect(this.x, this.y, this.w, this.h, 10);    // Rectangle del botó
   
   // Texto
   fill(0); textAlign(CENTER); textFont(tipografias[2]); textSize(numLetras);
   text(textoBoton, this.x + this.w/2, this.y + this.h-17.5);
   popStyle();
 }
 
 // Indica si el cursor está sobre el botón
 boolean ratonSobreBoton() {
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + this.h)&& this.dibujado; 
 }
}
