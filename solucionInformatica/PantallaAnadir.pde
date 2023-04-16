void dibujarPantalla3() {
  //Zona Principal
  pushMatrix();
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);
  fill(obtenerColorEn(4));
  textFont(obtenerTipografiaEn(1));
  textAlign(LEFT);
  textSize(65);
  text("Añadir Prenda", 450, 110);
  popMatrix();
  
  for(int i=0; i<4; i++){
    contadores[i].display();
  }
  
  //Dibujar Barra Lateral
  dibujarBarraLateral();
}
