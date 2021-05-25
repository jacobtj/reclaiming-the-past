abstract class Button extends GameObject {
  float x;
  float y;
  float w;
  float h;
  boolean tint;
  //public boolean clicked = false;
  abstract void action();
  
  public Button(float bx, float by, float bw, float bh, Game game, ArrayList<PImage> img, boolean t) {  
    super(bx, by, bw, bh, new int[] {0, 255, 0}, game, img);
    this.x = bx;
    this.y = by;
    this.w = bw;
    this.h = bh; 
    tint = t;
  }
  
  void draw(float hx, float hy, float hw, float hh) {
    if (this.image.size() > 0) {
      if (tint) { 
        tint(255, 100);
      }
      image(this.image.get(0), hx, y, w, h);  
      
      noTint();
    }
  }
  
  void update(float dt) {
    if (clicked) {
      boolean xBool = mouseX > x && mouseX < x + w;
      boolean yBool = mouseY > y && mouseY < y + h;
      if (xBool && yBool) {
        action();
        System.out.print(clicked);
      }
    }
    super.update(dt);
  }
  
 
  
}
