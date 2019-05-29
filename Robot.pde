class Robot extends Enemy  {
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  int direction;
  float speed = 2f;
  float timer;
  Laser laser;

Robot(float x, float y){
    super(x, y);

}

  void display(){
    
  pushMatrix();
  
  if (direction == RIGHT) {
    translate(x, y);
    scale(1, 1);
    image(robot, 0, 0); 
  } else if (direction == LEFT) {
    translate(x+w, y);
    scale(-1, 1);
    image(robot, 0, 0); 
  }
  popMatrix();
  
}

  void update(){
    
    timer++;
    x += speed;
    if(x >= width-w){
      speed *= -1;
      direction = LEFT;
      
    }
    if(x <=0 ){
      speed *= -1;
      direction = RIGHT;
    }
    
    if((direction == LEFT && player.x+player.w/2 < x)||(direction == RIGHT && player.x+player.w/2 > x+w)){
      if(player.row+PLAYER_DETECT_RANGE_ROW >= y/h && player.row-PLAYER_DETECT_RANGE_ROW <= y/h){
        speed=0;
        if(timer >= LASER_COOLDOWN*60){
            if (direction == RIGHT)laser.fire(x+HAND_OFFSET_X_FORWARD,y+HAND_OFFSET_Y,player.x+player.w/2,player.y+player.h/2);
            if (direction == LEFT)laser.fire(x+ HAND_OFFSET_X_BACKWARD,y+HAND_OFFSET_Y,player.x+player.w/2,player.y+player.h/2);
                laser.update();
                laser.display();
            
            timer=0;
        }else{
        
        }
      }else{
        if (direction == RIGHT)speed=2f;
        if (direction == LEFT)speed=-2f;
      }
    }
  }
  
  
  void checkCollision(Player player){

    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
      player.hurt();
    }
    if(laser != null)laser.checkCollision(player);
  }
  
  
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
