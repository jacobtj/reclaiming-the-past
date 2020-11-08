class Door extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  
  public Door(float x, float y, Game game) {
    super(x, y, 10.0, 60.0, new int[] {255, 0, 255}, game);
  }
  
  public String toString() {
    return "Door";
  }
  
}
