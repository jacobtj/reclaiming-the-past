class Key extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  
  public Key(float x, float y, Game game, ArrayList<String> img) {
    super(x, y, 20, 20, new int[] {0, 255, 255}, game, img);
  }

  public String toString() {
    return "Key";
  }
  
  void draw() {
  //  this.image.get(0).resize(17, 0);
    image(this.image.get(0), x, y, w, h);   
  }
  
}
