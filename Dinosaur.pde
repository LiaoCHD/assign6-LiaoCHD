class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f;

  Dinosaur(float x, float y){
      super(x,y);
  }
  
  void display(){
    
  pushMatrix();
  
  if (speed>0) {
    translate(x, y);
    scale(1, 1);
    image(dinosaur, 0, 0); 
  } else if (speed<0) {
    translate(x+w, y);
    scale(-1, 1);
    image(dinosaur, 0, 0); 
  }
  popMatrix();
  
}
  
  
  void update(){

    
    x += speed;
    if(x >= width-w){
      speed *= -1;
      
    }
    if(x <=0 ){
      speed *= -1;
    }
    

    
    if(player.row == y/h && speed>0 && player.x > x ){
        speed = 5f;
    }
    if(player.row == y/h && speed<0 && player.x < x ){
        speed = -5f;
    }
    if((player.row > y/h ||player.row ==0) && speed>0 ){
        speed = 1f;
    }
    if((player.row > y/h ||player.row ==0) && speed<0 ){
        speed = -1f;
    }



          

      

  }

	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
