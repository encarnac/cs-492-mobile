import 'dart:io';
import 'planet.dart';
import 'planetary_system.dart';

/// The user is prompted for their name and a [Planet] from [PlanetarySystem] to travel to.
///
/// The [PlanetarySystem] is introduced [printIntroduction()] before the user is prompted
/// [responseToPrompt()] for their name and greeted [printGreeting()].
/// The user picks [responseToPrompt()] whether to go to a random [Planet] or
/// name a specific one [setRoute()] before traveling to it [travelToPlanet()]
/// and reading its [Planet.description].
class SpaceAdventure {
  final PlanetarySystem planetarySystem;

  SpaceAdventure({required this.planetarySystem});

  void start() {
    printIntroduction();
    printGreeting(responseToPrompt('What is your name?'));
    print('Let\'s go on a space adventure!');
    if (planetarySystem.hasPlanets) {
      travel(setRoute(
          'Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Oh wait... there are no planets to explore.');
    }
  }

  void printIntroduction() {
    print('Welcome to the ${planetarySystem.name}!\n'
        'There are ${planetarySystem.numberOfPlanets} planets to explore.');
  }

  void printGreeting(String name) {
    print('Nice to meet you, $name.\n'
        'My name is Colene and I will be your captain.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync() ?? '';
  }

  // Whether the user wants to name a [Planet] to set a specific route
  // or go to a random one in [PlanetarySystem.planets].
  bool setRoute(String prompt) {
    String? answer;
    // Continues to prompt user until valid answer given.
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

  // Determines where to travel to depending on whether a set route
  // or random destination was chosen.
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
