import 'package:flutter/material.dart';
import 'alpha.dart';
import 'donut.dart';

class Beta extends StatelessWidget {
  static const routeName = "beta";

  const Beta({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textPlaceholder(context),
          alphaButton(context),
          donutButton(context),
        ],
      ),
    );
  }

  // void backToAlpha(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => Alpha()),
  //   );
  // }
  void backToAlpha(BuildContext context) {
    Navigator.of(context).pop();
  }

  void pushDonut(BuildContext context) {
    Navigator.of(context).pushNamed(Donut.routeName);
  }

  Widget textPlaceholder(BuildContext context) {
    return Text('Beta', style: Theme.of(context).textTheme.displayLarge);
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
