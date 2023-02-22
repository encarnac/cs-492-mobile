import 'package:flutter/material.dart';
import 'beta.dart';
import 'donut.dart';

class Alpha extends StatelessWidget {
  static const routeName = "/";

  const Alpha({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textPlaceholder(context),
          betaButton(context),
          donutButton(context),
        ],
      ),
    );
  }

  // void pushBeta(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => Beta()),
  //   );
  // }
  void pushBeta(BuildContext context) {
    Navigator.of(context).pushNamed(Beta.routeName);
  }

  void pushDonut(BuildContext context) {
    Navigator.of(context).pushNamed(Donut.routeName);
  }

  Widget textPlaceholder(BuildContext context) {
    return Text('Alpha', style: Theme.of(context).textTheme.displayLarge);
  }

  Widget betaButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      )),
      onPressed: () => pushBeta(context),
      child: const Text('Beta'),
    );
  }

  Widget donutButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      )),
      onPressed: () => pushDonut(context),
      child: const Text('Donut'),
    );
  }
}
