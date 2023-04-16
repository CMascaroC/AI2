//Escuchar el teclado

void keyPressed() {
  //Indica la tecla pulsada para escribir en le campo de texto
  for(int i=0; i<9; i++){
  camposTexto[i].teclaPulsada(key, (int)keyCode);
  }
}
