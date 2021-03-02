String msg = "click to increment";
int clickCount = 0;

void setup() {
  size(600, 600);
  background(0);
  textSize(40);
}

void draw() {
  background(0);
  fill(255);
  text(msg, 100, 100);

  text(clickCount, 300, 300);
  fill(255,0,0);
  rect(400, 400, 100, 100);
  fill(0,0,255);
  rect(200, 400, 100, 100);
}

void  touchStarted() {
  if (mouseX >= 200 && mouseX <= 300 && mouseY >= 400 && mouseY <= 500){
    clickCount--;
  } else if (mouseX >= 400 && mouseX <= 500 && mouseY >= 400 && mouseY <= 500){
    clickCount++;
  }

}
