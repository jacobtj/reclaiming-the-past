class Background extends GameObject {
  private PImage img;
  public Background(Game game, ArrayList<String> bgd) {
    super(0.0, 0.0, 0.0, 0.0, new int[] {0, 255, 0}, game, bgd);
    img = loadImage(bgd.get(0));
  }
  
  void draw() {
    image(img, x, y);
  }
}
