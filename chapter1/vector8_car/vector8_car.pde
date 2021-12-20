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
 void limit(float max){
   if(this.mag() > max){
     this.normalise();
     this.mult(max);
   }  
 }
 //motion 101
 //add velocity to location
 //draw object at location
}

class Mover {
  PVector location;  //vector representing location
  PVector velocity;  //vector representing velocity
  PVector acceleration; //vector representing acceleration
  //all a mover needs to do is move and be seen moving
  //constructor
  Mover() {
   location = new PVector(width/2,height/2);
   velocity = new PVector(0,0);
   acceleration = new PVector(-0.001,0.01);
  }
  void update() {
   velocity.add(acceleration);
   location.add(velocity);  //motion 101 
   velocity.limit(10);
  }
  void display() {
   stroke(0);
   fill(175);
   ellipse(location.x,location.y,16,16);  //circle representing the mover
  }
  void checkEdges() {
    if(location.x > width){
      location.x = 0;
    }else if (location.x < 0){
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    }else if(location.y < 0) {
      location.y = height;
    }
  }
}

//initialise mover
Mover mover;
void setup(){
  size(640,320);
  mover = new Mover();
}

void draw(){
  background(255);
  
  mover.update();
  mover.checkEdges();
  mover.display();
  
  if(keyPressed) {
   if(key == 'w'){
     mover.acceleration.mult(1.5);
     print("up\n");
    }
    if(key == 's'){
      mover.acceleration.mult(0.1);
      print("down\n");
    }
  }
  mover.update();
}
