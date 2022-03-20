/**
 * Written by Nobuharu Shimazu
 * Date: 2022/3/20
 * 
 * Pattern: Facade
 * (I love watching movies at HOME.)
 */

void main() {
  var popper = PopcornPopper();
  var screen = Screen();
  var lights = TheaterLights();
  var tuner = Tuner();
  var projector = Projector();
  var player = Player();
  var amplifier = Amplifier();

  HomeTheaterFacade homeTheater = HomeTheaterFacade(
    amplifier, tuner, player,
    projector, lights, screen, popper);
  
  homeTheater.watchMovie("The Accountant");
  print("\nThat was a good movie indeed!\n");
  homeTheater.endMovie();
}

/**
 * The Facade for the home theater components
 */
class HomeTheaterFacade {
  final Amplifier amplifier;
  final Tuner tuner;
  final Player player;
  final Projector projector;
  final TheaterLights lights;
  final Screen screen;
  final PopcornPopper popper;

  HomeTheaterFacade(
    this.amplifier,
    this.tuner,
    this.player,
    this.projector,
    this.lights,
    this.screen,
    this.popper
  );

  void watchMovie(String movie) {
    popper.on();
    popper.pop();
    lights.dim(15);
    screen.down();
    projector.on();
    projector.wideScreenMode();
    amplifier.on();
    amplifier.setPlayer(player);
    amplifier.setTuner(tuner);
    amplifier.setVolume(60);
    player.on();
    player.play(movie);
  }

  void endMovie() {
    popper.off();
    lights.off();
    screen.up();
    projector.off();
    amplifier.off();
    player.stop();
    player.off();
  }
}

// ================ HOME THEATER COMPONENTS =================
class Amplifier {
  late Tuner tuner;
  late Player player;

  void setTuner(Tuner tuner) => this.tuner = tuner;
  void setPlayer(Player player) => this.player = player;
  void setVolume(int volume) => print("Amplifier setting volume to $volume");
  void on() => print("Amplifier On");
  void off() => print("Amplifier Off");
}

class Player {
  late Amplifier amplifier;
  
  void setAmp(Amplifier amplifier) => this.amplifier = amplifier;
  void on() => print("Player On");
  void off() => print("Player Off");
  void play(String movie) => print("Player playing '$movie'");
  void pause() => print("Player pausing");
  void stop() => print("Player stopping");
}

class Projector {
  late Player player;

  void on() => print("Projector On");
  void off() => print("Projector Off");
  void wideScreenMode() => print("Projector in wide screen mode");
  void normalMode() => print("Projector in normal mode");
}

class Tuner {
  late Amplifier amplifier;

  void on() => print("Tuner On");
  void off() => print("Tuner Off");
  void setAmp(Amplifier amplifier) => this.amplifier = amplifier;
}

class TheaterLights {
  void on() => print("Theater lights On");
  void off() => print("Theater lights Off");
  void dim(int percent) => print("Theater lights dimming to $percent%");
}

class Screen {
  void up() => print("Theater screen going Up");
  void down() => print("Theater screen going Down");
}

class PopcornPopper {
  void on() => print("Popper On");
  void off() => print("Popper Off");
  void pop() => print("Pop, pop, pop!");
}