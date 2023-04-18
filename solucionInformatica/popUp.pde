//Clase Pop-Up

class PopUp {

  // Dimensiones
  float x, y, w, h;

  // Propiedades
  String title;
  String message;

  boolean visible;

  // Constructor
  PopUp(String title, String message, float x, float y, float w, float h) {
    this.title = title;
    this.message = message;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  //Setters

  void setTexts(String title, String message) {
    this.title = title;
    this.message = message;
  }

  void setVisible(boolean b) {
    this.visible = b;
    if (!this.visible) {
      botones[7].asignarHabilitado(false);
    } else {
      botones[7].asignarHabilitado(true);
    }
  }

  // Dibujar el Pop-Up

  void dibujarPopUp() {

    if (this.visible) {
      float b = 40;

      pushStyle();

      stroke(0);
      strokeWeight(3);
      fill(colores[3]);
      rect(x, y, w, h, 10);

      line(x, y + 2*b, x+w, y + 2*b);

      // Título
      fill(0);
      textSize(38);
      textAlign(LEFT);
      text(title, x + b, y + 1.4*b);

      // Mensaje
      fill(0);
      textSize(30);
      textAlign(CENTER);
      text(message, x + w/2, y + 4*b);

      // Botoes
      botones[7].dibujarBoton();//Aceptar
      botones[11].dibujarBoton();//Cancelar
      popStyle();
    }
  }
}
