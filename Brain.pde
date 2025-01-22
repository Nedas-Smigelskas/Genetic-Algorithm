class Brain{
 PVector[] directions; //stored directions
 int step = 0; //steps taken 
 //Brain Constructor
 Brain(int size){
  directions = new PVector[size];
  randomize();
 }
 
 void randomize(){
  for(int i = 0; i < directions.length; i++){
   float randomAngle = random(2*PI); //assign random direction to travel
   directions[i] = PVector.fromAngle(randomAngle); //cast randomAngle as a PVector and place into directions
  }
 }
 
 Brain clone(){
  Brain clone = new Brain(directions.length);
  for(int i = 0; i < directions.length; i++){
   clone.directions[i] = directions[i].copy(); 
  }
  
  return clone;
  
 }
 
 void mutate(float mutationRate){ 
  for(int i = 0; i < directions.length; i++){
   float rand = random(1);
   if(rand < mutationRate){
    float randomAngle =  random(2*PI);
    directions[i] = PVector.fromAngle(randomAngle);
   }
   
  }
 }
 
}
