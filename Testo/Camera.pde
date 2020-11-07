class Camera {
  private Game game;
  public Camera(Game game) {
    this.game = game;
  }
  
  public void update(float dt) {
    for (Object object : game.getObjects()) {
     // object.getX
    }
  }
}
