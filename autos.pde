
int[] n = new int[]{0,0,0,0};

int[][] stt1 = new int[][] 
       { {0,-1,1}, 
         {1,-1,2},
         {2,1,3},
         {3,1,0}};
int[][] stt2 = new int[][] 
       { {0,-1,1}, 
         {1,1,2},
         {2,1,3},
         {3,-1,0}};

Automata ant1 = new Automata(0,stt1,0,100,350,n);
Automata ant2 =  new Automata(0,stt1,0,400,350,n);
Automata ant3 =  new Automata(0,stt1,0,700,350,n);
Automata ant4 =  new Automata(0,stt1,0,1000,350,n);
Automata ant5 =  new Automata(0,stt1,0,850,350,n);

int steps = 0;

void setup() {

 background(68,1,84);
 size(1280,720); 
 noStroke();
 textSize(100);
 textSize(32);
   fill(253,231,37);  
  textSize(125);
  //text("Get well soon Tom",50,370);
 
 frameRate(600);
   try {
    Thread.sleep(0 * 1000);
} catch (InterruptedException ie) {
    Thread.currentThread().interrupt();
}
 
}
void draw() {
  //if(steps%2 ==0){
  //saveFrame("frames/ant_####" + steps +".png");
  //}
 // println(frameRate);
  ant1.update();
  //ant2.update();
  //ant3.update();
  //ant4.update();
  //ant5.update();
  steps++;
  fill(255,255,255);
  rect(1000,580,150,50);
  fill(0,0,0);
  textSize(32);
  text(steps,1025,600);
  if(steps%500==0){
    fill(253,231,37);  
    textSize(125);
  }

  
  
}
class Automata {
  int state;
  int[][] stateTransitionTable;
  int direction;
  int xPos;
  int yPos;
  int scale;
  int[] neighborhood;
  
  Automata(int s,int[][]stt, int d,int x, int y ,int[] n) {
    state = s;
    stateTransitionTable = stt;
    direction = d;
    xPos = x;
    yPos = y;
    scale = 5;
    neighborhood = n;
  }
  int[] stateTransitionTableOutput(int state){
    return new int[]{stateTransitionTable[state][1],stateTransitionTable[state][2]};
  }
  color getColor(int x,int y){
   return(get(x,y)); 
  }
  void update() {
    //println(state);
    int[] output = stateTransitionTableOutput(state); //<>//
    direction+=output[0];
    state = output[1];
    if(state == 0){
      fill(68,1,84); 
     // stroke(68,1,84);
    }
    if(state == 1){
      fill(49,104,142);
     // stroke(49,104,142);
     }
    if(state == 2){
      fill(53,183,121);
      //stroke(53,183,121);
     }
    if(state == 3){
      fill(253,231,37);
     // stroke(253,231,37);
     }
     
    rect(xPos,yPos,1*scale,1*scale);
    //ellipse(xPos,yPos,1*scale,1*scale);
    int d = direction%4;
    //println(state);
    if(d == 0){
      yPos+=1*scale;
      if(yPos>=height)
        yPos = 0;
      //if(yPos<=150 && xPos<=150)
      //  yPos = 0;
    }
    if(d == -1){
      xPos-=1*scale;
      if(xPos<=0)
        xPos =width;
      //if(xPos<=150 && yPos<=150)
      //  xPos = 0;
    }
    if(d == -2){
      yPos-=1*scale;
      if(yPos<=0)
        yPos = height;        
    }
    if(d == -3){
      xPos+=1*scale;
      if(xPos>=width)
        xPos = 0;
    }
    strokeWeight(scale);
    
    

    color c = get(xPos,yPos);
   // rect(xPos,yPos,scale,scale);
    println(xPos,yPos);
    if(c == color(68,1,84))
      state = 0;
    if(c == color(49,104,142))
      state = 1;
    if(c == color(53,183,121))
      state = 2;
    if(c == color(253,231,37))
      state = 3;
  }
}
