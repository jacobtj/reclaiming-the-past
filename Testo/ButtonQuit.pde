class ButtonQuit extends Button { 
  
  public ButtonQuit(float bx, float by, float bw, float bh, Game game, ArrayList<PImage> img, boolean t) {
    super(bx, by, bw, bh, game, img, t);
    
  }
  
  void action() { 
    exit();
  }
}
