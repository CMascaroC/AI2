int pagina=0;

void mousePressed() {

  if (mouseX>65 && mouseX<285 && mouseY>65 && mouseY<285) {
    pagina=0;
    pantalla=PANTALLA.INICIO;
  }

  if (pantalla == PANTALLA.INICIO) {
    if (botones[0].ratonSobreBoton() && botones[0].habilitado) {
      println(botones[0]+" pulsado");
    }
    for (int i=0; i<4; i++) {
      if (prendas[i].ratonSobrePrenda(i)) {
        pantalla = PANTALLA.PRENDA;
        prendaDetallada = pagina*4+i;
      }
    }
    if (botones[8].ratonSobreBoton() && botones[8].habilitado) {
      println(botones[8]+"pulsado");
      pagina=pagina+1;
    }

    if (botones[9].ratonSobreBoton() && botones[8].habilitado) {
      println(botones[9]+"pulsado");
      if (pagina!=0) {
        pagina=pagina-1;
      }
    }
  } else if (pantalla == PANTALLA.PRENDA) {
    if (botones[1].ratonSobreBoton() && botones[1].habilitado) {
      println(botones[1]+" pulsado");
      pantalla = PANTALLA.INICIO;
    }

    if (botones[6].ratonSobreBoton() && botones[6].habilitado) {
      println(botones[6]+" pulsado");
      eliminar.setVisible(true);
    }
    if (botones[7].ratonSobreBoton() && botones[7].habilitado) {
      println(botones[7]+" pulsado");
      eliminar.setVisible(false);
    }
    if (botones[10].ratonSobreBoton() && botones[10].habilitado) {
      println(botones[10]+" pulsado");
      pantalla = PANTALLA.INICIO;
    }
  }
  //  Botones pulsados
  for (int i=0; i<botones.length; i++) {
    if (botones[i].ratonSobreBoton() && botones[i].habilitado) {
      println(botones[i]+" pulsado");
    }
  }
}
