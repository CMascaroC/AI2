int pagina=0;
int maxPaginas;
boolean registrado = false;

void mousePressed() {
  //Barra lateral
  if (registrado) {
    //Barra lateral
    if (mouseX>65 && mouseX<285 && mouseY>65 && mouseY<285) {
      pagina=0;
      pantalla=PANTALLA.INICIO;
      orden=false;
    }
    if (botones[3].ratonSobreBoton() && botones[3].dibujado) {
      println(botones[3]+" pulsado");
      orden=true;
      pantalla=PANTALLA.INICIO;
      camposTexto[0].texto = "";
      camposTexto[0].selected = false;
      crearPrendasOrdenAlfabetico();
      pagina=0;
    }
    if (botones[4].ratonSobreBoton() && botones[4].dibujado) {
      println(botones[4]+" pulsado");
      pantalla=PANTALLA.INICIO;
      orden=true;
      camposTexto[0].texto = "";
      camposTexto[0].selected = false;
      crearPrendasOrdenCant();
      pagina=0;
    }
    if (botones[1].ratonSobreBoton() && botones[1].dibujado) {
      println(botones[1]+" pulsado");
      pantalla=PANTALLA.INICIO;
      orden=true;
      camposTexto[0].texto = "";
      camposTexto[0].selected = false;
      crearPrendasSinStock();
      pagina=0;
    }

    if (botones[0].ratonSobreBoton() && botones[0].dibujado) {
      println(botones[0]+" pulsado");
      pantalla = PANTALLA.AÑADIR;
    }

    if (camposTexto[0].mouseOverTextField()) {
      camposTexto[0].selected = true;
      orden=true;
    } else {
      camposTexto[0].selected = false;
    }

    //Pantalla Inicio
    if (pantalla == PANTALLA.INICIO) {
      int prendasPg=4;
      if (prendas.length<4) {
        prendasPg=prendas.length;
      }
      for (int i=0; i<prendasPg; i++) {
        if (prendas[i].ratonSobrePrenda(i)) {
          pantalla = PANTALLA.PRENDA;
          prendaDetallada = pagina*4+i;
          println("sobre prenda " +i);
        }
      }

      if (botones[8].ratonSobreBoton() && botones[8].habilitado) {
        println(botones[8]+"pulsado");
        pagina=pagina+1;
      }

      if (botones[9].ratonSobreBoton() && botones[8].habilitado) {
        println(botones[9]+"pulsado");
        pagina=pagina-1;
      }
    }

    //Pantalla Prenda
    else if (pantalla == PANTALLA.PRENDA) {
      if (botones[1].ratonSobreBoton() && botones[1].habilitado) {
        println(botones[1]+" pulsado");
        pantalla = PANTALLA.INICIO;
      }
      
      if (botones[5].ratonSobreBoton() && botones[5].habilitado) {
        println(botones[5]+" pulsado");
        pantalla = PANTALLA.EDITAR;
      }

      if (botones[6].ratonSobreBoton() && botones[6].habilitado) {
        println(botones[6]+" pulsado");
        eliminar.setVisible(true);
      }
      if (botones[7].ratonSobreBoton() && botones[7].habilitado) {
        println(botones[7]+" pulsado");
        eliminar.setVisible(false);
        eliminarStockModelo(prendas[prendaDetallada].modelo);
        println(prendas[prendaDetallada].modelo);
        sinStock+=1;
        orden = false;
        camposTexto[0].texto = "";
        pantalla = PANTALLA.INICIO;
      }
      if (botones[11].ratonSobreBoton() && botones[11].habilitado) {
        println(botones[11]+" pulsado");
        eliminar.setVisible(false);
      }
      if (botones[10].ratonSobreBoton() && botones[10].habilitado) {
        println(botones[10]+" pulsado");
        pantalla = PANTALLA.INICIO;
      }
    }

    //Pantalla de añadir prenda
    else if (pantalla == PANTALLA.AÑADIR) {
      for (int i=0; i<6; i++) {
        contadores[i].update();
      }
      for (int i=3; i<12; i++) {
        if (camposTexto[i].mouseOverTextField()) {
          camposTexto[i].selected = true;
          orden=true;
        } else {
          camposTexto[i].selected = false;
        }
      }

      if (desplegables[0].mouseOverSelect() && desplegables[0].enabled) {
        if (!desplegables[0].collapsed) {
          desplegables[0].update();  // Actualitzar valor
          imagenAñadir = obtenerImagenAñadir(desplegables[0].selectedValue);
          image(imagenAñadir, 500, 250, 450, 650);
        }
        desplegables[0].toggle();        // Plegar o desplegar
      }
      
      if (botones[12].ratonSobreBoton() && botones[12].dibujado) {
        int idMarca = obtenerIdMarca(camposTexto[11].texto);
        int idTipo = obtenerIdTipo(camposTexto[9].texto);
        String modelo = camposTexto[10].texto;
        println("Finalizar pulsado");
        insertarModelo(modelo, idMarca, idTipo, idImagenAñadir);
        int idModelo = obtenerIdModelo(modelo);
        for (int i=3; i<9; i++) {
          if (!(camposTexto[i].texto.equals(""))) {
            int idTalla = obtenerIdTalla(camposTexto[i].texto);
            int cantidad = contadores[i-3].value;
            int idColor = i-2;
            insertarCantidades(cantidad, idModelo, idTalla, idColor);
          }
        }
        crearPrendasNoOrden();
        orden=false;
        pantalla = PANTALLA.INICIO;
      }
      
      if (botones[10].ratonSobreBoton() && botones[10].habilitado) {
        println(botones[10]+" pulsado");
        crearPrendasNoOrden();
        orden=false;
        pantalla = PANTALLA.INICIO;
      }
    }
    
    else if (pantalla == PANTALLA.EDITAR){
      for (int i=0; i<6; i++) {
        contadores[i].update();
      }
      for (int i=3; i<12; i++) {
        if (camposTexto[i].mouseOverTextField()) {
          camposTexto[i].selected = true;
          orden=true;
        } else {
          camposTexto[i].selected = false;
        }
      }

      if (desplegables[0].mouseOverSelect() && desplegables[0].enabled) {
        if (!desplegables[0].collapsed) {
          desplegables[0].update();  // Actualitzar valor
          imagenAñadir = obtenerImagenAñadir(desplegables[0].selectedValue);
          image(imagenAñadir, 500, 250, 450, 650);
        }
        desplegables[0].toggle();        // Plegar o desplegar
      }
      
      if (botones[12].ratonSobreBoton() && botones[12].dibujado) {
        String modelo = camposTexto[10].texto;
        int idModelo = obtenerIdModelo(modelo);
        for (int i=3; i<9; i++) {
          if (!(camposTexto[i].texto.equals(""))) {
            int idTalla = obtenerIdTalla(camposTexto[i].texto);
            int cantidad = contadores[i-3].value;
            int idColor = i-2;
            insertarCantidades(cantidad, idModelo, idTalla, idColor);
          }
        }
        crearPrendasNoOrden();
        orden=false;
        pantalla = PANTALLA.INICIO;
      }
      
      if (botones[10].ratonSobreBoton() && botones[10].habilitado) {
        println(botones[10]+" pulsado");
        crearPrendasNoOrden();
        orden=false;
        pantalla = PANTALLA.INICIO;
      }
    }
  }

  //Pantalla de inicio de sesión
  else {
    if (pantalla == PANTALLA.REGISTRO) {
      if (camposTexto[1].mouseOverTextField()) {
        camposTexto[1].selected = true;
        orden=true;
      } else {
        camposTexto[1].selected = false;
      }

      if (camposTexto[2].mouseOverTextField()) {
        camposTexto[2].selected = true;
        orden=true;
      } else {
        camposTexto[2].selected = false;
      }

      if (botones[2].ratonSobreBoton() && botones[2].dibujado) {
        if (camposTexto[1].texto.equals("GraficSolutions")&&camposTexto[2].noVisible.equals("12345")) {
          pantalla = PANTALLA.INICIO;
          registrado=true;
        } else {
          camposTexto[1].texto = "";
          camposTexto[2].texto = "";
          camposTexto[2].noVisible = "";
          camposTexto[1].rellenarColor = obtenerColorEn(5);
          camposTexto[2].rellenarColor = obtenerColorEn(5);
          camposTexto[1].rellenarColorSobre = obtenerColorEn(5);
          camposTexto[2].rellenarColorSobre = obtenerColorEn(5);
        }
      }
    }
  }
}
