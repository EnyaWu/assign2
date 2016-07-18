PImage fighter;
PImage bg1, bg2;
PImage hp;
PImage enemy,enemy1,enemyGainBomb;
PImage treasure;
PImage start1, start2;
PImage end1, end2;
int enemyX,enemyY,treasureX,treasureY,fighterX,fighterY,hpLength,speed,fighterSpeed;


final int START = 0;
final int RUN = 1;
final int END = 2;
int gameState;


void setup() {
  size(640,480);
  background(0);
  enemyX=0;
  enemyY=floor(random(480));
  treasureX=floor(random(620));
  treasureY=floor(random(460));
  hpLength=20;
  fighter = loadImage("img/fighter.png");
  fighterX = 580;
  fighterY = 240;

//--state
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
//--state end

  hp = loadImage("img/hp.png");

  enemy = loadImage("img/enemy.png");
  enemy1 = loadImage("img/Moocs-element-enemy1.png");
  enemyGainBomb = loadImage("img/Moocs-element-gainbomb.png");
  treasure = loadImage("img/treasure.png");
  gameState = START;
}

void draw() {
  background(0);
  //gameState
  switch(gameState) {
    case START:
      background(0);
      image(start1,0,0);
      if(mouseX>=185 && mouseX<=440 && mouseY>=375 && mouseY<=395) {
          image(start2,0,0);
          if(mousePressed)
            gameState = RUN;
        
      }
    break;

    case RUN:
      //background
        image(bg2,speed%640,0);
        image(bg1,speed%640-640,0);
        speed+=1;
        //HP
        colorMode(RGB);
        rect(20,5,hpLength,25);
        fill(150,0,0);
        image(hp,5,5);
        //treasure
        image(treasure,treasureX,treasureY);
        if(fighterX >= treasureX && fighterX <=(treasureX+40) && fighterY>=treasureY && fighterY <=(treasureY+40)) {
          hpLength+=10;
          rect(20,5,hpLength,25);
          treasureX = floor(random(620));
          treasureY = floor(random(460));
          image(treasure,treasureX,treasureY);
        }
        if(enemyX >= treasureX && enemyX <=(treasureX+40) && enemyY>=treasureY && enemyY <=(treasureY+40)) {
          treasureX = floor(random(620));
          treasureY = floor(random(460));
          image(treasure,treasureX,treasureY);
        }
        //fighter
        image(fighter,fighterX,fighterY);
        //Enemy
        image(enemy,enemyX,enemyY);
        //move
        enemyX+=3;
        //repeat
        enemyX%=640;


    break;

    case END:

    break;
  }
  
}


void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        if(fighterY>0)
          fighterY-=4;
        break;
      case DOWN:
        if(fighterY<height-30)
          fighterY+=4;
        break;
      case LEFT:
        if(fighterX>0)
          fighterX-=4;
        break;
      case RIGHT:
        if(fighterX<width-30)
          fighterX+=4;
        break;
    }
  }
}
