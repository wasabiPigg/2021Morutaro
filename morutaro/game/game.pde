// gazou no youi
PImage gameUI, gameShadow, gameMessageWindow, gameNameWindow;
PImage morunn_front;
// hiritsu
float r = 1080/2875;
 
boolean showMsgFlag = false;

String name = "";
String msg = "";

// chara event flag
boolean flag_goin = false, flag_wasabi = false, flag_ichira = false;

// ひとますの大きさ
int blockSize = 100;

// キャラクターの座標
Int[] goin = {100, 100};
Int[] wasabi = {400, 400};
Int[] ichira = {300, 300};
Int[] morunn = {200, 200};

int clickCount = 0;

// キャラクターの向き
String direction = "down";

int state = -1;

// シーン番号
// 0 スタート画面
// 1 歩き回る画面
// 2 エンド画面
int scene = 1; // あとで0にする

// UI操作フラグ
boolean up = false, down = false, right = false, left = false, aButton = false, bButton = false;


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
  morunn_front = loadImage("./images/charactor/morunn-front.png");
}

void draw() {
  showUI();
  if (showMsgFlag == true) {
    showMsg();
  }
  
  if (scene == 1){
    text(direction, 100, 100);
    text(morunn, 300, 100);
    text(clickCount, 600, 100);
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
  if (2241*r<=mouseX && mouseX<=(2241+456)*r && 4465*r<=mouseY && mouseY <= (4465+456)*r){  // A
    aButton = true;
  }
  else if (1577*r<=mouseX && mouseX<=(1577+456)*r && 4465*r<=mouseY && mouseY <= (4671+456)*r) {  // B
    bButton = true;
  }
  else if (178*r<=mouseX && mouseX<=(178+975/3)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // ←
    left = true;
    direction = "left";
    morunn[0] -= blockSize;
    clickCount++;
  }
  else if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && 4309*r<=mouseY && mouseY <= (4309+975/3)*r) {  // ↑
    up = true;
    direction = "up";
  }
  else if ((178+975/3*2)*r<=mouseX && mouseX<=(178+975)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // →
    right = true;
    direction = "right";
  }
  else if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && (4309+975/3*2)*r<=mouseY && mouseY <= (4309+975)*r) {  // ↓
    down = true;
    direction = "down";
  }
}

void mousePressed() {
  // if (2241*r<=mouseX && mouseX<=(2241+456)*r && 4465*r<=mouseY && mouseY <= (4465+456)*r){  // A
  //   aButton = true;
  // }
  // else if (1577*r<=mouseX && mouseX<=(1577+456)*r && 4465*r<=mouseY && mouseY <= (4671+456)*r) {  // B
  //   bButton = true;
  // }
  // if (178*r<=mouseX && mouseX<=(178+975/3)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // ←
  //   left = true;
  //   direction = "left";
  // }
  // if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && 4309*r<=mouseY && mouseY <= (4309+975/3)*r) {  // ↑
  //   up = true;
  //   direction = "up";
  // }
  // if ((178+975/3*2)*r<=mouseX && mouseX<=(178+975)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // →
  //   right = true;
  //   direction = "right";
  // }
  // if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && (4309+975/3*2)*r<=mouseY && mouseY <= (4309+975)*r) {  // ↓
  //   down = true;
  //   direction = "down";
  // }
}
