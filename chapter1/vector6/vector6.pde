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
 void mult(float n) {
  x = x * n;
  y = y * n;
 }
 void div(float n) {
  x = x / n;
  y = y / n;
 }
 void normalise(){
   float m = this.mag();
   if(m != 0){
     div(m);
   } 
 }
 //non-void functions
 float mag() {
    return sqrt(x*x + y*y); 
 }
}

void setup(){
  size(640,640);
}

void draw(){
  background(255);
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector centre = new PVector(width/2,height/2);
  
  mouse.sub(centre);
  
  mouse.normalise();
  mouse.mult(200); //make it visible lol
  
  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
}
