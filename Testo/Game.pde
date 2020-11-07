class Game {
  Player player;
  Platform platform;
  Moving_Platform mvPlatform;
  Moving_Platform mvPlatform2;
  Moving_Platform mvPlatform3;
  private ArrayList<Hitbox> allHitboxes;
  private ArrayList<GameObject> allObjects;
  
  public Game() {
    allHitboxes = new ArrayList<Hitbox>();
    player = new Player(width / 2, height / 2, this); 
    platform = new Platform(width / 2, height / 1.5, this);
    mvPlatform = new Moving_Platform(width / 2, 0, 0, this);
    mvPlatform2 = new Moving_Platform(width / 2 + 60, height, 4, this);
    mvPlatform3 = new Moving_Platform(0, height, 3, this);
    
  }
  
  void update(float dt) {
    player.update(dt);
    mvPlatform.update(dt);
    mvPlatform2.update(dt);
    mvPlatform3.update(dt);
  }
  
  public void addObject(GameObject object) {
    allObjects.add(object);
  }
  
  public void addHitbox(Hitbox hitbox) {
    allHitboxes.add(hitbox);
  }
  
  public ArrayList<GameObject> getObjects() {
    return allObjects;
  }
  
  public ArrayList<Hitbox> getHitboxes() {
    return allHitboxes;
  }
  
  public boolean collision(Hitbox box1, Hitbox box2) {
    boolean inX = box1.getX() + box1.getWidth() >= box2.getX() && box1.getX() <= box2.getX() + box2.getWidth();
    boolean inY = box1.getY() + box1.getHeight() >= box2.getY() && box1.getY() <= box2.getY() + box2.getHeight();
    if (inX && inY) {
      return true;
    } else {
      return false;
    }
  }
  
  void draw() {
    for (int i = 0; i < allHitboxes.size(); i += 1) {
      allHitboxes.get(i).draw();
    }
  }
  
}
