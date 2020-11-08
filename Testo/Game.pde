class Game {
  Camera camera;
  Player player;
  int currentLevel;
  
  Platform platforma1;
  Platform platforma2;
  Platform platforma3;
  Platform platforma4;
  Platform platformb1;
  Platform platformb2;
  
  Platform platform;
  Platform platform2;
  Platform platform3;
  Platform platform4;
  Platform platform5;
  
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
    currentLevel = 1;
    levelOne();
    
  }
  
  public void nextLevel() { 
    currentLevel += 1;
    System.out.println("Now");
    allHitboxes.clear();
    System.out.println("Here");
    allObjects.clear();
    System.out.println("There");
    
    if (currentLevel == 2) {
      levelTwo();
    } 
    
    levelComplete = false;
  }
  
  void update(float dt) {
    if (gameOver == false) {
      //if (currentLevel == 1) {
        camera.update(dt);
        player.update(dt);
     // }
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
    nextLevel();
    
  }
  
  public void levelOne() { 
    
    
    platforma1 = new Platform(width / 4, height / 1.3, 400, 500, this);
    platforma2 = new Platform(width / 4 + 400, height / 1.3, 400, 500, this);
    platforma3 = new Platform(width / 4 + 800, height / 1.3, 400, 500, this);
    platforma4 = new Platform(width / 4 + 1200, height / 1.3, 400, 500, this);
    
    platformb1 = new Platform(width / 1.5, height / 1.7, 300, 25.0, this);
    platformb2 = new Platform(width / 1.5 + 300, height / 1.7, 300, 25.0, this);
    platformb2 = new Platform(width / 1.5 + 600, height / 1.7, 300, 25.0, this);
    
    Door door1 = new Door(width/1.5, height/1.5, this);
    Key key1 = new Key(width/1.5 + 30, height/1.5, this);
    
    
    player = new Player(width / 2, height / 2, this); 
    camera = new Camera(this);
  }
  
  public void levelTwo() {
    //allHitboxes = new ArrayList<Hitbox>();
    //allObjects = new ArrayList<GameObject>();
     
    
    platform = new Platform(width/4 + 200, height / 1.3, 500, 500, this);
    platform2 = new Platform(width/4 + 600, height / 1.3, 300, 500, this);
    platform3 = new Platform(width/4 + 1200, height / 1.3, 300, 300, this);
    
    platform4 = new Platform(width / 1.5 + 1000, height / 1.7, 200, 25.0, this);
    platform5 = new Platform(width / 1.5 + 400, height / 1.7, 200, 25.0, this);
    Door door1 = new Door(width/1.5, height/1.5, this);
    Key key1 = new Key(width/1, height/2.1, this);
    
    player = new Player(width / 2, height / 2, this);
    camera = new Camera(this);
  }
}
