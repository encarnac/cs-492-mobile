import 'dart:convert';
import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';

/// Prompts the user to pick a planet to travel to from the planetary system in a JSON file.
///
/// Creates a [PlanetarySystem] by reading and initializing the JSON file located at the passed file path.
/// Prompts the user to either select a random or specific [Planet] from the [PlanetarySystem.planets] to
/// travel to and print a brief fun fact about.
void main(List<String> arguments) async {
  // Locates the JSON file passed as an argument and converts it to a String.
  final planetarySystemData = await File(arguments[0]).readAsString();

  // Parses the JSON string to create a <Map<String, dynamic>> object for constructing a [PlanetarySystem]
  // and starting the instructions for traveling.
  SpaceAdventure(
    planetarySystem: PlanetarySystem.fromJson(
      jsonDecode(planetarySystemData),
    ),
  ).start();
}
