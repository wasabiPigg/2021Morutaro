// gazou no youi
PImage gameUI, gameShadow, gameMessageWindow, gameNameWindow;
// hiritsu
float r = 1080/2875;
 
boolean showMsgFlag = false;

String name = "";
String msg = "";

void setup() {
  size(1080, 2220);
  background(255);
  
  stroke(255);
  fill(0);
  strokeWeight(5);
  textSize(60);
  
  // gazou yomikomi  
  gameUI = loadImage("./images/gameUI.png");
  gameShadow = loadImage("./images/画面影.png");
  gameMessageWindow = loadImage("./images/テキスト領域.png");
  gameNameWindow = loadImage("./images/名前領域.png");
}

void draw() {
  showUI();
  if (showMsgFlag == true) {
    showMsg();
  }
  showShadow();
}

void showUI() {
  image(gameUI, -10, 0, width, height);
}

void showMsg(){
  image(gameMessageWindow, 95.04, 1065.34957, 885.412174, 274.226087);
  image(gameNameWindow, 95.04, 1085.34957, 1183*r, 160*r);
  
  // show name
  textSize(40);
  text(name, 120, 1130.34957);
  
  // show msg
  textSize(30);
  fill(255);
  text(msg, 130, 1200);
}

void showShadow(){
  image(gameShadow, 253*r, 473*r, 2357*r, 3093*r);
}

void mouseClicked() {
  //ellipse(mouseX, mouseY, 50, 50);
}

void mousePressed() {
  if (2241*r<=mouseX && mouseX<=(2241+456)*r && 4465*r<=mouseY && mouseY <= (4465+456)*r){  // A
    name = "ナレーター";
    msg = "Aボタンが押されたようです。あってますか？";
    showMsgFlag = true;
  }
  else if (1577*r<=mouseX && mouseX<=(1577+456)*r && 4465*r<=mouseY && mouseY <= (4671+456)*r) {  // B
    name = "ナレーター";
    msg = "Bボタンが押されたようです。あってますか？";
    showMsgFlag = true;
  }
  if (178*r<=mouseX && mouseX<=(178+975/3)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // ←
    name = "ナレーター";
    msg = "左方向キーを押したようですね。";
    showMsgFlag = true;
  }
  if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && 4309*r<=mouseY && mouseY <= (4309+975/3)*r) {  // ↑
    name = "ナレーター";
    msg = "上方向キーを押したようですね。";
    showMsgFlag = true;
  }
  if ((178+975/3*2)*r<=mouseX && mouseX<=(178+975)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // →
    name = "ナレーター";
    msg = "右方向キーを押したようですね。";
    showMsgFlag = true;
  }
  if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && (4309+975/3*2)*r<=mouseY && mouseY <= (4309+975)*r) {  // ↓
    name = "ナレーター";
    msg = "下方向キーを押したようですね。";
    showMsgFlag = true;
  }
}
