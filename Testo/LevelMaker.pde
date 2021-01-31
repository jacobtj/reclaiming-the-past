class LevelMaker {
  private Background background;
  private Door portal;
  private Key memoryCore;
  private KeyBad badCore;
  private Lever lever;
  private PPlate pPlate;
  private Platform platform;
  private MovingPlatform mvPlatform;
  private ArrayList<String> coreImage;
  private ArrayList<String> portalImage;
  private ArrayList<String> badCoreImage;
  private ArrayList<String> plateImage;
  private ArrayList<PImage> backgroundImage;
  private GameObject currentMoving;
  //display all the possible objects on the side
  // make all of them drag and droppable ? wtf
  // make a scroll thing so levels can be as long as the player wants
  //be able to save the whole freakin thing in a text file
  //format of the text file: something?
  //make something in Game? that can read from the files
  //smh
  //load the files to play the game wowee
  public LevelMaker() {
    backgroundImage = new ArrayList<PImage>(Arrays.asList(loadImage("images/background.png"))); //"images/background.png", "images/background.png"));
    coreImage = new ArrayList<String>(Arrays.asList("images/memoryCore.png"));
    portalImage = new ArrayList<String>(Arrays.asList("images/portal.png"));
    badCoreImage = new ArrayList<String>(Arrays.asList("images/memoryCoreDark.png"));
    plateImage = new ArrayList<String>(Arrays.asList("images/lever.png"));
   // backgroundPImage.add(loadImage(backgroundImage.get(0)));
    setStage();
    
  }

  public void setStage() {
    background = new Background(game, backgroundImage);
  }
  
  public void update() {
  //do stuff that makes the players drags show up
  //for scrolling and maybe saving
  }
}
