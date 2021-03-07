// gazou no youi
PImage gameUI, gameUI2, gameShadow, gameMessageWindow, gameNameWindow, background1, background2;
PImage morunn_front, morunn_left, morunn_right, morunn_back;
PImage ichira_front, ichira_left, ichira_right, ichira_back;
PImage wasabi_front, wasabi_left, wasabi_right, wasabi_back;
PImage goin_front, goin_left, goin_right, goin_back;
PImage endMsg;

// hiritsu
float r = 1080/2875;
 
boolean showMsgFlag = false;

String name = "";
String msg = "";

// chara event flag
boolean flag_goin = false, flag_wasabi = false, flag_ichira = false;

// セリフ用
boolean tmpFlag = false;

// ひとますの大きさ
int blockSize = 200;

// キャラクターの初期座標
Int[] goin = {150, 500};
Int[] wasabi = {550, 300};
Int[] ichira = {550, 700};
Int[] morunn = {350, 900};

// もるんのうしろについていく時の座標
Int[] firstPerson = {350, 900};
Int[] secondPerson = {350, 900};
Int[] thirdPerson = {350, 900};
// 向き
String d1, d2, d3;

// もるんの正面ひとつまえのマス
Int[] action = {350, 1100};

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
  bg1 = loadImage("./images/background1.jpg");
  bg2 = loadImage("./images/background2.jpg");
  gameUI = loadImage("./images/gameUI.png");
  gameUI2 = loadImage("./images/gameUI2.png");
  gameShadow = loadImage("./images/画面影.png");
  gameMessageWindow = loadImage("./images/テキスト領域.png");
  gameNameWindow = loadImage("./images/名前領域.png");
  morunn_front = loadImage("./images/charactor/morunn-front.png");
  morunn_left = loadImage("./images/charactor/morunn-left.png");
  morunn_right = loadImage("./images/charactor/morunn-right.png");
  morunn_back = loadImage("./images/charactor/morunn-back.png");
  ichira_front = loadImage("./images/charactor/ichira-front.png");
  ichira_back = loadImage("./images/charactor/ichira-back.png");
  ichira_left = loadImage("./images/charactor/ichira-left.png");
  ichira_right = loadImage("./images/charactor/ichira-right.png");
  wasabi_front = loadImage("./images/charactor/wasabi-front.png");
  wasabi_back = loadImage("./images/charactor/wasabi-back.png");
  wasabi_left = loadImage("./images/charactor/wasabi-left.png");
  wasabi_right = loadImage("./images/charactor/wasabi-right.png");
  goin_front = loadImage("./images/charactor/goin-front.png");
  goin_back = loadImage("./images/charactor/goin-back.png");
  goin_left = loadImage("./images/charactor/goin-left.png");
  goin_right = loadImage("./images/charactor/goin-right.png");
  endMsg = loadImage("./images/end.png");
}

void draw() {
  charaResize();
  showUI();

  // もるんの正面のマス
  if( direction == "up") {
    action[0] = morunn[0];
    action[1] = morunn[1] - blockSize;
  } else if ( direction == "down" ) {
    action[0] = morunn[0];
    action[1] = morunn[1] + blockSize;
  } else if ( direction == "left" ) {
    action[0] = morunn[0] - blockSize;
    action[1] = morunn[1];
  } else if ( direction == "right" ) {
    action[0] = morunn[0] + blockSize;
    action[1] = morunn[1];
  }
  
  if (scene == 1){
    if (morunn[1] <= -150){
      scene == 2;
      showEnd();
    } else {
      image(bg1, 10, 10);
      showCharactors();
    }
  }
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
  text(name, 130, 1130.34957);
  
  // show msg
  textSize(30);
  fill(255);
  text(msg, 150, 1200);

  // さんかくのまーく
  if ((frameCount % 10) < 5) {
    textSize(40);
    fill(255);
    text("▼", 850, 1280);
  }
}

