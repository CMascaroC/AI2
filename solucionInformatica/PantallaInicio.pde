void dibujarPantalla1() {
  //Zona Principal
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);

  dibujarPrendasInicio(pagina*4);

  if (pagina==0) {
    botones[8].dibujarBoton();
  } else if (pagina==int(prendas.length/4)-1) {
    botones[9].dibujarBoton();
  } else {
    botones[8].dibujarBoton();
    botones[9].dibujarBoton();
  }
  
  dibujarBarraLateral();

  pushStyle();
  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("Pág: "+(pagina+1), 1135, 920);
  popStyle();
}

void dibujarPrendasInicio(int x) {
  for (int i=x; i<x+4; i++) {
    prendas[i].dibujarPrendas(i%4);
  }
}
