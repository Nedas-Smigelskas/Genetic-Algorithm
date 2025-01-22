class Racer{
  
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;
  
  color racerColor = color(0,0,0);
  //Racer movement variables
  PVector position;
  PVector velocity;
  PVector acceleration;
  Brain brain;
  
  float fitness = 0; //score of racer
  
  //Racer Constructor
  Racer(){
    
    brain = new Brain(1000);
    
    position = new PVector(width/2,height-50); //start in the middle of screen
    velocity = new PVector(0,0); //no initial speed
    acceleration = new PVector(0,0);
  }
  
  //display on screen
  void show(){
    if(isBest){
     racerColor = color(0,0,200); 
    }
    fill(racerColor);
    ellipse(position.x,position.y,10,10);
  }
  
    
  void die(){
   racerColor = color(255,0,0);
   dead = true;
  }
  
  void move(){
    if(brain.directions.length > brain.step){
      acceleration = brain.directions[brain.step];
      brain.step++;
    } else {
     die();
    }
    velocity.add(acceleration);
    velocity.limit(5); //prevent racer from accelerating infinitly
    position.add(velocity);
  }

  
  void update(){
    if(!dead && !reachedGoal){
     move();
     if(position.x < 5 || position.y < 5 || position.x>width-5 || position.y>height-5){
      die(); 
     } else if (dist(position.x,position.y,goal.x,goal.y) < 12){
       reachedGoal = true;
     }
    }
    for(Walls w : obstacles.walls){
     if(w.handleCollision(position)){
       die();
    }
  }
  }
  
  void fitnessCalculation(){
   if(reachedGoal){
    fitness = 10000.0/(float)(brain.step * brain.step) + 10.0;  //ensure if reached goal fitness is substantially better
   } else {
     float distanceFromGoal = dist(position.x,position.y,goal.x,goal.y);
     fitness = 1.0/(distanceFromGoal * distanceFromGoal);
   }
  }
  
  Racer createChild(){
   Racer child = new Racer();
   child.brain = brain.clone();
   return child;
  }
  
}
