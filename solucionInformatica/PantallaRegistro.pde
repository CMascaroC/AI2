void dibujarPantalla0(){
  pushMatrix();
  
  //fondo
  fill(obtenerColorEn(1)); noStroke();
  rect(0, 0, width, height);
  
  //zona central
  fill(obtenerColorEn(3)); stroke(0); strokeWeight(2);
  rect(width/2-350, height/2-450, 700, 900, 10);
  
  //Logo
  dibujarLogo(width/2-110, height/2-450+margenL, logoAnchura, logoAltura);
  
  //Texto
  fill(obtenerColorEn(0));
  textFont(obtenerTipografiaEn(1)); textAlign(CENTER); textSize(65);
  text("Iniciar Sesión", width/2, height/2-75);
  textFont(obtenerTipografiaEn(0)); textAlign(LEFT); textSize(24); fill(0);
  text("Usuario:", 710, 480);
  text("Contraseña:", 710, 630);
  
  botones[2].dibujarBoton();
  
  //Campos de texto
  camposTexto[1].textoX = 720; 
  camposTexto[2].textoX = 720;
  camposTexto[1].textoY = 535; 
  camposTexto[2].textoY = 685;
  camposTexto[2].visible = false;
  
  camposTexto[1].dibujarCampo();
  camposTexto[2].dibujarCampo();
  
  popMatrix();
}
