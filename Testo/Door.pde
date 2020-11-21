class Door extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  
  public Door(float x, float y, Game game, ArrayList<String> img) {
    super(x, y, 60.0, 70.0, new int[] {255, 0, 255}, game, img);
  }
  
  //let the player pass through the door if they have KEY
  void open(float dt) {
    super.update();
  }
  
  public String toString() {
    return "Door";
  }
  
    void draw(float hx, float hy, float hw, float hh) {
   // this.image.get(0).resize(40, 0);
    image(this.image.get(0), hx, y, w, h);
  }
  
}
