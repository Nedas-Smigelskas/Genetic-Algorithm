class Obstacles{
 String mapFile = "map.csv";
 PImage wall = loadImage("block.png");
 ArrayList<Walls> walls;
 Obstacles() {
   walls = new ArrayList<Walls>();
   String [] lines = loadStrings(mapFile);
   for(int row = 0; row < lines.length; row++){
    String [] values = split(lines[row],",");
    for(int col = 0; col < values.length; col++){
     if(values[col].equals("1")){
      PVector wallpos = new PVector(col*100,row*100);
      Walls placement = new Walls(wall, wallpos);
      walls.add(placement);
     }
    }
   }
   
 }
 
 void show() {
  
   for(Walls w : walls){
     w.show();
   
 }
 
  
}
}
