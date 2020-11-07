class Camera {
  private Game game;
  private float speed = 1;
  public Camera(Game game) {
    this.game = game;
  }
  
  public void update(float dt) {
    for (GameObject object : game.getObjects()) {
      if (object.toString() != "Player") {
       // object.setX(object.getX() - speed);
        //object.getHitbox().update(object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
      }
    }
  }
}