void charaResize() {
  bg1.resize(1000,0);
  bg2.resize(1000,0);
  morunn_front.resize(400, 0);
  morunn_left.resize(400, 0);
  morunn_right.resize(400, 0);
  morunn_back.resize(400, 0);
  ichira_front.resize(400, 0);
  ichira_left.resize(400, 0);
  ichira_right.resize(400, 0);
  ichira_back.resize(400, 0);
  goin_front.resize(400, 0);
  goin_left.resize(400, 0);
  goin_right.resize(400, 0);
  goin_back.resize(400, 0);
  wasabi_front.resize(400, 0);
  wasabi_left.resize(400, 0);
  wasabi_right.resize(400, 0);
  wasabi_back.resize(400, 0);
  endMsg.resize(800, 0);
}

void showCharactors() {
  if(ichira[1] <= goin[1] && goin[1] <= wasabi[1] && wasabi[1] <= morunn[1]){
    showIchira();
    showGoin();
    showWasabi();
    showMorunn();
  }
  else if(ichira[1] <= goin[1] && goin[1] <= morunn[1] && morunn[1] <= wasabi[1]){
    showIchira();
    showGoin();
    showMorunn();
    showWasabi();
  }
  else if(ichira[1] <= wasabi[1] && wasabi[1] <= goin[1] && goin[1] <= morunn[1]){
    showIchira();
    showWasabi();
    showGoin();
    showMorunn();
  }
  else if(ichira[1] <= wasabi[1] && wasabi[1] <= morunn[1] && morunn[1] <= goin[1]){
    showIchira();
    showWasabi();
    showMorunn();
    showGoin();
  }
  else if(ichira[1] <= morunn[1] && morunn[1] <= goin[1] && goin[1] <= wasabi[1]){
    showIchira();
    showMorunn();
    showGoin();
    showWasabi();
  }
  else if(ichira[1] <= morunn[1] && morunn[1] <= wasabi[1] && wasabi[1] <= goin[1]){
    showIchira();
    showMorunn();
    showWasabi();
    showGoin();
  }
  else if(goin[1] <= ichira[1] && ichira[1] <= wasabi[1] && wasabi[1] <= morunn[1]){
    showGoin();
    showIchira();
    showWasabi();
    showMorunn();
  }
  else if(goin[1] <= ichira[1] && ichira[1] <= morunn[1] && morunn[1] <= wasabi[1]){
    showGoin();
    showIchira();
    showMorunn();
    showWasabi();
  }
  else if(goin[1] <= wasabi[1] && wasabi[1] <= ichira[1] && ichira[1] <= morunn[1]){
    showGoin();
    showWasabi();
    showIchira();
    showMorunn();
  }
  else if(goin[1] <= wasabi[1] && wasabi[1] <= morunn[1] && morunn[1] <= ichira[1]){
    showGoin();
    showWasabi();
    showMorunn();
    showIchira();
  }
  else if(goin[1] <= morunn[1] && morunn[1] <= ichira[1] && ichira[1] <= wasabi[1]){
    showGoin();
    showMorunn();
    showIchira();
    showWasabi();
  }
  else if(goin[1] <= morunn[1] && morunn[1] <= wasabi[1] && wasabi[1] <= ichira[1]){
    showGoin();
    showMorunn();
    showWasabi();
    showIchira();
  }
  else if(wasabi[1] <= goin[1] && goin[1] <= ichira[1] && ichira[1] <= morunn[1]){
    showWasabi();
    showGoin();
    showIchira();
    showMorunn();
  }
  else if(wasabi[1] <= goin[1] && goin[1] <= morunn[1] && morunn[1] <= ichira[1]){
    showWasabi();
    showGoin();
    showMorunn();
    showIchira();
  }
  else if(wasabi[1] <= ichira[1] && ichira[1] <= goin[1] && goin[1] <= morunn[1]){
    showWasabi();
    showIchira();
    showGoin();
    showMorunn();
  }
  else if(wasabi[1] <= ichira[1] && ichira[1] <= morunn[1] && morunn[1] <= goin[1]){
    showWasabi();
    showIchira();
    showMorunn();
    showGoin();
  }
  else if(wasabi[1] <= morunn[1] && morunn[1] <= goin[1] && goin[1] <= ichira[1]){
    showWasabi();
    showMorunn();
    showGoin();
    showIchira();
  }
  else if(wasabi[1] <= morunn[1] && morunn[1] <= ichira[1] && ichira[1] <= goin[1]){
    showWasabi();
    showMorunn();
    showIchira();
    showGoin();
  }
  else if(morunn[1] <= goin[1] && goin[1] <= wasabi[1] && wasabi[1] <= ichira[1]){
    showMorunn();
    showGoin();
    showWasabi();
    showIchira();
  }
  else if(morunn[1] <= goin[1] && goin[1] <= ichira[1] && ichira[1] <= wasabi[1]){
    showMorunn();
    showGoin();
    showIchira();
    showWasabi();
  }
  else if(morunn[1] <= wasabi[1] && wasabi[1] <= goin[1] && goin[1] <= ichira[1]){
    showMorunn();
    showWasabi();
    showGoin();
    showIchira();
  }
  else if(morunn[1] <= wasabi[1] && wasabi[1] <= ichira[1] && ichira[1] <= goin[1]){
    showMorunn();
    showWasabi();
    showIchira();
    showGoin();
  }
  else if(morunn[1] <= ichira[1] && ichira[1] <= goin[1] && goin[1] <= wasabi[1]){
    showMorunn();
    showIchira();
    showGoin();
    showWasabi();
  }
  else if(morunn[1] <= ichira[1] && ichira[1] <= wasabi[1] && wasabi[1] <= goin[1]){
    showMorunn();
    showIchira();
    showGoin();
    showWasabi();
  }

}

