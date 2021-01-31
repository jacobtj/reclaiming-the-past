import java.util.Iterator;

class Game {
  Background background;
  Camera camera;
  Player player;
  Chi chi;
  int currentLevel;
  Button button;
  
  Platform startButton;
  
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

  LevelMaker levelmaker;
  
 // Moving_Platform mvPlatform;
 // Moving_Platform mvPlatform2;
  //Moving_Platform mvPlatform3;
  Key memoryCore;
  Door portal;
  private ArrayList<Hitbox> allHitboxes;
  private ArrayList<GameObject> allObjects;
  private ArrayList<GameObject> objectsToUpdate;
  private boolean gameOver = false;
  private boolean levelComplete = false;
  private ArrayList<PImage> playerImage;
  private ArrayList<PImage> chiImage;
  private ArrayList<PImage> backgroundImage;
  private ArrayList<PImage> platformImage;
  private ArrayList<PImage> menuImage;
  
  private ArrayList<PImage> coreImage;
  private ArrayList<PImage> portalImage;
  private ArrayList<PImage> badCoreImage;
  private ArrayList<PImage> plateImage;
  
  private PImage fall;
  private PImage bull;
  private PImage bull2;
  private PImage end;
  private PImage menu;
  
  private PApplet testo;
  private int levelCompleteDelay = 0;
  private boolean won = false;
  private float level_size;
  
  public Game(PApplet testo) {
    allHitboxes = new ArrayList<Hitbox>();
    allObjects = new ArrayList<GameObject>();
    objectsToUpdate = new ArrayList<GameObject>();
    playerImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/Player1.png"), loadImage("images/Player2.png"), loadImage("images/Player3.png"), loadImage("images/Player4.png"), loadImage("images/Player5.png"), loadImage("images/Player6.png"), loadImage("images/Player7.png")));
    chiImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/chi1.png"), loadImage("images/chi2.png"), loadImage("images/chi3.png"), loadImage("images/chi4.png"), loadImage("images/chi5.png"), loadImage("images/chi6.png"), loadImage("images/chi7.png"), loadImage("images/chi8.png"), loadImage("images/chi9.png"), loadImage("images/chi10.png"), loadImage("images/chi11.png"), loadImage("images/chi12.png"), loadImage("images/chi13.png"), loadImage("images/chi14.png"), loadImage("images/chi15.png")));
    backgroundImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/background.png"))); //"images/background.png", "images/background.png"));
    menuImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/menu.jpg")));
    
    coreImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/memoryCore.png")));
    portalImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/portal.png")));
    badCoreImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/memoryCoreDark.png")));
    plateImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/lever.png")));
    platformImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/platform.png")));

    bull = loadImage("images/bullying1.png");
    bull2 = loadImage("images/bullying2.png");
    end = loadImage("images/ending.png");
    fall = loadImage("images/falling.png");
    
    menu = loadImage("images/menu.jpg");
    
    
    this.testo = testo;
   // System.out.println("Step 2 " + this.testo);
    levelmaker = new LevelMaker(this);
    currentLevel = -1;
    //nextLevel();
   // startMenu();
    
    //currentLevel = 1;
    
    //levelOne();
    //testMovingPlatform();
  }
  
  public void startMenu() { 
    background = new Background(this, menuImage);
    button = new ButtonStart(width / 2 - 100, height / 2, 200, 50, this, new ArrayList<PImage>());
    
  }
  
  public void nextLevel() { 
    currentLevel += 1;
    allHitboxes.clear();
    allObjects.clear();
    
    if (currentLevel == 0) {
      startMenu();
    }
    if (currentLevel == 1) {
      levelOne();
    }
    if (currentLevel == 2) {
      levelTwo();
    } else if(currentLevel == 3) {
      won = true;
      //image(end, 0, 0, width, height);
    }
    levelComplete = false;
  }
  
