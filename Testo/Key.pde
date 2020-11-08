class Key extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  
  public Key(float x, float y, Game game) {
    super(x, y, 10, 10, new int[] {0, 255, 255}, game, new ArrayList<String>(Arrays.asList("images/platform.png")));
  }

  public String toString() {
    return "Key";
  }
  
}
