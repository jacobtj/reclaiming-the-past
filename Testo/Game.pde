class Game {
  Background background;
  Camera camera;
  Player player;
  Chi chi;
  int currentLevel;
  
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
  
  Moving_Platform mvPlatform;
  Moving_Platform mvPlatform2;
  Moving_Platform mvPlatform3;
  Key memoryCore;
  Door portal;
  private ArrayList<Hitbox> allHitboxes;
  private ArrayList<GameObject> allObjects;
  private boolean gameOver = false;
  private boolean levelComplete = false;
  private ArrayList<String> playerImage;
  private ArrayList<String> chiImage;
  private ArrayList<String> backgroundImage;
  private ArrayList<String> coreImage;
  private ArrayList<String> portalImage;
  
  private PImage fall;
  private PImage bull;
  private PImage bull2;
  private PImage end;
  
  private PApplet testo;
  private int levelCompleteDelay = 0;
  
  private SoundFile awakeningTheme;
  private SoundFile reclaimingTheme;
  private SoundFile familiarTheme;
  private SoundFile beginningTheme;
  private SoundFile memoriesFallingTheme;
  private SoundFile becauseTheme;
  
  private MusicHandler musicHandler;
  
  public Game(PApplet testo) {
    allHitboxes = new ArrayList<Hitbox>();
    allObjects = new ArrayList<GameObject>();
    playerImage = new ArrayList<String>(Arrays.asList("images/Player1.png", "images/Player2.png", "images/Player3.png", "images/Player4.png", "images/Player5.png", "images/Player6.png", "images/Player7.png"));
    chiImage = new ArrayList<String>(Arrays.asList("images/chi1.png", "images/chi2.png", "images/chi3.png", "images/chi4.png", "images/chi5.png", "images/chi6.png", "images/chi7.png", "images/chi8.png", "images/chi9.png", "images/chi10.png", "images/chi11.png", "images/chi12.png", "images/chi13.png", "images/chi14.png", "images/chi15.png"));
    backgroundImage = new ArrayList<String>(Arrays.asList("images/background.png")); //"images/background.png", "images/background.png"));
    coreImage = new ArrayList<String>(Arrays.asList("images/memoryCore.png"));
    portalImage = new ArrayList<String>(Arrays.asList("images/portal.png"));
    bull = loadImage("images/bullying1.png");
    bull2 = loadImage("images/bullying2.png");
    end = loadImage("images/ending.png");

    fall = loadImage("images/falling.png");
    
    this.testo = testo;
    System.out.println("Step 2 " + this.testo);
    
    awakeningTheme = new SoundFile(testo, "Sounds/Awakening to a New World.wav");
    reclaimingTheme = new SoundFile(testo, "Sounds/Recalling A Long Time Past.wav");
    familiarTheme = new SoundFile(testo, "Sounds/A Familiar Stranger.wav");
    beginningTheme = new SoundFile(testo, "Sounds/Beginning Again.wav");
    memoriesFallingTheme = new SoundFile(testo, "Sounds/Memories Filled with Emotion Falling.wav");
    becauseTheme = new SoundFile(testo, "Sounds/Because of You I Live.wav");
    
    musicHandler = new MusicHandler(this);
    
    currentLevel = 0;
    startMenu();
    
    currentLevel = 1;
    levelOne();
    //testMovingPlatform();
  }
  
  public void startMenu() { 
    background = new Background(this, backgroundImage);
  }
  
  public void nextLevel() { 
    currentLevel += 1;
    allHitboxes.clear();
    allObjects.clear();
    
    
    
    if (currentLevel == 2) {
      levelTwo();
    } else if(currentLevel == 3) {
      musicHandler.playSong(becauseTheme, true);
      image(end, 0, 0, width, height);
    }
    levelComplete = false;
  }
  
  void update(float dt) {
    if (gameOver == false) {
      //if (currentLevel == 1) {
        camera.update(dt);
        player.update(dt);
        chi.update(dt);
        
        
      //  mvPlatform.update(dt);
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
      background.draw();
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
        if (levelCompleteDelay == 0) {
          musicHandler.playSong(memoriesFallingTheme, true);
        }
      image(bull, 0, 0, width, height);
      } else if (currentLevel == 2) {
        if (levelCompleteDelay == 0) {
          musicHandler.playSong(memoriesFallingTheme, true);
        }
        image(bull2, 0, 0, width, height);
      } else if (currentLevel == 3) {
        image(end, 0, 0, width, height);
      }
      levelCompleteDelay += 1;
      if (levelCompleteDelay > 100) {
        levelCompleteDelay = 0;
        nextLevel();
      }
    //image(fall, 0, 0);
    }
   
  }
  
  public void gameOver() {
    System.out.println("Game over");
    musicHandler.playSong(becauseTheme, true);
    gameOver = true;
    
  }
  
  public void levelComplete() {
    levelComplete = true;
    
    System.out.println("level is complete");
   // nextLevel();
    
  }
  
  public void levelOne() { 
    musicHandler.playSong(familiarTheme, true);
    background = new Background(this, backgroundImage);
    platforma1 = new Platform(width / 4, height / 1.3, 400, 100, this);
    platforma2 = new Platform(width / 4 + 400, height / 1.3, 400, 100, this);
    platforma3 = new Platform(width / 4 + 800, height / 1.3, 400, 100, this);
    platforma4 = new Platform(width / 4 + 1200, height / 1.3, 400, 100, this);
    
    platformb1 = new Platform(width / 1.5, height / 1.7, 300, 25.0, this);
    platformb2 = new Platform(width / 1.5 + 300, height / 1.7, 300, 25.0, this);
    platformb2 = new Platform(width / 1.5 + 600, height / 1.7, 300, 25.0, this);
    
    Door door1 = new Door(width/1.5, height/1.5, this, portalImage);
    Key key1 = new Key(width/1.5 + 1200, height/1.5, this, coreImage);
    
   // System.out.println("Step 3 " + this.testo);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, this.testo); 
    chi = new Chi(width / 2, height / 2, player, this, chiImage, this.testo); 
    camera = new Camera(this);
  }
  
  public void levelTwo() {
    //allHitboxes = new ArrayList<Hitbox>();
    //allObjects = new ArrayList<GameObject>();
     musicHandler.playSong(beginningTheme, true);
    
    platform = new Platform(width/4 + 200, height / 1.3, 500, 100, this);
    platform2 = new Platform(width/4 + 600, height / 1.3, 300, 100, this);
    platform3 = new Platform(width/4 + 1200, height / 1.3, 300, 100, this);
    
    platform4 = new Platform(width / 1.5 + 1000, height / 1.7, 200, 25.0, this);
    platform5 = new Platform(width / 1.5 + 400, height / 1.7, 200, 25.0, this);
    Door door1 = new Door(width/1.5, height/1.5, this, portalImage);
    Key key1 = new Key(width/1, height/2.1, this, coreImage);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, testo);
    chi = new Chi(width / 2, height / 2, player, this, chiImage, this.testo); 
    camera = new Camera(this);
  }
  
  public void testMovingPlatform() { 
   /* camera = new Camera(this);
    background = new Background(this, backgroundImage);
    player = new Player(width / 2, height / 2, 30.0, 50.0, this, playerImage, testo); 
    chi = new Chi(width / 2, height / 2, player, this, chiImage, testo);
    platform = new Platform(width / 4, height / 1.3, 100000, 500, this);
    platform4 = new Platform(width / 1.5, height / 1.7, 10000, 25.0, this);
    Door door1 = new Door(width/0.75, height/1.5, this, portalImage);
    Key key1 = new Key(width/1, height/2.1, this, coreImage);
    mvPlatform = new Moving_Platform((float) width / 2, (float) height / 2, (float) 100, (float) 100, 4, 100.0, this);
  //  Lever lever1 = new Lever(width/1, height/1.8, mvPlatform, this);
    player = new Player(width / 2, height / 2, 30, 50, this, playerImage, testo); 

    
    platform = new Platform(width / 4, height / 1.3, 100000, 500, this);
    mvPlatform = new Moving_Platform(width / 1.5, height / 1.7, 100, 20, 2, 100, this);*/
  }
}
