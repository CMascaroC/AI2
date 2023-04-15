//Clase Campo de Texto

class CampoTexto {

  // Propiedades del campo de texto
  float x, y, h, w;

  // Colors
  color rellenarColor = color(obtenerColorEn(2));
  color rellenarColorSobre = color(obtenerColorEn(1));
  color rellenarColorDeshabilitado = color(150);
  color bordeColor = color(0);
  int grosorBorde = 2;

  // Texto del campo
  String texto = "";
  int textLength = 0;
  int textSize = 24;

  //Está seleccionado
  boolean selected = false;

  // Constructor
  CampoTexto(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  // Dibujar el campo de texto
  void dibujarCampo() {
    pushMatrix();
    
    textAlign(LEFT);
    if (selected) {
      fill(rellenarColorSobre);
      pagina=0;
      crearPrendasTexto(camposTexto[0].texto);
    } else {
      fill(rellenarColor);
    }

    strokeWeight(grosorBorde);
    stroke(bordeColor);
    rect(x, y, w, h, 5);

    fill(0);
    textSize(textSize);
    text(texto, x + 50, y + textSize+5);
    popMatrix();
  }

  // Añadir o quitar texto cuando se teclea
  void teclaPulsada(char key, int keyCode) {
    if (selected) {
      if (keyCode == (int)BACKSPACE) {
        removeText();
      } else if (keyCode == 32) {
        addText(' '); // SPACE
      } else {

        boolean isKeyCapitalLetter = (key >= 'A' && key <= 'Z');
        boolean isKeySmallLetter = (key >= 'a' && key <= 'z');
        boolean isKeyNumber = (key >= '0' && key <= '9');

        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
          addText(key);
        }
      }
    }
  }

  //Añadir letra al final
  void addText(char c) {
    if (textWidth(this.texto + c) < w) {
      this.texto += c;
      textLength++;
    }
  }

  // Quitar la última letra
  void removeText() {
    if (textLength > 0) {
      texto = texto.substring(0, textLength - 1);
      textLength--;
    }
  }

  // Indica si el ratón está sobre el campo de texto
  boolean mouseOverTextField() {
    if (mouseX >= this.x && mouseX <= this.x + this.w) {
      if (mouseY >= this.y && mouseY <= this.y + this.h) {
        return true;
      }
    }
    return false;
  }

  // Selecciona el camp de text si pitjam a sobre
  // Deselecciona el camp de text si pitjam a fora
  
}
