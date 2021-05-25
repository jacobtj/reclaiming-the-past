class ButtNothing extends GameObject {
  
  public ButtNothing(Game game, float x, float y, float w, float h, int[] colors) {
    super(x, y, w, h, colors, game, null);
    this.hitbox[0].setActive(false);
    if (this.hitbox[1] != null) {
      this.hitbox[1].setActive(false);
    }
  }

  void draw(float hx, float hy, float hw, float hh) {
    fill(colors[0], colors[1], colors[2], colors[3]);
    rect(hx, hy, hw, hh);
    fill(0, 0, 0, 255);
  }

  void update(float dt) {

  }
}
