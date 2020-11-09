class Camera {
  private Game game;
  private float dist = 0;
  private float speed = 1;
  private float range_max = 0;
  private float range_min = 0;
  private ArrayList<GameObject> objectList = new ArrayList<GameObject>();
  
  public Camera(Game game) {
    this.game = game;
    for (GameObject object: game.getObjects()) {
      objectList.add(object);
    }
  }
  
  public void update(float dt) {
    dist += speed;
    
    for (GameObject object : objectList) {
      if (object.toString() != "Player") { 
        if (object.getX() + 400 < -range_max) { 
          object.setX(object.getX() + 400 + range_max + width);
          object.getHitbox().update(object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
        }
      }
    }
    
    for (GameObject object : objectList) {
      if (object.toString() != "Player") {
        object.setX(object.getX() - speed);
        if (! (object instanceof Background)) {
          object.getHitbox().update(object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
        }
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
