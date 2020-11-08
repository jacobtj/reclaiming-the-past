class Camera {
  private Game game;
  private float dist = 0;
  private float speed = 1;
  private float range_max = 800;
  private float range_min = 0;
  public Camera(Game game) {
    this.game = game;
  }
  
  public void update(float dt) {
    dist += speed;
    if (dist > range_max) {
      speed *= -1;
      dist = range_max;
    } else if (dist < range_min) {
      speed *= -1;
      dist = range_min;
    }
    for (GameObject object : game.getObjects()) {
      if (object.toString() != "Player") {
        object.setX(object.getX() - speed);
        object.getHitbox().update(object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
      } else {
        if (object.getX() <= 0) {
          object.setX(0);
        } else if(object.getX() + object.getWidth() >= width) {
          object.setX(width - object.getWidth());
        }
      }
    }
  }
}
