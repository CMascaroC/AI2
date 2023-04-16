void dibujarBarraLateral() {
  //Barra Lateral
  pushMatrix();
  fill(obtenerColorEn(3));
  rect(0, 0, barraLateralAnchura, barraLateralAltura);
  strokeWeight(3);
  stroke(0);
  line(barraLateralAnchura, 0, barraLateralAnchura, barraLateralAltura);
  fill(0);
  noStroke();

  //Logo
  dibujarLogo(margenL, margenL, logoAnchura, logoAltura);

  //Botones
  for (int i=0; i<5; i++) {
    if (i!=2) {
      botones[i].dibujarBoton();
    }
  }
  
  //Campo de texto de buscador
  camposTexto[0].textoX = camposTexto[0].x+50;
  camposTexto[0].textoY = camposTexto[0].y+35;
  camposTexto[0].dibujarCampo();

  //Iconos
  dibujarImg(1, 60, logoAltura+2*margenL+7.5, 25, 25);

  popMatrix();
}
