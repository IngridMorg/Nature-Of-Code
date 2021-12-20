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
 void setX(float x2) {
   x = x2; 
 }
 float getX(){
   return x;
 }
 void setY(float y2) {
   y = y2;
 }
 float getY(){
   return y;
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
   velocity.limit(5);
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
  size(640,640);
  mover = new Mover();
}
float t = 0;  //variable for time
void draw(){
  //mover accelerating based on perlin logic
  background(255);
  float perlin = noise(t);
  //map the noise onto acceleration
  float m = map(perlin,0,1,-1,1.5);
  float mLocX = map(noise(mover.location.getX()),0,1,-20,20);
  float mLocY = map(noise(mover.location.getY()),0,1,-20,20);
  mover.update();
  mover.checkEdges();
  mover.display();
  mover.acceleration.mult(m);
  if(mover.acceleration.mag() == 0){
     mover.acceleration.setX(1);
     mover.acceleration.setY(1);
  }
  mover.location.setX(mover.location.getX() + mLocX);
  mover.location.setY(mover.location.getY() + mLocY);
  mover.update();
  t+= 0.5;
}
