class Background extends GameObject {
  private ArrayList<String> img;
  private PImage imagee;
  private int repeat = 0;
  public Background(Game game, ArrayList<String> bgd) {
    super(0.0, 0.0, 0.0, 0.0, new int[] {0, 255, 0}, game, bgd);
    img = bgd;
    
    imagee = loadImage(img.get(0)); 
    
  }
  
  void draw() {
    image(imagee, x, y);
    image(imagee, x + imagee.width, y);
  }
}
