void dibujarPantalla3() {
  //Zona Principal
  pushMatrix();
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);
  fill(obtenerColorEn(4));
  textFont(obtenerTipografiaEn(1));
  textAlign(LEFT);
  textSize(65);
  text("Añadir  Prenda", 450, 110);
  popMatrix();
  
  for(int i=0; i<6; i++){
    contadores[i].display();
    camposTexto[i+3].dibujarCampo();
    fill(coloresPrendas[i]); strokeWeight(2); 
    ellipse(1200, 325+100*i, 30, 30);
  }
  
  //Dibujar Barra Lateral
  dibujarBarraLateral();
}
