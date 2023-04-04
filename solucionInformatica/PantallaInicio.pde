void dibujarPantalla1(){
  //Zona Principal
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);
  p1.dibujarPrenda(0);
  p2.dibujarPrenda(1);
  p3.dibujarPrenda(2);
  p4.dibujarPrenda(3);
  
  dibujarBarraLateral();  
}
