//Escuchar el teclado

void keyPressed() {
  //Indica la tecla pulsada para escribir en le campo de texto
  camposTexto[0].teclaPulsada(key, (int)keyCode);
  camposTexto[1].teclaPulsada(key, (int)keyCode);
  camposTexto[2].teclaPulsada(key, (int)keyCode);
}
