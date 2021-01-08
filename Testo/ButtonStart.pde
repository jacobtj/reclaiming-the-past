class ButtonStart extends Button { 
  
  public ButtonStart(float bx, float by, float bw, float bh, Game game, ArrayList<String> img) {
    super(bx, by, bw, bh, game, img);
  }
  
  void action() { 
    game.nextLevel();
  }
}
