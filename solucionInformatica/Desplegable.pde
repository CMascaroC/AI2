class Desplegable {

  float x, y, w, h;          // Posició i dimensions
  String[] texts;            // Valors possibles
  String selectedValue;      // Valor Seleccionat

  boolean collapsed = true;  // Plegat / Desplegat
  boolean enabled;           // Abilitat / desabilitat

  float lineSpace = 7;      // Espai entre línies

  Desplegable(String[] texts, float x, float y, float w, float h) {

    this.texts = texts;
    this.selectedValue = "";
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.enabled = true;
    this.collapsed = true;
  }

  void display() {
    pushStyle();
    textAlign(LEFT);
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(x, y, w, h, 10);

    fill(obtenerColorEn(3));
    rect(x + w - h, y, h, h, 10);

    fill(0);
    stroke(0);
    triangle(x + w - 35, y+15, x + w - 25, y + 32.5, x + w - 15, y+15);

    fill(0);
    textSize(24);
    text(selectedValue, x + 15, y + 35);

    if (!this.collapsed) {

      fill(255);
      stroke(0);
      rect(x, y+h, w, (h + lineSpace)*texts.length);

      for (int i=0; i<texts.length; i++) {

        if (i== clickedOption()) {
          fill(200);
          noStroke();
          rect(x+4, y+4 + h + (h + lineSpace)*i - 2, w -8, h + lineSpace - 8);
        }

        fill(0);
        text(texts[i], x + 10, y + h + 35 + (h + lineSpace)*i);
      }
    }
    popStyle();
  }

  void setCollapsed(boolean b) {
    this.collapsed = b;
  }

  void toggle() {
    this.collapsed = !this.collapsed;
  }


  void update() {
    int option = clickedOption();
    selectedValue = texts[option];
  }

  // Indica si el cursor està sobre el select
  boolean mouseOverSelect() {
    if (this.collapsed) {
      return (mouseX >= x) &&
        (mouseX <= x + w) &&
        (mouseY >= y) &&
        (mouseY <= y + h);
    } else {
      return (mouseX>= x) &&
        (mouseX<= x + w) &&
        (mouseY>= y) &&
        (mouseY<= y + h + (h + lineSpace)*texts.length);
    }
  }

  int clickedOption() {
    int i = (int)map(mouseY, y + h, y + h + (h + lineSpace)*texts.length,
      0, texts.length);
    return i;
  }
}
