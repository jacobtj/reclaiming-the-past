

Game game;
float previousFrameTime;
HashMap<Integer, Boolean> inputMap;


void setup() {
  size(1280, 720);
  game = new Game();
  previousFrameTime = millis();
  inputMap = new HashMap();
}

void draw() {
  
  float currentFrameTime = millis();
  float deltaTime = currentFrameTime - previousFrameTime;
  deltaTime /= 1000.0;
  previousFrameTime = currentFrameTime;
  game.update(deltaTime);
  clear();
  game.draw();
  
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
