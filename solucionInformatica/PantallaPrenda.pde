int prendaDetallada;

void dibujarPantalla2(){
  //Zona Principal
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);
  prendas[prendaDetallada].dibujarPrenda();
  botones[10].dibujarBoton();
  eliminar.dibujarPopUp();
  
  dibujarBarraLateral();  
}
