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
}
PVector location = new PVector(320,180);
PVector velocity = new PVector(1,3);

//ourr formula for motion is location = location + velocity
void setup() {
  size(640,360);
  background(255);
}

//processing cannot aadd two pvector objects together so we need a work around
//so we can add this function to our PVector Class
//so our formula for location is now:  location.add(velocity)

void draw() {
 background(255);
 
 location.add(velocity);
 if((location.x > width) || (location.x < 0)) {
  velocity.x = velocity.x * -1; 
 }
 if((location.y < height) || (location.x < 0)) {
  velocity.y = velocity.y * -1; 
 }
 
 stroke(0);
 fill(175);
 ellipse(location.x,location.y,30,30);
 
}
