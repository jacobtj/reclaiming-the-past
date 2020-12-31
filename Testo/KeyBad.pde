class KeyBad extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  
  public KeyBad(float x, float y, Game game, ArrayList<String> img) {
    super(x, y, 20, 20, new int[] {0, 255, 255}, game, img);
  }

  public String toString() {
    return "KeyBad";
  }
  
  void draw(float hx, float hy, float hw, float hh) {
  //  this.image.get(0).resize(17, 0);
    image(this.image.get(0), hx, y, w, h);   
  }
  
}
