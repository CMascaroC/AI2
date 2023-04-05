void dibujarPantalla2(){
  //Zona Principal
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);
  p2.dibujarPrenda();
  eliminar.dibujarPopUp();
  
  dibujarBarraLateral();  
}
