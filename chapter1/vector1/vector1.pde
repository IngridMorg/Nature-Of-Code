//we are making a vector thing stuff !!!

float x = 100;
float y = 100;

float xspeed = 1;
float yspeed = 3;

void setup(){
    size(640,360);
    background(255);
}

void draw(){
 background(255);
 x = x + xspeed;  //this is our x movement
 y = y + yspeed;
 if((x > width) || (x < 0)){
   xspeed = xspeed * -1;  //if we hit the wall we should 'reverse'
 }
 if((y > height) || (y < 0)) {
    yspeed = yspeed * -1;   //if we hit the wall we should 'reverse'
 }
 
 stroke(0);  //stroke size
 fill(175);  //ball colour
 ellipse(x,y,50,50);  //the ball
}
