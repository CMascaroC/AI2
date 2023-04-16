//Dibujar la pantalla inicial
boolean orden = false;

void dibujarPantalla1() {
  //Zona Principal
  
  for(int i=0; i<12; i++){
    camposTexto[i].texto = "";
  }
  for(int i=0; i<6; i++){
    contadores[i].value = 0;
  }
  imagenAñadir = obtenerImgEn(15);
  
  fill(obtenerColorEn(6));
  rect(0, 0, width, height);

  if (!orden) {
    crearPrendasNoOrden();
  }
  if (camposTexto[0].selected) {
    orden=true;
    crearPrendasTexto(camposTexto[0].texto);
  }
  dibujarPrendasInicio(pagina*4);
  
  dibujarBarraLateral();

  pushStyle();
  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("Pág: "+(pagina+1), 1135, 920);
  popStyle();
  
  if(prendas.length%4==0){
  maxPaginas = prendas.length/4-1;
  }else {
  maxPaginas = prendas.length/4;
  }

  if (pagina==0) {
    botones[8].dibujarBoton();
  } else if (pagina==maxPaginas) {
    botones[9].dibujarBoton();
  } else {
    botones[8].dibujarBoton();
    botones[9].dibujarBoton();
  }
}

void dibujarPrendasInicio(int x) {
  for (int i=x; i<x+4; i++) {
    println(prendas.length);
    if (i<prendas.length) {
      prendas[i].dibujarPrendas(i%4);
    }
  }
}
