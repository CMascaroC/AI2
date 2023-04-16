//Clase Campo de Texto

class CampoTexto {

  // Propiedades del campo de texto
  float x, y, h, w;

  // Colors
  color rellenarColor = color(230);
  color rellenarColorSobre = color(obtenerColorEn(6));
  color rellenarColorDeshabilitado = color(150);
  color bordeColor = color(0);
  int grosorBorde = 2;

  // Texto del campo
  String texto = "";
  String noVisible = "";
  int textLength = 0;
  int textSize = 24;
  float textoX, textoY;
  boolean visible = true;

  //Está seleccionado
  boolean selected = false;

  // Constructor
  CampoTexto(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.textoX = x+50;
    this.textoY = y+textSize/2-5;
  }

  // Dibujar el campo de texto
  void dibujarCampo() {
    pushMatrix();

    textAlign(LEFT);
    if (selected) {
      fill(rellenarColorSobre);
    } else {
      fill(rellenarColor);
    }

    strokeWeight(grosorBorde);
    stroke(bordeColor);
    rect(x, y, w, h, 5);

    fill(0);
    textSize(textSize);
    println(texto);
    text(texto, textoX, textoY);
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
      if (visible) {
        this.texto += c;
        textLength++;
      } else{
        this.noVisible +=c;
        this.texto += "*";
        textLength++;
      }
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