void showMorunn() {
  if (direction == "down") {
    image(morunn_front, morunn[0], morunn[1]);
  } else if (direction == "left") {
    image(morunn_left, morunn[0], morunn[1]);
  } else if (direction == "right") {
    image(morunn_right, morunn[0], morunn[1]);
  } else if (direction == "up") {
    image(morunn_back, morunn[0], morunn[1]);
  }
}

void showIchira() {
  if (flag_ichira == false){
    image(ichira_front, ichira[0], ichira[1]);
  } else {
    ichira[0] = firstPerson[0];
    ichira[1] = firstPerson[1];
    if (d1 == "down") {
      image(ichira_front, ichira[0], ichira[1]);
    } else if (d1 == "up") {
      image(ichira_back, ichira[0], ichira[1]);
    } else if (d1 == "left") {
      image(ichira_left, ichira[0], ichira[1]);
    } else if (d1 == "right") {
      image(ichira_right, ichira[0], ichira[1]);
    }
  }
}

void showGoin(){
  if (flag_goin == false){
    image(goin_front, goin[0], goin[1]);
  } else {
    goin[0] = secondPerson[0];
    goin[1] = secondPerson[1];
    if (d2 == "down") {
      image(goin_front, goin[0], goin[1]);
    } else if (d2 == "up") {
      image(goin_back, goin[0], goin[1]);
    } else if (d2 == "left") {
      image(goin_left, goin[0], goin[1]);
    } else if (d2 == "right") {
      image(goin_right, goin[0], goin[1]);
    }
  }
}

void showWasabi(){
  if (flag_wasabi == false){
    image(wasabi_front, wasabi[0], wasabi[1]);
  } else {
    wasabi[0] = thirdPerson[0];
    wasabi[1] = thirdPerson[1];
    if (d3 == "down") {
      image(wasabi_front, wasabi[0], wasabi[1]);
    } else if (d3 == "up") {
      image(wasabi_back, wasabi[0], wasabi[1]);
    } else if (d3 == "left") {
      image(wasabi_left, wasabi[0], wasabi[1]);
    } else if (d3 == "right") {
      image(wasabi_right, wasabi[0], wasabi[1]);
    }
  }
}

void showEnd() {
  image(bg2, 20, 10);
  fill(0);
  // text("おわり！おたおめ！", 200, 400);
  image(morunn_front, 440, 700);
  image(endMsg, 140, 250);
  if(flag_ichira == true){
    image(ichira_front, 650, 700);
  }
  if(flag_goin == true){
    image(goin_front, 240, 700);
  }
  if(flag_wasabi == true){
    image(wasabi_front, 30, 700);
  }
  showConfetti();
}

