class Game {
  Player player;
  private ArrayList<Hitbox> allHitboxes;
  
  public Game() {
    allHitboxes = new ArrayList<Hitbox>();
    player = new Player(width / 2, height / 2, this); 
  }
  
  void update(float dt) {
    player.update(dt);
  }
  
  public void addHitbox(Hitbox hitbox) {
    allHitboxes.add(hitbox);
  }
  
  void draw() {
    for (int i = 0; i < allHitboxes.size(); i += 1) {
      allHitboxes.get(i).draw();
    }
  }
  
}
