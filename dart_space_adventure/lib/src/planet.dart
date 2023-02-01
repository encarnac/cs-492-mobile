/// A single [Planet] amongst the [PlanetarySystem.planets].
///
/// The Planet has a [Planet.name] and [Planet.description] which can be constructed from a JSON object
/// passed to the [Planet.fromJson()] method or set to 'null' when no data is provided..
class Planet {
  final String name;
  final String description;

  Planet({required this.name, required this.description});

  // The name and description of this planet is null when not provided.
  Planet.nullPlanet()
      : name = 'null',
        description = 'null';

  // This [Planet.name] and [Planet.description] are set to its matching key's value
  // from the json object unless none is passed, in which case they are set to 'null'.
  factory Planet.fromJson(dynamic json) {
    if (json != null) {
      return Planet(
        name: json['name'] as String,
        description: json['description'] as String,
      );
    }
    return Planet.nullPlanet();
  }
}
