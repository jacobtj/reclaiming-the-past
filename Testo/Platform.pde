class Platform extends GameObject {

  protected Hitbox hitbox;
  private Game game;
  private float sprite_width = 300;
  private float sprite_height = 70;
  private float sprite_y = 1;
  private float sprite_x = 1;
  private int ref_width = 500 / 1;
  private static final int ref_height = 150;
  private static final float sink_depth = 3;
  private static final float left_cut = 10;
  private float dif_x = 0;
  private float dif_y = 0;
  private PImage new_image = createImage(200, 150, RGB);
  
  public Platform(float x, float y, float w, float h, Game game) {
    super(x, y, w, h < ref_height ? h : ref_height, new int[] {0, 0, 255}, game, new ArrayList<String>(Arrays.asList("images/platform.png")));
    
    if (h > ref_height) {
      h = ref_height;
    }
      
    float reverse = 0;
    float go_to = 1.5;
    float go_speed = 1;
    float go_from = 8;
    
    float go_to_v = 1;
    float go_speed_v = 1;
      
    for (PImage img : image) {
      img.resize(ref_width, ref_height);
      new_image.resize((int)w, (int)h);
      
      new_image.loadPixels();
      img.loadPixels();
      
      sprite_width = w;
      sprite_height = h;
      int count = 0;
      int layer = 0;
      for (int i = 0; i < new_image.pixels.length; i += 1) {
        new_image.pixels[i] = color(0, 01);
        if (count >= ref_width / go_to && count < sprite_width && w >= ref_width) {
            if (ref_width - 1 - (int)(ref_width / go_to - reverse) >= w - count) {
              go_speed = -1;
              if (reverse <= -ref_width + ref_width / go_to) {
                reverse = -ref_width + ref_width / go_to + 1;
              }
            } else {
              if (reverse > ref_width / go_to - ref_width / go_from) {
                reverse = ref_width / go_to - ref_width / go_from;
                go_speed *= -1;
              }
              if (reverse < 0) {
                reverse = 0;
                go_speed *= -1;
              }
            }
            new_image.pixels[i] = img.pixels[(int)(ref_width / go_to + layer * ref_width - reverse)];
            reverse += go_speed;
        } else if(count > sprite_width) { 
          count = 0;
          layer += go_speed_v;
          reverse = 0;
          i -= 1;
        }
        if (h < ref_height) {
          if (layer > h / 2) {
            go_speed_v = -1;
            layer = (int)(h / 2);
          }
          if (layer < 0) {
            layer = 0;
          }
        }
        if (w < ref_width) {
          if (count > w / 2) {
            reverse -= 2;
          }
          if (img.pixels[count + layer * ref_width] != 0) {
            new_image.pixels[i] = img.pixels[count + layer * ref_width + (int)reverse];
          }
        }
        if (count < ref_width / go_to && w >= ref_width) {
            if (img.pixels[count + layer * ref_width] != 0) {
             new_image.pixels[i] = img.pixels[count + layer * ref_width];
            }
        }
        count += 1;
      }
      
      new_image.updatePixels();
    }
    sprite_height = h;
    sprite_y = y;
    sprite_x =  x;
    sprite_width = w;
    
    setHeight(h - (h / sink_depth) * 2);
    setY(y + h / sink_depth);
    
    if (h < ref_height) {
      if (w <= ref_width) {
       // setWidth(w * (h / ref_height));
       // setX(x + (sprite_width - w * (h / ref_height)) / 2);
      } else {
       // setWidth(w * (h / ref_height));
       // setX(x + (sprite_width - w * (h / ref_height)) / 2);
      }
    }
    //if ((h < ref_height && w <= ref_width) || h >= ref_height) {
    setX(getX() + (ref_width / left_cut) / 2);
    setWidth(getWidth() - ref_width / left_cut);
    //}
    
    dif_x = getX() - sprite_x;
    dif_y = getY() - sprite_y;
    
   // getHitbox().update(getX(), getY(), getWidth(), getHeight());
  }
  
  //update the position of the platform over time (but only implemented for moving platform...)
  void update(float dt) {
    super.update();
  }
  
  public void drawPlatform(float hx, float hy, float hw, float hh) {
    image(new_image, hx - dif_x, y - dif_y, sprite_width, sprite_height);
  }
  
  public String toString() {
    return "Platform";
  }
  
}
