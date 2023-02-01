import 'dart:convert';
import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';

/// Prompts the user to pick a planet to travel to from the planetary system in a JSON file.
///
/// Creates a [PlanetarySystem] by reading and initializing the JSON file named as an argument.
/// Passes this to [SpaceAdventure] as the options for the user to travel to.
void main(List<String> arguments) async {
  // Locates the JSON file passed as an argument and converts it to a String.
  final planetarySystemData = await File(arguments[0]).readAsString();

  // Parses the JSON string to create a <Map<String, dynamic>> object for constructing a [PlanetarySystem]
  // and starting the prompts to travel.
  SpaceAdventure(
    planetarySystem: PlanetarySystem.fromJson(
      jsonDecode(planetarySystemData),
    ),
  ).start();
}
