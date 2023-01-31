import 'dart:io';
import 'planet.dart';
import 'planetary_system.dart';

class SpaceAdventure {
  final PlanetarySystem planetarySystem;

  SpaceAdventure({required this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on a space adventure!');
    if (planetarySystem.hasPlanets) {
      travel(setRoute(
          'Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Oh wait... there are no planets to explore.');
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!\n'
        'There are ${planetarySystem.numberOfPlanets} planets to explore.');
  }

  void printIntroduction(String name) {
    print('Nice to meet you, $name.\n'
        'My name is Colene and I will be your captain.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync() ?? '';
  }

  bool setRoute(String prompt) {
    String? answer;
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        break;
      }
      print('Sorry I didn\'t get that.');
    }
    return false;
  }

  void travel(bool randomDestination) {
    Planet planet;
    if (randomDestination) {
      planet = planetarySystem.randomPlanet();
    } else {
      planet = planetarySystem.chosenPlanet(
        responseToPrompt('Name the planet you would like to visit.'),
      );
    }
    travelToPlanet(planet);
  }

  void travelToPlanet(Planet planet) {
    print('Traveling to ${planet.name}...\n'
        'Arrived at ${planet.name}. ${planet.description}\n'
        'Anyway, have a good rest of your trip. Goodbye!');
  }
}
