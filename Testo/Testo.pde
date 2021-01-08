Game game;
LevelMaker levelMaker;
float previousFrameTime;
HashMap<Integer, Boolean> inputMap;
boolean clicked = false;


void setup() {
  size(1280, 720);
  //System.out.println("Step 1 " + this);
  //game = new Game(this);
  levelMaker = new LevelMaker();
  previousFrameTime = millis();
  inputMap = new HashMap();
  
}

void draw() {
  
  float currentFrameTime = millis();
  float deltaTime = currentFrameTime - previousFrameTime;
  deltaTime /= 1000.0;
  previousFrameTime = currentFrameTime;
  //game.update(deltaTime);
  clear();
  //game.draw();
  
  clicked = false;
}

  boolean isKeyDown(char key) {
    if (inputMap.containsKey((int)key)) {
      return inputMap.get((int)key);
    }
    return false;
  }
  
  void keyPressed() {
    char pressed = Character.toLowerCase(key);
    inputMap.put((int)pressed, true);
  }
  
  void keyReleased() {
    char pressed = Character.toLowerCase(key);
    inputMap.put((int)pressed, false);
  }
  
  
  void mouseClicked() {  
    clicked = true;
  }
  
  
