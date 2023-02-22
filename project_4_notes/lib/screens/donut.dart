import 'package:flutter/material.dart';
import 'alpha.dart';
import 'beta.dart';

class Donut extends StatelessWidget {
  static const routeName = "donut";

  const Donut({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textPlaceholder(context),
          alphaButton(context),
          betaButton(context),
        ],
      ),
    );
  }

  void backToAlpha(BuildContext context) {
    Navigator.of(context).pushNamed(Alpha.routeName);
  }

  void backToBeta(BuildContext context) {
    Navigator.of(context).pushNamed(Beta.routeName);
  }

  Widget textPlaceholder(BuildContext context) {
    return Text('Donut', style: Theme.of(context).textTheme.displayLarge);
  }

  Widget alphaButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      )),
      onPressed: () => backToAlpha(context),
      child: const Text('Alpha'),
    );
  }

  Widget betaButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      )),
      onPressed: () => backToBeta(context),
      child: const Text('Beta'),
    );
  }
}
