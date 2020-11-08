class Game {
  Camera camera;
  MainPlayer player;
  Chi chi;
  Platform platform;
  Platform platform2;
  Platform platform3;
  Platform platform4;
  Moving_Platform mvPlatform;
  Moving_Platform mvPlatform2;
  Moving_Platform mvPlatform3;
  private ArrayList<Hitbox> allHitboxes;
  private ArrayList<GameObject> allObjects;
  private boolean gameOver = false;
  private boolean levelComplete = false;
  
  public Game() {
    allHitboxes = new ArrayList<Hitbox>();
    allObjects = new ArrayList<GameObject>();
    levelOne();
    //camera = new Camera(this);
    //player = new Player(width / 2, height / 2, this); 
    //platform = new Platform(width / 2, height / 1.3, 500.0, 500, this);
    //platform2 = new Platform(platform.getX() + platform.getWidth() - 200, height / 2, 100.0, 700.0, this);
    //platform3 = new Platform(width / 1.5, height / 4 + 50, 500.0, 200.0, this);
    //platform4 = new Platform(width / 2.5, height / 1.5, 50, 50.0, this);
    //Platform platform5 = new Platform(width / 2.5 - 100, height / 1.5 - 100, 50, 50.0, this);
    //Platform platform6 = new Platform(width / 2.5, height / 1.5 - 200, 50, 50.0, this);
    //Door door1 = new Door(width/2, height/2, this);
    //Key key1 = new Key(width/2, height/3, this);
    //mvPlatform = new Moving_Platform(width / 2, 0, 0, this);
   // mvPlatform2 = new Moving_Platform(width / 2 + 60, height, 4, this);
   // mvPlatform3 = new Moving_Platform(0, height, 3, this);
    
  }
  
  void update(float dt) {
    if (gameOver == false) {
      camera.update(dt);
      player.update(dt);
      chi.update(dt);
     // mvPlatform.update(dt);
     // mvPlatform2.update(dt);
    //  mvPlatform3.update(dt);
    } 
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
    if (gameOver == false) {
      for (int i = 0; i < allHitboxes.size(); i += 1) {
        allHitboxes.get(i).draw();
      }
    } else {
      clear();
    }
  }
  
  public void gameOver() {
    gameOver = true;
  }
  
  public void levelComplete() {
    levelComplete = true;
    System.out.println("level is complete");
  }
  
  public void levelOne() {
    //allHitboxes = new ArrayList<Hitbox>();
    //allObjects = new ArrayList<GameObject>();
    camera = new Camera(this);
    player = new MainPlayer(width / 2, height / 2, this); 
    platform = new Platform(width / 4, height / 1.3, 100000, 500, this);
    platform4 = new Platform(width / 1.5, height / 1.7, 10000, 25.0, this);
    Door door1 = new Door(width/0.75, height/1.5, this);
    Key key1 = new Key(width/1, height/2.1, this);
  }
}
