import 'dart:math';
import 'planet.dart';

/// A named [PlanetarySystem] consisting of a list of [Planet] objects.
///
/// The [PlanetarySytem] has a [.name] and [.planets] which can
/// be constructed from a JSON object passed to the [PlanetarySystem.fromJson()] method or set to
/// its default values if no valid JSON is passed is passed.
/// This can confirm it has a list of [Planet]s by returning a boolean from [PlanetarySystem.hasPlanets],
/// and the specific number can be returned with [PlanetarySystem.numberOfPlanets].
/// A random [Planet] can be returned using [PlanetarySystem.randomPlanet()] or a specific one can be
/// selected by passing a [Planet.name] to [PlanetarySystem.chosenPlanet()].
class PlanetarySystem {
  // Stores an itianlized Random seed so subsequent calls do not repeat.
  final Random _random = Random();
  final String name;
  final List<Planet> planets;

  PlanetarySystem({this.name = 'Unnamed System', this.planets = const []});

  // The json passed must have 'name' and 'planets' key or else this will have the default attribute values.
  // The String value of the 'name' key is saved to this [PlanetarySystem.name].
  // Each planet value from the 'planets' key is initialized into a Planet object
  // and then saved to a new list in [PlanetarySystem.planets].
  factory PlanetarySystem.fromJson(dynamic json) {
    if (json['name'] != null && json['planets'] != null) {
      // The value of the 'planets' key is converted to a list.
      var planetsJson = json['planets'] as List;

      // A new list is created to hold future Planet objects.
      var planetData = <Planet>[];

      // Each planet is mapped to the [Planet] constructor before being saved to the new list.
      planetData.addAll(
        planetsJson.map(
          (planet) => Planet.fromJson(planet),
        ),
      );
      // The String value from the json and the new list is used.
      return PlanetarySystem(
        name: json['name'] as String,
        planets: planetData,
      );
    } else {
      // This is constructed with default values since the json did not have the keys.
      return PlanetarySystem();
    }
  }

  // Confirms that this PlanetarySystem does not have a list of Planets.
  bool get hasPlanets => planets.isNotEmpty;

  // Returns the number of Planets in the planets list.
  int get numberOfPlanets => planets.length;

  // The Planet at a random integer in this PlanetarSystem's planets is returned.
  Planet randomPlanet() {
    if (!hasPlanets) return Planet.nullPlanet();
    return planets[_random.nextInt(planets.length)];
  }

  // The Planet in this planets list matching the passed name is returned.
  Planet chosenPlanet(String name) {
    return planets.firstWhere(
      (planet) => planet.name == name,
      orElse: () => Planet.nullPlanet(),
    );
  }
}
