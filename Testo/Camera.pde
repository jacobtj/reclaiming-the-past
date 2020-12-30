class Camera {
  private Game game;
  private float dist = 0;
  private float speed = 1;
  private float range_max;
  private float range_min = 0;
  private boolean first_round = true;
  private ArrayList<GameObject> objectList = new ArrayList<GameObject>();
  
  public Camera(Game game, float range) {
    this.game = game;
    for (GameObject object: game.getObjects()) {
      objectList.add(object);
    }
    this.range_max = range;
  }
  
  public void update(float dt) {
    dist += speed;
    if (dist >= range_max) {
      for (GameObject object : objectList) {
        if (object.toString() != "Player" || (object instanceof Player && !((Player) object).getHasChi())) { 
          if (! (object instanceof Background)) {
            if (first_round) {
              object.setOffset1(object.getOffset1() + range_max * 2);
              for (int i = 0; i < object.getHitbox().length; i += 1) {
                object.update();//object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
              }
            } else {
              object.setOffset2(object.getOffset2() + range_max * 2);
              //object.setX(object.getX() + range_max * 2);
              for (int i = 0; i < object.getHitbox().length; i += 1) {
                object.update();//object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
              }
            }
            //for (int i = 0; i < object.getHitbox().length; i += 1) {
            //  object.getHitbox()[0].update(object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
           // }
          }
        }
      }
      first_round = !first_round;
      dist = 0;
    }
    
    /*for (GameObject object : objectList) {
      if (object.toString() != "Player") { 
        if (object.getX() < -range_max * 2) { 
          
          if (! (object instanceof Background)) {
            object.setX(object.getX() + 400 + range_max + width);
            object.getHitbox().update(object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
          }
        }
      }
    }*/
    
    for (GameObject object : objectList) {
      if (object.toString() != "Player" || (object instanceof Player && !((Player) object).getHasChi())) {
        object.setX(object.getX() - speed);
        if (! (object instanceof Background)) {
          for (int i = 0; i < object.getHitbox().length; i += 1) {
            object.update();//object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
          }
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
