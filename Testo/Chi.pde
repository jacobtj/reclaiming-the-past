class Chi extends Player {
  private boolean detached = false;
  private MainPlayer parent;
  private boolean touches = false;
  private boolean ready_to_jump = false;
  private boolean jumping = false;
  private float xvelo = 200.0;
  private float accely_scale = 0.5;
  private float accely = accely_scale;
  private boolean pressed_down = false;
  public Chi(float x, float y, MainPlayer parent, Game game) {
    super(x - 30, y, game);
    this.parent = parent;
  }
 
  
  void update(float dt) {
    touches = false;
    ready_to_jump = false;
    if (!detached) {
      if (isKeyDown('w')) {
        y = parent.getY() + 10;
      }
      if (isKeyDown('s')) {
       y = parent.getY() - 10;
      }
      if (isKeyDown('a')) {
        x = parent.getX() + 20;
      }
      if (isKeyDown('d')) {
        x = parent.getX() - 20;
      }
      if (jumping) {
        super.jump();
      }
    }
      if (chiTime == 2) {
      chiTime = 0;
      }
      if (isKeyDown('q') && !detached && !pressed_down) {
         //System.out.println("DE");
        pressed_down = true;
        detach(dt);
      } else if (isKeyDown('q') && detached && !pressed_down) {
        //System.out.println("ATTACT");
        pressed_down = true;
        reattach(dt);
      }
      else if (!isKeyDown('q')) {
        pressed_down = false;
      }
      super.update(dt);
    }
    void detach(float dt) {
      detached = true;
      parent.stopSelf(detached);
     // super.update(dt);
    }
    void reattach(float dt) {
      detached = false;
      parent.stopSelf(detached);
     // update(dt);
    }
    
   
}
