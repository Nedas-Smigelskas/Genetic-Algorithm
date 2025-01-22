class Population{
 Racer[] racers;
 
 float fitnessSum;
 int generation = 1;
 int minSteps = 1000;
 float mutationRate = 0.1;
 //preventive measure to ensure best dots dont get dumber
 int bestRacer = 0;
 
 
 Population(int size){
  racers = new Racer[size];
  for(int i = 0; i < size; i++){
   racers[i] = new Racer(); 
  }
 }
  
  
  void show(){
   for(int i = 1; i < racers.length; i++){
     racers[i].show();
   }
   racers[0].show();
  }
  
  void update() {
   for(int i = 0; i < racers.length; i++){
     if(racers[i].brain.step > minSteps){
       racers[i].dead = true;
     } else {
      racers[i].update(); 
     }
   }
  }
  
  void fitnessCalculation(){
   for(int i = 0; i < racers.length; i++){
    racers[i].fitnessCalculation(); 
   }
  }
  
  boolean allDead(){
   for(int i = 0; i < racers.length; i++){
    if(!racers[i].dead && !racers[i].reachedGoal){
      return false;
    }
   }
   return true;
  }
  
  void naturalSelection(){
   Racer[] newRacers = new Racer[racers.length];
   getBestRacer();
   fitnessSum();
   
   newRacers[0] = racers[bestRacer].createChild();
   newRacers[0].isBest = true;
   for(int i = 1; i < newRacers.length; i++){
     //Select the Parent
     Racer parent = selectParent();
     
     //Create a child
     newRacers[i] = parent.createChild(); 
   }
   
   racers = newRacers.clone();
   generation++;
  }
  
  void fitnessSum(){
   fitnessSum = 0;
   for(int i = 0; i < racers.length; i++){
     fitnessSum += racers[i].fitness;
   }
  }
  
  Racer selectParent(){
   float rand = random(fitnessSum);
   
   float runningSum = 0; 
   
   for(int i = 0; i < racers.length; i++){
    runningSum += racers[i].fitness;
    if(runningSum > rand){
     return racers[i]; 
    }
   }
   return null; //shouldnt ever get here
  }
  
  void mutate(){
   for(int i = 1; i < racers.length; i++){
    racers[i].brain.mutate(mutationRate); 
   }
  }
  
  void getBestRacer(){
   float max = 0;
   int maxIndex = 0;
   for(int i = 0; i < racers.length; i++){
    if(racers[i].fitness > max){
     max = racers[i].fitness;
     maxIndex = i;
    }
   }
   
   bestRacer = maxIndex;
  
   if(racers[bestRacer].reachedGoal){
    minSteps = racers[bestRacer].brain.step; 
   }
   
  }
  
  
  
}
