import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../models/prediction.dart';

Widget magicBall(BuildContext context, dynamic predictResult) {
  return RippleAnimation(
    color: Color.fromARGB(255, 127, 82, 191),
    delay: const Duration(milliseconds: 300),
    repeat: true,
    minRadius: 63,
    ripplesCount: 10,
    duration: const Duration(milliseconds: 7 * 300),
    child: SizedBox(
        width: _paddingX(context),
        height: _paddingX(context),
        child: Stack(
          children: [
            Image.asset('assets/images/magic-ball.png'),
            Center(
                child: GestureDetector(
              onTap: predictResult,
              child: Text('TAP HERE FOR ANSWER',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.merge(
                          TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Dina',
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade50,
                              shadows: const [
                            Shadow(
                                color: Color.fromARGB(255, 36, 0, 156),
                                offset: Offset(1.8, 1.7),
                                blurRadius: 4.2),
                            Shadow(
                                color: Color.fromARGB(255, 188, 188, 188),
                                offset: Offset(-1.5, 1.0),
                                blurRadius: 12.0),
                          ]))),
            ))
          ],
        )),
  );
}

// Media Query Calculations
double _paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .45;
  } else {
    return MediaQuery.of(context).size.height * .23;
  }
}

double _paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * 0.002;
  } else {
    return MediaQuery.of(context).size.height * .015;
  }
}
