class Button {

  float x, y, w, h;

  color fillColor, strokeColor, fillColorOver, fillColorDisabled;

  String textBoto;
  boolean enabled;

  Button(String text, float x, float y, float w, float h) {

    this.textBoto = text;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.enabled = true;

    fillColor = color(155, 55, 155);
    fillColorOver = color(255, 55, 155);
    fillColorDisabled = color(150);
    strokeColor = color(0);
  }

  void setEnabled(boolean b) {
    this.enabled = b;
  }

  void display() {
    pushStyle();
    if (!enabled) {
      fill(fillColorDisabled);  // Color desabilitat
    } else if (mouseOverButton()) {
      fill(fillColorOver);      // Color quan ratolí a sobre
    } else {
      fill(fillColor);          // Color actiu però ratolí fora
    }
    stroke(strokeColor);
    strokeWeight(2);        //Color i gruixa del contorn
    rect(this.x, this.y, this.w, this.h, 10);    // Rectangle del botó

    // Text (color, alineació i mida)
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text(textBoto, this.x + this.w/2, this.y + this.h/2 + 10);
    popStyle();
  }

  boolean mouseOverButton() {
    return (mouseX >= this.x) &&
      (mouseX<=this.x + this.w) &&
      (mouseY>= this.y) &&
      (mouseY<= this.y + this.h);
  }
}
