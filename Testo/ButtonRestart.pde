class ButtonRestart extends Button { 
  
  public ButtonRestart(float bx, float by, float bw, float bh, Game game, ArrayList<PImage> img) {
    super(bx, by, bw, bh, game, img, false);
  }
  
  void action() { 
    game.setCurrentLevel(game.getCurrentLevel() - 1); 
    game.nextLevel();
  }
}