  void update(float dt) {
    if (gameOver == false && !levelComplete && !won) {
      for (int i = 0; i < allObjects.size(); i += 1) {
        allObjects.get(i).update(dt);
      }
      if (camera != null) {
        camera.update(dt);
      }
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
  
  public boolean xCollision(Hitbox box1, Hitbox box2) {
    boolean inX = box1.getX() + box1.getWidth() >= box2.getX() && box1.getX() <= box2.getX() + box2.getWidth();
    return inX;
  }
  
  public boolean yCollision(Hitbox box1, Hitbox box2) {
    boolean inY = box1.getY() + box1.getHeight() >= box2.getY() && box1.getY() <= box2.getY() + box2.getHeight();
    return inY;
  }
  
  public boolean collision(Hitbox box1, Hitbox box2) {
    boolean inX = xCollision(box1, box2);
    boolean inY = yCollision(box1, box2);
    if (inX && inY && box1.isActive() && box2.isActive()) {
      return true;
    } else {
      return false;
    }
  }
  
  void draw() {
    if (gameOver == false) {
      if (background != null) {
        background.draw(0, 0, 0, 0);
      }
      for (int i = 0; i < allHitboxes.size(); i += 1) {
        if (allHitboxes.get(i).getInvisible() == false) { 
          if (!levelComplete) {
          allHitboxes.get(i).draw();
          }
        }
      }
    } else {
      //clear();
    }
    
    if (gameOver && !levelComplete) {
      image(fall, 0, 0, width, height);
    }
    
    if (levelComplete) {
      if (currentLevel == 1) {
      image(bull, 0, 0, width, height);
      } else if (currentLevel == 2) {
       image(bull2, 0, 0, width, height);
      } else if (currentLevel == 3) {
        //image(end, 0, 0, width, height);
      }
      levelCompleteDelay += 1;
      if (levelCompleteDelay > 100) {
        levelCompleteDelay = 0;
        nextLevel();
      }
    //image(fall, 0, 0);
    }
    if (won) {
      image(end, 0, 0, width, height);
    }
   
  }
  
  public void gameOver() {
    System.out.println("Game over");
    gameOver = true;
    
  }
  
  public void levelComplete() {
    for (int i = 0; i < allHitboxes.size(); i += 1) {
      allHitboxes.get(i).setActive(false);
    }
    player = null;
    levelComplete = true;
    
    System.out.println("level is complete");
   // nextLevel();
    
  }
  
  public float getLevelSize() {
    return level_size;
  }
  
  public Camera getCamera() {
    return camera;
  }
  
  public void levelZero() {
    background = new Background(this, backgroundImage);
    level_size = 400;
    new Platform(width / 4, height / 2.5, 2000, 1000, this, platformImage);
    new Platform(width / 1.5, height / 4, 200, 100, this, platformImage);
    new Platform(width, height / 4, 200, 1000, this, platformImage);
    //platforma1 = new Platform(20, height / 20, 600, 1000, this);
    player = new Player(width / 2, height / 3, 30, 50, this, playerImage, this.testo); 
    chi = new Chi(width / 2, height / 3, player, this, chiImage, this.testo); 
    camera = new Camera(this, level_size);
  }
  
  public void levelOne() { 
    
    level_size = 1700 + width / 8;
    background = new Background(this, backgroundImage);
    platforma1 = new Platform(0, height / 1.1, 1700, 10000, this, platformImage);
    //platforma1 = new Platform(width / 8, height / 1.3, 1700, 1000, this);
   // platforma2 = new Platform(width / 4 + 400, height / 1.3, 500, 1000, this);
   // platforma3 = new Platform(width / 4 + 800, height / 1.3, 500, 1000, this);
   // platforma4 = new Platform(width / 4 + 1200, height / 1.3, 400, 1000, this);
    
   // platformb1 = new Platform(width / 1.5, height / 1.7, 900, 100.0, this);
   // platformb2 = new Platform(width / 1.5 + 300, height / 1.7, 300, 100.0, this);
   // platformb2 = new Platform(width / 1.5 + 600, height / 1.7, 300, 100.0, this);
    
    Door door1 = new Door(width/1.3, height/1.4, this, portalImage);
    Key key1 = new Key(width/1.5 + 700, height/1.5, this, coreImage);
    Key key2 = new Key(width/1.5 + 600, height/1.5, this, coreImage);
    Key key3 = new Key(width/1.5 + 800, height/1.5, this, coreImage);
   // KeyBad key4 = new KeyBad(width/2, height/2 - 150, this, badCoreImage);
    //mvPlatform = new Moving_Platform((float) width / 2, (float) height / 2 - 50, (float) 100, (float) 100, 4, 50.0, this);
   // System.out.println("Step 3 " + this.testo);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, this.testo); 
    player.setNumKeys(3);
    chi = new Chi(width / 2, height / 2, player, this, chiImage, this.testo); 
    camera = new Camera(this, level_size);
  }
  
  public void levelTwo() {
    //allHitboxes = new ArrayList<Hitbox>();
    //allObjects = new ArrayList<GameObject>();
    background = new Background(this, backgroundImage);
    level_size = width/4 + 200 + 1000 + 50 + 500;
    
    platform = new Platform(50, height / 1.3, width/4 + 200 + 1000 + 50 - 100, 1000, this, platformImage);
   // platform2 = new Platform(width/4 + 600, height / 1.3, 300, 100, this);
   // platform3 = new Platform(width/4 + 1200, height / 1.3, 300, 100, this);
    new MovingPlatform((float) width / 2, (float) height / 2, (float) 100, (float) 100, 4, 100.0, true, this, platformImage);
  //  platform4 = new Platform(width / 1.5 + 1000, height / 1.7, 200, 25.0, this);
    platform5 = new Platform(width/4 + 200 + 1000 + 50, height / 1.7, 500, 100.0, this, platformImage);
    Door door1 = new Door(width/1.5, height/1.5, this, portalImage);
    Key key1 = new Key(width/4 + 200 + 1000 + 50 + 250, height / 1.7 - 50, this, coreImage);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, testo);
    chi = new Chi(width / 2, height / 2, player, this, chiImage, this.testo); 
    camera = new Camera(this, level_size);
  }
  
 /** public void testMovingPlatform() {
    background = new Background(this, backgroundImage);
    level_size = width/4 + 200 + 1000 + 50 + 500 + 10000;

    platform4 = new Platform(width / 1.5, height / 1.5, 2000, 250, this);
    Key key1 = new Key(width/2, height/2.1, this, coreImage);
    mvPlatform = new Moving_Platform((float) width / 2, (float) height / 2.5, (float) 1000, (float) 1000, 2, 20, false, this);
    //PPlate plate1 = new PPlate(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage); 
    Lever lever1 = new Lever(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage);
  //  platform4 = new Platform(width / 1.5 + 1000, height / 1.7, 200, 25.0, this);
    platform5 = new Platform(width/4 + 200 + 1000 + 50, height / 1.7, 500, 100.0, this, platformImage);
    Door door1 = new Door(width/1.5, height/1.5, this, portalImage);
    Key key1 = new Key(width/4 + 200 + 1000 + 50 + 250, height / 1.7 - 50, this, coreImage);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, testo);
    chi = new Chi(width / 2, height / 2, player, this, chiImage, this.testo); 
    camera = new Camera(this, level_size);
  }
  
 /** public void testMovingPlatform() {
    background = new Background(this, backgroundImage);
    level_size = width/4 + 200 + 1000 + 50 + 500 + 10000;

    platform4 = new Platform(width / 1.5, height / 1.5, 2000, 250, this);
    Key key1 = new Key(width/2, height/2.1, this, coreImage);
    mvPlatform = new Moving_Platform((float) width / 2, (float) height / 2.5, (float) 1000, (float) 1000, 2, 20, false, this);
    //PPlate plate1 = new PPlate(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage); 
    Lever lever1 = new Lever(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage);
  //  platform4 = new Platform(width / 1.5 + 1000, height / 1.7, 200, 25.0, this);
    platform5 = new Platform(width/4 + 200 + 1000 + 50, height / 1.7, 500, 100.0, this, platformImage);
    Door door1 = new Door(width/1.5, height/1.5, this, portalImage);
    Key key1 = new Key(width/4 + 200 + 1000 + 50 + 250, height / 1.7 - 50, this, coreImage);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, testo);
    chi = new Chi(width / 2, height / 2, player, this, chiImage, this.testo); 
    camera = new Camera(this, level_size);
  }
  
 /** public void testMovingPlatform() {
    background = new Background(this, backgroundImage);
    level_size = width/4 + 200 + 1000 + 50 + 500 + 10000;

    platform4 = new Platform(width / 1.5, height / 1.5, 2000, 250, this);
    Key key1 = new Key(width/2, height/2.1, this, coreImage);
    mvPlatform = new Moving_Platform((float) width / 2, (float) height / 2.5, (float) 1000, (float) 1000, 2, 20, false, this);
    //PPlate plate1 = new PPlate(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage); 
    Lever lever1 = new Lever(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage);
  //  platform4 = new Platform(width / 1.5 + 1000, height / 1.7, 200, 25.0, this);
    platform5 = new Platform(width/4 + 200 + 1000 + 50, height / 1.7, 500, 100.0, this, platformImage);
    Door door1 = new Door(width/1.5, height/1.5, this, portalImage);
    Key key1 = new Key(width/4 + 200 + 1000 + 50 + 250, height / 1.7 - 50, this, coreImage);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, testo);
    chi = new Chi(width / 2, height / 2, player, this, chiImage, this.testo); 
    camera = new Camera(this, level_size);
  }
  
 /** public void testMovingPlatform() {
    background = new Background(this, backgroundImage);
    level_size = width/4 + 200 + 1000 + 50 + 500 + 10000;

    platform4 = new Platform(width / 1.5, height / 1.5, 2000, 250, this);
    Key key1 = new Key(width/2, height/2.1, this, coreImage);
    mvPlatform = new Moving_Platform((float) width / 2, (float) height / 2.5, (float) 1000, (float) 1000, 2, 20, false, this);
    //PPlate plate1 = new PPlate(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage); 
    Lever lever1 = new Lever(width/1.5 + 500, height/1.5, mvPlatform, this, plateImage);
