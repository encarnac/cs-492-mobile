import 'dart:math';

class Prediction {
  final Random _random = Random();
  final List<String> options = [
    "No shot. Forget it.",
    "It's highly unlikely.",
    "Don't get your hopes up.",
    "It could go both ways.",
    "Maybe yes, maybe no?",
    "Most likely yes.",
    "You got this for sure!",
    "Duh! Of course!"
  ];
  String result;

  Prediction({this.result = " "});

  void predict() {
    result = options[_random.nextInt(options.length)];
  }
}
