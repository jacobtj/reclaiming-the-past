import java.util.Arrays;
class Player extends GameObject {
  private boolean hasKey = false;
  private float accely_scale = 0.6;     //speed of falling
  private float accely = accely_scale;
  private float max_accel = 150;        //max accel of gravity (?)
  private float xvelo = 200.0;
  private float yvelo = 11.0;           //jumping speed
  private float time = 0;
  public float chiTime = 0;
  private boolean touches = false;
  private boolean jumping = false;
  private boolean ready_to_jump = false;
  private boolean hasChi = true;
  private boolean isWalking = false;
  private boolean walkingLeft = false;
  private boolean justLanded = false;
  private float diff_x = 0;
  private float diff_y = 0;
  private int frame = 0;
  private int frameRate = 0;
  
  public Player(float x, float y, Game game) {
    super(x, y, 20.0, 50.0, new int[] {0, 255, 0}, game, new ArrayList<String>(Arrays.asList("images/Player1.png", "images/Player2.png", "images/Player3.png", "images/Player4.png", "images/Player5.png", "images/Player6.png", "images/Player7.png")));
    this.hasKey = false;
  }
  
  void update(float dt) {
    isWalking = false;
    walkingLeft = false;
    chiTime += 1;
    touches = false;
    ready_to_jump = false;
    if (hasChi) {
      
      if (isKeyDown('w')) {
       // y -= accely * dt;
      }
      if (isKeyDown('s')) {
       // y += accely * dt;
      }
      if (isKeyDown('a')) {
        x -= xvelo * dt;
        isWalking = true;
        walkingLeft = true;
      }
      if (isKeyDown('d')) {
        x += xvelo * dt;
        isWalking = true;
      }
    } 
    
    for (Hitbox hitbox: game.getHitboxes()) {
      if (!(hitbox.getParent() instanceof Player)) {
        if (game.collision(this.hitbox, hitbox)) {
          if (hitbox.getParent() instanceof Key) {
            this.hasKey = true;
            System.out.println(hasKey);
          } 
          else if (hitbox.getParent() instanceof Door) { 
            if (hasKey == true) {
              game.levelComplete();
            }
          }
          else if (hitbox.getParent() instanceof Key) {
            this.hasKey = true;
            System.out.println(hasKey);
          } 
          else if (hitbox.getParent() instanceof Moving_Platform && whichOrientation(this.hitbox, hitbox) == "top") {
           
            touches = true;
            String o = whichOrientation(this.hitbox, hitbox);
            stopPlayer(o, dt, hitbox);
            if (justLanded == false || isWalking) {
              float curr_x = this.getX();
              float curr_y = this.getY();
              diff_x = curr_x - hitbox.getX();
              diff_y = curr_y - hitbox.getY();
            }
             justLanded = true;
           // System.out.println(justLanded);
            this.setX(hitbox.getX() + diff_x);
            this.setY(hitbox.getY() + diff_y);
          }
          else {
            touches = true;
            // gravity(dt);
            String o = whichOrientation(this.hitbox, hitbox);
            stopPlayer(o, dt, hitbox);
          }
        }
      }
    }
    if (!touches) {
      justLanded = false;
      xvelo = 200.0;
      accely = accely_scale;
    }
    if (!ready_to_jump) {
      time += 1;
    } 
    if (!hasChi) {
      if (this instanceof MainPlayer) {
       // System.out.println("MainPlayer stopped");
      }
    }
    if (hasChi) {
      if (this instanceof MainPlayer) {
        //System.out.println("MainPlayer can move");
      }
    }
    
    if (jumping) {
      jump();
    }
    if (chiTime == 2) {
    chiTime = 0;
    }
    gravity(dt);
    super.update(dt);
  }

  
  void pickup() {
    this.hasKey = true;
  }   
  
  public void stopSelf(boolean detached) {
    if (detached) {
      hasChi = false;
    } else {
      hasChi = true;
    }
  }
  
  private String whichOrientation(Hitbox box1, Hitbox box2) {
    //player on top
    if (box1.getY() < box2.getY() && box1.getX() + box1.getWidth() >= box2.getX() 
    && box1.getX() <= box2.getX() + box2.getWidth()) {
      return "top";
    }
    //player on bottom
    else if (box1.getY() + box1.getHeight() > box2.getY() + box2.getHeight() 
    && box1.getX() >= box2.getX() && box1.getX() + box1.getWidth() <= box2.getX() + box2.getWidth()) {
      return "bottom"; 
    } 
    //player on left
    else if (box1.getX() < box2.getX()) {
      return "left";
    }
    //player on right
    else {
      return "right";
    }
  }
  
  private void gravity(float dt) {
    if (accely / 2 * time < max_accel) {
       y += accely / 2 * time;
    } else {
      y += max_accel;
    }
  }
  
  private void stopPlayer(String orientation, float dt, Hitbox object) {
    if (orientation.equals("top")) {
      accely = 0;
      time = 0;
      jumping = false;
      ready_to_jump = true;
      y = object.getY() - h;
      if (isKeyDown('w') && hasChi) {
        accely = accely_scale;
        jumping = true;
      }
    } if (orientation.equals("left")) {
      if (x <= 0) {
        game.gameOver();
      }
     // xvelo = 0;
      x = object.getX() - w;
      if (isKeyDown('a')) {
        xvelo = 200;
      }
    } if (orientation.equals("right")) {
      x = object.getX() + object.getWidth();
      if (x + w >= width) {
        game.gameOver();
      }
      //xvelo = 0;
      if (isKeyDown('d')) {
        xvelo = 200;
      }
    } else if (orientation.equals("bottom")){
      jumping = false;
    } else {
      //System.out.println("YOU DIE.... (please try again! : ) )");
    }
  }
  
  private void jump() {
    // This is the full formula, which is correct, but since you're doing += and not =, this is actually y = y - (yInitial - yvelo + (.5 * accely * dt)),
    //which isn't what we want. We could solve this 2 ways: One, only update y one time in this whole program, using the formula you wrote below but with = and not -=, or
    //The second way, which is to just add each component to y separately, is what I'll do below. It's simpliest since you are already adding the gravity to y separately,
    //so all you'll need to modify is this line below:
    //old way: y -= yInitial - yvelo + (.5 * accely * dt);
    y -= yvelo;
  }
  
  
  public String toString() {
    return "Player";
  }
  
  void draw() {
    if (walkingLeft) {
      pushMatrix();
      scale(-1.0, 1.0);
      image(this.image.get(frame % this.image.size()), -x - w, y, w, h);
      popMatrix();
    } else {
      image(this.image.get(frame % this.image.size()), x, y, w, h);
    }
    if (isWalking) { 
      frameRate += 1;
      if (frameRate >= 10) {
        frameRate = 0;
        frame += 1;
      }
    }  
  }
}
  
  
