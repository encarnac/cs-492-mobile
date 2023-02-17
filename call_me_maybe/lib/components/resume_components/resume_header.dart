import 'package:flutter/material.dart';

Widget resumeHeader(BuildContext context, Map profileInfo) {
  return Padding(
    padding:
        EdgeInsets.symmetric(vertical: 8.0, horizontal: _paddingX(context)),
    child: Wrap(
      direction: Axis.vertical,
      spacing: 1.2,
      children: [
        Text(profileInfo['name'],
            style: Theme.of(context).textTheme.headlineSmall?.merge(
                const TextStyle(
                    fontFamily: 'Dina',
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.deepPurpleAccent))),
        Text(profileInfo['email'],
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.merge(const TextStyle(letterSpacing: 1.4))),
        Text(profileInfo['github'],
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.merge(const TextStyle(letterSpacing: 1.4))),
      ],
    ),
  );
}

double _paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * .01;
  } else {
    return MediaQuery.of(context).size.width * .02;
  }
}
