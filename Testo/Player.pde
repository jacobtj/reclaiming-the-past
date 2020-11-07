class Player extends GameObject {
  private float accely_scale = 0.2;
  private float accely = accely_scale;
  private float max_accel = 7;
  private float xvelo = 200.0;
  private float yvelo = 5.0;
  private float time = 0;
  private boolean touches = false;
  private boolean jumping = false;
  private boolean ready_to_jump = false;
  
  public Player(float x, float y, Game game) {
    super(x, y, 20.0, 50.0, new int[] {0, 255, 0}, game);
  }
  
  void update(float dt) {
    touches = false;
    ready_to_jump = false;
    for (Hitbox hitbox: game.getHitboxes()) {
      if (!hitbox.getParent().equals(this)) {
        if (game.collision(this.hitbox, hitbox)) {
          touches = true;
         // gravity(dt);
          String o = whichOrientation(this.hitbox, hitbox);
          System.out.println(o);
          if (o.equals("top")) { 
            ready_to_jump = true;
            y = hitbox.getY() - h;
          }
          stopPlayer(o, dt);
        }
      }
    }
    if (!touches) {
      xvelo = 200.0;
      accely = accely_scale;
    }
    if (!ready_to_jump) {
      time += 1;
    }
    if (isKeyDown('w')) {
     // y -= accely * dt;
    }
    if (isKeyDown('s')) {
     // y += accely * dt;
    }
    if (isKeyDown('a')) {
      x -= xvelo * dt;
    }
    if (isKeyDown('d')) {
      x += xvelo * dt;
    }
    if (jumping) {
      jump();
    }
    gravity(dt);
    super.update(dt);
  }
  
  private String whichOrientation(Hitbox box1, Hitbox box2) {
    //player on top
    if (box1.getY() < box2.getY() && box1.getX() >= box2.getX() 
    && box1.getX() + box1.getWidth() <= box2.getX() + box2.getWidth()) {
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
  
  private void stopPlayer(String orientation, float dt) {
    if (orientation.equals("top")) {
      accely = 0;
      time = 0;
      jumping = false;
      if (isKeyDown('w')) {
        accely = accely_scale;
        jumping = true;
       // jump(y, dt);
      }
    } if (orientation.equals("left")) {
      xvelo = 0;
      if (isKeyDown('a')) {
        xvelo = 200;
      }
    } if (orientation.equals("right")) {
      xvelo = 0;
      if (isKeyDown('d')) {
        xvelo = 200;
      }
    } else if (orientation.equals("bottom")){
      jumping = false;
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
}
  
  
