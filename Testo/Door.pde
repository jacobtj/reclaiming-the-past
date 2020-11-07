class Door extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  
  public Door(float x, float y, Game game) {
    super(x, y, 5.0, 30.0, new int[] {255, 0, 255}, game);
  }
  
  //let the player pass through the door if they have KEY
  void open(float dt) {
    super.update(dt);
  }
  
  public String toString() {
    return "Door";
  }
  
}
