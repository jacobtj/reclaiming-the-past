import processing.sound.*;
class MusicHandler {
  private SoundFile currentSong;
  private Game game;
  
  public MusicHandler(Game game) {
    this.game = game;
  }
  
  public void playSong(SoundFile song, boolean loop) {
    if (currentSong != null) {
      if (currentSong.isPlaying()) {
        currentSong.stop();
      }
    }
    if (song == null) {
      return;
    }
    currentSong = song;
    currentSong.play();
    if (loop) {
      currentSong.loop();
    }
  }
}
