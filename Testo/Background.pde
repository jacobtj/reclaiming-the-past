class Background extends GameObject {
  private ArrayList<PImage> img;
  private PImage imagee;
  private int repeat = 0;
  public Background(Game game, ArrayList<PImage> bgd) {
    super(0.0, 0.0, 0.0, 0.0, new int[] {0, 255, 0}, game, bgd);
    img = bgd;
    
    imagee = img.get(0); 
    
  }
  
  void draw(float hx, float hy, float hw, float hh) {
    image(imagee, x, y);
    image(imagee, x + imagee.width, y);
  }
}
