class Lever extends GameObject {

  protected Hitbox hitbox; 
  private Game game;
  protected Moving_Platform child;
  private boolean on;
  
  public Lever(float x, float y, Moving_Platform child, Game game) {
    super(x, y, 10, 10, new int[] {100, 100, 255}, game, new ArrayList<String>(Arrays.asList("images/platform.png")));
    this.child = child;
    this.on = false;
  }

  public String toString() {
    return "Lever";
  }
  
  public void flip() {
    this.on = !this.on;
  }
  
  public boolean status() {
    return this.on;
  }
  
  public Moving_Platform getChild() {
    return this.child;
  }
  
}
