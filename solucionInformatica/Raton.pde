void mousePressed(){
  
  if(pantalla == PANTALLA.INICIO){
   if(botones[0].ratonSobreBoton() && botones[0].habilitado){
      println(botones[0]+" pulsado");
      pantalla = PANTALLA.PRENDA;
   }
  }
  else if(pantalla == PANTALLA.PRENDA){
    if(botones[1].ratonSobreBoton() && botones[1].habilitado){
      println(botones[1]+" pulsado");
      pantalla = PANTALLA.INICIO;
   }
  }
//  Botones pulsados
  for (int i=0; i<botones.length; i++){
    if(botones[i].ratonSobreBoton() && botones[i].habilitado){
      println(botones[i]+" pulsado");
    }
  }
}
