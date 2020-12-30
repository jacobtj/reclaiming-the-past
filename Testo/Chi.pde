class Chi extends Player {
  private boolean detached = false;
  private Player parent;
  private boolean jumping = false;
  private boolean pressed_down = false;
  private PApplet testo;
  public Chi(float x, float y, Player parent, Game game, ArrayList<String> img, PApplet testo) {
    super(x - 10, y, 10.0, 40.0, game, img, testo);
    this.parent = parent;
  }
 
  
  void update(float dt) {
    if (!detached) {
      if (isKeyDown('w')) {
        y = parent.getY() + 10;
      }
      if (isKeyDown('s')) {
       y = parent.getY() - 10;
      }
      if (isKeyDown('a')) {
        x = parent.getX() + 35;
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
         System.out.println("DE");
        pressed_down = true;
        detach();
      } else if (isKeyDown('q') && detached && !pressed_down) {
        System.out.println("ATTACT");
        pressed_down = true;
        reattach();
      }
      else if (!isKeyDown('q')) {
        pressed_down = false;
      }
      super.update(dt);
    }
    void detach() {
      detached = true;
      parent.stopSelf(detached);
     // super.update(dt);
    }
    void reattach() {
      detached = false;
      parent.stopSelf(detached);
     // update(dt);
    }
    

    
   
}
