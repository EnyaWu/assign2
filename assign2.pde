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

//--state
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
//--state end

  hp = loadImage("img/hp.png");

  enemy = loadImagye("img/enemy.png");
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
      if(mouseX>=280 && mouseX<=360) {
        if(mouseY>=260 && mouseY<=280) {
          image(start2,0,0);
          if(mousePressed)
            gameState = RUN;
        }
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
        //fighter
        image(fighter,fighterX,fighterY);
        //Enemy
        image(enemy,enemyX,enemyY);
        //move
        enemyX+=3;
        //repeat
        enemyX%=640;
        collectTreasure();
        rushToFighter();

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
          fighterY -= speed;
        break;
      case DOWN:
        if(fighterY<height)
          fighterY += speed;
        break;
      case LEFT:
        if(fighterX>0)
          fighterX -= speed;
        break;
      case RIGHT:
        if(fighterX<width)
          fighterX += speed;
        break;
    }
  }
}

void collectTreasure() {
  if(fighterX == treasureX && fighterY==treasureY) {
    hpLength+=10;
    treasureX = floor(random(620));
    treasureY = floor(random(460));
  }
  if(enemyX == treasureX && enemyY == treasureY) {
    treasureX = floor(random(620));
    treasureY = floor(random(460));
  }
}

void rushToFighter() {
  if(enemyY>fighterY) {
    enemyY-=3;
  } else {
    enemyY +=3;
  }
}
