class Camera {
  private Game game;
  private float dist = 0;
  private float player_dist = 0;
  private float speed = 2;
  private float background_speed = 1;
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
 
  public void setPlayerDist(float new_dist) {
    player_dist = new_dist;
  }
 
  public void focusOn(GameObject center) {
   // System.out.println("Focus");
    float offset = 50;
    float dist_to_center = range_max - center.getX() + offset;
   // System.out.println(dist_to_center);
   // System.out.println(range_max - dist_to_center);
    //System.out.println(dist);
    dist -= dist_to_center;
    //System.out.println(dist);
    if (!first_round) {
      for (GameObject object : objectList) {
        if (!(object instanceof Background)) {
          object.setOffset1(0);
          if (object instanceof Player) {
            object.setX(offset);
          } else {
            object.setX(object.getX() + range_max + object.getOffset2() + dist_to_center);
          }
          object.setOffset2(0);
        }
      }
    } else {
     // System.out.println("Ohno");
      for (GameObject object : objectList) {
        if (!(object instanceof Background)) {
          if (object instanceof Player) {
            object.setX(offset);
          } else {
            object.setX(object.getX() + object.getOffset1() + dist_to_center);
          }
          object.setOffset1(0);
          object.setOffset2(0);
        }
      }
    }
    /*for (GameObject object : objectList) {
      object.setOffset1(0);
      object.setX(dist_to_center);
      //object.setOffset1(object.getOffset1() + dist_to_center);
     
      object.setOffset2(range_max);
      object.setOffset2(object.getOffset2() + dist_to_center);
    }*/
   // for (GameObject object : objectList) {
     
  //  }
    //center.setX(0);
   
    first_round = true;
   
  }
 
  public void update(float dt) {
    dist += speed;
   
    if (dist >= range_max) {
      for (GameObject object : objectList) {
        if (object.toString() != "Player") {// || (object instanceof Player && !((Player) object).getHasChi())) {
          if (! (object instanceof Background)) {
            if (first_round) {
              object.setOffset1(object.getOffset1() + range_max * 2);
              for (int i = 0; i < object.getHitbox().length; i += 1) {
                object.update(dt);
              }
             // System.out.println("First round done!");
            } else {
              object.setOffset2(object.getOffset2() + range_max * 2);
              for (int i = 0; i < object.getHitbox().length; i += 1) {
                object.update(dt);
              }
            }
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
   //System.out.println("HERE");
  // System.out.println(objectList.size());
    for (GameObject object : objectList) {
      if (object.toString() != "Player") {
          //System.out.println(object.getX());
        }
      if (object.toString() != "Player" || (object instanceof Player && !((Player) object).getHasChi())) {
        if (object instanceof Background) {
          object.setX(object.getX() - background_speed);
        } else {
          object.setX(object.getX() - speed);
        }
       
        if (! (object instanceof Background)) {
          
          for (int i = 0; i < object.getHitbox().length; i += 1) {
            
            object.update(dt);//object.getX(), object.getY(), object.getWidth(), object.getHeight(), object.getColor());
          }
        }
      } else {
        if (object.getX() <= 0) {
          //object.setX(0);
        } else if(object.getX() + object.getWidth() >= width) {
          object.setX(width - object.getWidth());
        }
      }
    }
  }
}
