class Platform extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  
  public Platform(float x, float y, float w, float h, Game game) {
    super(x, y, w, h, new int[] {0, 0, 255}, game);
  }
  
  //update the position of the platform over time (but only implemented for moving platform...)
  void update(float dt) {
    super.update(dt);
  }
  
  public String toString() {
    return "Platform";
  }
  
}
