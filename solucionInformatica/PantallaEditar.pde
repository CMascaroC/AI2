void dibujarPantalla4(){
  pushMatrix();
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);
  fill(obtenerColorEn(4));
  textFont(obtenerTipografiaEn(1));
  textAlign(LEFT);
  textSize(65);
  
  
  
  for(int i=0; i<6; i++){
    contadores[i].display();
    camposTexto[i+3].dibujarCampo();
    fill(coloresPrendas[i]); strokeWeight(2); 
    ellipse(1200, 325+100*i, 30, 30);
  }
    
  camposTexto[9].texto = prendas[prendaDetallada].nombre;
  camposTexto[10].texto = prendas[prendaDetallada].modelo;
  camposTexto[11].texto = prendas[prendaDetallada].marca;
  imagenAñadir = prendas[prendaDetallada].imagen;
  
  camposTexto[9].dibujarCampo();
  camposTexto[10].dibujarCampo();
  camposTexto[11].dibujarCampo();
  
  image(imagenAñadir, 550, 150, 400, 600);
  stroke(0); strokeWeight(3); noFill();
  rect(550, 150, 400, 600);
  
  fill(0); textSize(25); textAlign(RIGHT);
  text("Imágen:", 630, 87.5);
  text("Tipo:", 1375, 87.5);
  text("Modelo:", 1375, 157.5);
  text("Marca:", 1375, 227.5);
  desplegables[0].display();
  
  botones[12].dibujarBoton();
  botones[10].dibujarBoton();
  
  //Dibujar Barra Lateral
  dibujarBarraLateral();
  popMatrix();
}
