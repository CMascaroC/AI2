class Contador {
  
  // Valor del contador
  int value = 0;
  int minValue = 0, maxValue = 30;
  int stepValue = 1;
  
 // Propietats d'un counter:
 float x, y, w, h;  // Posició i dimensions
 
 // Colors de farciment i contorn
 color fillColor, strokeColor;

 
 // Mètode Constructor
 Contador(float x, float y, float w, float h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   fillColor = color(255);
   strokeColor = color(0);
 }
 
 // Setters
 void setInitialValue(int n){
   this.value = n;
 }
 
 void setValues(int minValue, int maxValue){ 
   this.minValue = minValue; 
   this.maxValue = maxValue;
 }
 
 // Dibuixa el botó
 void display(){
   pushMatrix();
   textFont(obtenerTipografiaEn(0));
   fill(fillColor);   // Color 
   stroke(strokeColor); strokeWeight(2);      //Color i gruixa del contorn
   rect(this.x, this.y, this.w + 2*this.h, this.h, 10);   // Rectangle del botó
   
   fill(0); textSize(24);
   text(value, this.x + 20, this.y + this.h/2 + 10);
   
   // Icona del botó
   fill(obtenerColorEn(3)); stroke(0);
   rect(this.x + this.w, this.y, this.h, this.h, 10);
   rect(this.x + this.w + this.h, this.y, this.h, this.h, 10);
   
   fill(0); textSize(36);
   text("+",   this.x + this.w+15, this.y+5, this.h, this.h);
   text("-", this.x + this.w + this.h+20, this.y+2.5, this.h, this.h);
   popMatrix();
 }
 
 boolean mouseOverButtons(){
   return mouseOverButtonMes() || mouseOverButtonMenys();
 }
 
 // Indica si el cursor està sobre el botó Més
 boolean mouseOverButtonMes(){
   return mouseX >= this.x + this.w && mouseX <= this.x + this.w + this.h &&
          mouseY >= this.y && mouseY <= this.y + this.h; 
 }
 
 // Indica si el cursor està sobre el botó Menys
 boolean mouseOverButtonMenys(){
   return mouseX >= this.x + this.w + this.h && mouseX <= this.x + this.w + 2*this.h &&
          mouseY >= this.y && mouseY <= this.y + this.h; 
 }
 
 void increment(){
   this.value += stepValue;
   if(this.value>this.maxValue){
     this.value = this.maxValue;
   }
 }
 
 void decrement(){
   this.value -= stepValue;
   if(this.value<this.minValue){
     this.value = this.minValue;
   }
 }
 
 void update(){
   if(mouseOverButtonMes()){
     increment();
   }
   else if(mouseOverButtonMenys()){
     decrement();
   }
 }
  
}