void showConfetti(){
  for (int i=0; i<30; i++){
    fill(254,227,127);
    noStroke();
    rect(random(900), random(1500), 20, 20);
    if(flag_ichira == true){
      fill(180,52,244);
      rect(random(900), random(1500), 20, 20);
    }
    if(flag_goin == true){
      fill(69, 95, 208);
      rect(random(900), random(1500), 20, 20);
    }
    if(flag_wasabi == true){
      fill(236, 114, 197);
      rect(random(900), random(1500), 20, 20);
    }
  }
}

void showShadow(){
  image(gameUI2, -10, 0, width, height);
  image(gameShadow, 253*r, 473*r, 2357*r, 3093*r);
}

boolean canStand() {
  // キャラと重なる、上方向以外にはみ出るを禁止
  if((flag_ichira == false && morunn[0] == ichira[0] && morunn[1] == ichira[1]) || (flag_goin == false && morunn[0] == goin[0] && morunn[1] == goin[1])|| (flag_wasabi == false && morunn[0] == wasabi[0] && morunn[1] == wasabi[1]) ||(morunn[0]<0||morunn[0]>700||morunn[1]>1000 )){
    return false;
  } else { return true }
}

void setPerson() {
  int tmp0 = firstPerson[0], tmp1 = firstPerson[1];
  int tmp2 = secondPerson[0], tmp3 = secondPerson[1];
  String tmpD1 = direction, tmpD2 = d1, tmpD3 = d2;
  firstPerson[0] = morunn[0];
  firstPerson[1] = morunn[1];
  secondPerson[0] = tmp0;
  secondPerson[1]= tmp1;
  thirdPerson[0] = tmp2;
  thirdPerson[1] = tmp3;
  d1 = tmpD1;
  d2 = tmpD2;
  d3 = tmpD3;
}
void mouseClicked() {
  if (2241*r<=mouseX && mouseX<=(2241+456)*r && 4465*r<=mouseY && mouseY <= (4465+456)*r){  // A
    aButton = true;
    if (flag_ichira == false && ichira[0] == action[0] && ichira[1] == action[1]){
      msg = "おはよす！どこいくー？";
      name = "いちら";
      showMsgFlag = true;
      flag_ichira = true;
      tmpFlag = false;
    } else if (flag_goin == false && goin[0] == action[0] && goin[1] == action[1]){
      msg = "やあ";
      name = "誤飲";
      showMsgFlag = true;
      flag_goin = true;
      tmpFlag = true;
    } else if (flag_wasabi == false && wasabi[0] == action[0] && wasabi[1] == action[1]){
      msg = "もるんちゃおはよ～！！\n一緒についてくね！！！";
      name = "わさび";
      showMsgFlag = true;
      flag_wasabi = true;
      tmpFlag = false;
    } else if (tmpFlag == true) {
      msg = "ご一緒しちゃお";
      name = "誤飲";
      showMsgFlag = true;
      flag_goin = true;
      tmpFlag = false;
    } else {
      showMsgFlag = false;
    }
  }
  else if (1577*r<=mouseX && mouseX<=(1577+456)*r && 4465*r<=mouseY && mouseY <= (4671+456)*r) {  // B
    bButton = true;
  }
  else if (178*r<=mouseX && mouseX<=(178+975/3)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // ←
    if (showMsgFlag == false){
      left = true;
      direction = "left";
      setPerson();
      morunn[0] -= blockSize;
      if (canStand() == false) {
          morunn[0] += blockSize;
      }
    }
  }
  else if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && 4309*r<=mouseY && mouseY <= (4309+975/3)*r) {  // ↑
    if (showMsgFlag == false){
      up = true;
      direction = "up";
      setPerson();
      morunn[1] -= blockSize;
      if (canStand() == false) {
        morunn[1] += blockSize;
      }
    }
  }
  else if ((178+975/3*2)*r<=mouseX && mouseX<=(178+975)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // →
    if (showMsgFlag == false){
      right = true;
      direction = "right";
      setPerson();
      morunn[0] += blockSize;
      if (canStand() == false) {
        morunn[0] -= blockSize;
      }
    }
  }
  else if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && (4309+975/3*2)*r<=mouseY && mouseY <= (4309+975)*r) {  // ↓
    if (showMsgFlag == false){
      down = true;
      direction = "down";
      setPerson();
      morunn[1] += blockSize;
      if (canStand() == false) {
        morunn[1] -= blockSize;
      }
    }
  }
}