class PopUp {
  
  // Dimensions
  float x, y, w, h;
  
 // Propietats
 PImage img;
 String title;
 String message;
 
 boolean visible;
 
 // Constructor
 
 PopUp(String title, String message, float x, float y, float w, float h){
   this.title = title;
   this.message = message;
   this.x = x; this.y = y; 
   this.w = w; this.h = h;
 }
 
 //Setters
 
 void setImage(PImage img){
   this.img = img;
 }
 
 void setTexts(String title, String message){
   this.title = title;
   this.message = message;
 }
 
 void setVisible(boolean b){
   this.visible = b;
   if(!this.visible){
     botones[7].asignarHabilitado(false);
   }
   else {
     botones[7].asignarHabilitado(true);
   }
 }
 
 // Dibuixa el PopUp
 
 void dibujarPopUp(){
   
   if(this.visible){
     float b = 40;
     
     pushStyle();
     
     // Rectangle
     stroke(0); strokeWeight(3); fill(colores[3]);
     rect(x, y, w, h, 10);
     
     line(x, y + 2*b , x+w, y + 2*b);
     
     // Títol
     fill(0); textSize(38); textAlign(LEFT);
     text(title, x + b, y + 1.4*b);
     
     // Missatge
     fill(0);textSize(30); textAlign(CENTER);
     text(message, x + w/2, y + 4*b);
     
     // Botó d'Acceptar
     botones[7].dibujarBoton();
     popStyle();
   }
 }
 
  
}
