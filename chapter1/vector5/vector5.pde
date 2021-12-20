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
 
 //non-void functions
 float mag() {
    return sqrt(x*x + y*y); 
 }
}

void setup() {
 size(640,360); 
}

void draw() {
 background(255);
 
 PVector mouse = new PVector(mouseX,mouseY);
 PVector center = new PVector(width/2,height/2);
 
 mouse.sub(center);
 
 float m = mouse.mag();
 fill(0);
 rect(0,0,m,10);  //width of the rectangle represents the magnitude
 
 translate(width/2,height/2);
 line(0,0,mouse.x,mouse.y);
}
