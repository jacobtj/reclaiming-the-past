class ButtonQuit extends Button { 
  
  public ButtonQuit(float bx, float by, float bw, float bh, Game game, ArrayList<PImage> img) {
    super(bx, by, bw, bh, game, img);
  }
  
  void action() { 
    exit();
  }
}
