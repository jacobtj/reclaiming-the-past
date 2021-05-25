class ButtonStart extends Button { 
  
  public ButtonStart(float bx, float by, float bw, float bh, Game game, ArrayList<PImage> img) {
    super(bx, by, bw, bh, game, img, true);
  }
  
  void action() { 
    System.out.print("before nextlevel");
    game.nextLevel();
  }
}
