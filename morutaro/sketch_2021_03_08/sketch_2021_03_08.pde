// gazou no youi
PImage gameUI, gameShadow, gameMessageWindow, gameNameWindow;
PImage morunn_front;
// hiritsu
float r = 1080/2875;
 
boolean showMsgFlag = false;
boolean choiceFlag = false;
int choice = 0;

String name = "";
String msg = "";

// chara event flag
// -1 <- shoki
//  0 <- shori kaishi
//  1 <- ooatari
//  2 <- atari
//  3 <- hazure
//  4 <- hazure
int flag_goin = -1, flag_wasabi = -1, flag_ichira = -1;
int flag_start = -1;

int state = -1;

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
  text(choice, 400, 400);
  text(state, 500,600);
  
  // flag check
  // if (flag_goin == -1 && flag_wasabi == -1 && flag_ichira == -1 && flag_start == -1){
  if (state == -1){
    startEvent();
  } else if (state == 0){
    goEvent();
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

void showChoices(String[] choices){
  choiceFlag = true;
  textSize(40);
  fill(255);
  for (int i = 0; i < choices.length; i++){
      text(choices[i], 720, 1080-(60*(choices.length-i)));
  }
}

void decideChoice(String[] choices, int num){
  fill(255);
  triangle(680,890-(60*(num-choices.length)),640,910-(60*(num-choices.length)),640,870-(60*(num-choices.length)));
}

void startEvent(){
  showMsgFlag = true;
  name = "もるん";
  msg = "今日はいい天気だから出かけようかな？";
  
  String[] choices = {"はい","いいえ"};
  showChoices(choices);
  
  // 選択肢のstate
  if (choice < 0){
    choice = 0;
  } else if (choice > 1){
    choice = 1;
  }
  decideChoice(choices, choice);
}

void goEvent(){
  int prevChoice = choice;
  if (prevChoice == 1){
    showMsgFlag = true;
    name = "もるん";
    msg = "せっかくだもんね、お散歩しよう！\nどこに出かけよう？";

    String[] choices1 = {"wasabi","ichira", "路地裏"};
    showChoices(choices1);
    
    // 選択肢のstate
    if (choice < 0){
      choice = 0;
    } else if (choice > 2){
      choice = 2;
    }
    decideChoice(choices1, choice);
  } else if (prevChoice == 0){
    showMsgFlag = true;
    name = "もるん";
    msg = "洗濯物やらなきゃいけなかった！\n出かけてる場合じゃないや。";
  }
}

void showShadow(){
  image(gameShadow, 253*r, 473*r, 2357*r, 3093*r);
}

void mouseClicked() {
  //ellipse(mouseX, mouseY, 50, 50);
}

void mousePressed() {
  if (2241*r<=mouseX && mouseX<=(2241+456)*r && 4465*r<=mouseY && mouseY <= (4465+456)*r){  // A
    aButton = true;
    if (choiceFlag == true){
      state+=1;
    }
  }
  else if (1577*r<=mouseX && mouseX<=(1577+456)*r && 4465*r<=mouseY && mouseY <= (4671+456)*r) {  // B
    bButton = true;
  }
  if (178*r<=mouseX && mouseX<=(178+975/3)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // ←
    left = true;
  }
  if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && 4309*r<=mouseY && mouseY <= (4309+975/3)*r) {  // ↑
    up = true;
    if (choiceFlag == true) {
      choice+=1;
    }
  }
  if ((178+975/3*2)*r<=mouseX && mouseX<=(178+975)*r && (4309+975/3)*r<=mouseY && mouseY <= (4309+975/3*2)*r) {  // →
    right = true;
  }
  if ((178+975/3)*r<=mouseX && mouseX<=(178+975/3*2)*r && (4309+975/3*2)*r<=mouseY && mouseY <= (4309+975)*r) {  // ↓
    down = true;
    if (choiceFlag == true) {
      choice-=1;
    }
  }
}
