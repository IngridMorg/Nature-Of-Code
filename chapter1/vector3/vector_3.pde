//this results in a really weird movement where the ball glotches up and down hmmm
//this is an improved vector approach
//based on
//new location = velocity applied to current location
//so we might have a vector for location and a vector for speed
//declaare our snassy new class

class PVector {
 float x;
 float y;
 
 PVector(float x_, float y_) {
   x = x_;
   y = y_;
 }
 void add(PVector v) {
   y = y + v.y;
   x = x + v.x;
 }
 void sub(PVector v) {
   y = y - v.y;
   x = x - v.x;
 }
}

void setup(){
  size(640,640);
}
int count = 0;
void draw() {
  if(count % 7 == 0){
    background(255);
  }
 
 PVector mouse = new PVector(mouseX,mouseY);
 PVector centre = new PVector(width/2,height/2);
 
 mouse.sub(centre);
 
 translate(width/2,height/2);//this draws a line to represent the vector
 line(0,0,mouse.x,mouse.y);
 stroke(10);
 count += 1;
}
