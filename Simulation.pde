Population racers;
Obstacles obstacles;
PVector goal = new PVector(500,30);
void setup(){
 size(1000,1000);
 frameRate(60);
 obstacles = new Obstacles();
 racers = new Population(100);
}

void draw(){
  background(255);
  fill(0,255,0);
  ellipse(goal.x,goal.y,12,12);
  fill(0,0,0);
  textSize(20);
  text("Gen : " + racers.generation, 20,40);
  text("Min Steps : " + racers.minSteps, 20, 80);
  text("Mutation Level : " + racers.mutationRate,20,120);
  obstacles.show();
  if(racers.allDead()){
   racers.fitnessCalculation();
   racers.naturalSelection();
   racers.mutate();
  } else {  
   racers.update();
   racers.show(); 
  }
}
