class Walls {
 PImage img;
 PVector pos;
 float w = 100;
 float h = 100;
 
 Walls(PImage timg, PVector tpos){
   img = timg;
   pos = tpos;
 }
 
 void show(){
   image(img,pos.x,pos.y);
 }
 
 boolean handleCollision(PVector racersPos){
   return (racersPos.x > pos.x && racersPos.x < pos.x + w && racersPos.y > pos.y && racersPos.y < pos.y + h);
 }
  
}
