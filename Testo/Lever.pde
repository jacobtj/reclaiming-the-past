class Lever extends GameObject {

  protected Hitbox hitbox; 
  private Game game;
  protected MovingPlatform child;
  private boolean on;
  
  public Lever(float x, float y, MovingPlatform child, Game game) {
    super(x, y, 100, 100, new int[] {200, 200, 255}, game, new ArrayList<String>(Arrays.asList("images/platform.png")));
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
  
  public MovingPlatform getChild() {
    return this.child;
  }
  
  
}
