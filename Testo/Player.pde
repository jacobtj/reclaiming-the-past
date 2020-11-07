class Player extends GameObject {
  private float accely = 200.0;
  private float xvelo = 200.0;
  private float yvelo = 200.0;
  private boolean touches = false;
  
  public Player(float x, float y, Game game) {
    super(x, y, 20.0, 50.0, new int[] {0, 255, 0}, game);
  }
  
  void update(float dt) {
    touches = false;
    for (Hitbox hitbox: game.getHitboxes()) {
      if (!hitbox.getParent().equals(this)) {
        if (game.collision(this.hitbox, hitbox)) {
          touches = true;
          gravity(dt);
          String o = whichOrientation(this.hitbox, hitbox);
          System.out.println(o);
          stopPlayer(o, dt);
        }
      }
    }
    if (!touches) {
      xvelo = 200.0;
      accely = 200.0;
    }
    if (isKeyDown('w')) {
      y -= accely * dt;
    }
    if (isKeyDown('s')) {
      y += accely * dt;
    }
    if (isKeyDown('a')) {
      x -= xvelo * dt;
    }
    if (isKeyDown('d')) {
      x += xvelo * dt;
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
     y += accely / 2 * dt;
  }
  
  private void stopPlayer(String orientation, float dt) {
    if (orientation.equals("top")) {
      accely = 0;
      if (isKeyDown('w')) {
        accely = 200;
        jump(y, dt);
      }
    } if (orientation.equals("left")) {
      xvelo = 0;
      accely = 200;
      if (isKeyDown('a')) {
        xvelo = 200;
      }
    } if (orientation.equals("right")) {
      xvelo = 0;
      accely = 200;
      if (isKeyDown('d')) {
        xvelo = 200;
      }
    } 
  }
  
  private void jump(float yInitial, float dt) {
    y -= yInitial - yvelo + (.5 * accely * dt);
  }
  
  
  public String toString() {
    return "Player";
  }
}
  
  
