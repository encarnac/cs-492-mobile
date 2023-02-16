import 'package:flutter/material.dart';

Widget resumeHeader(BuildContext context, Map profileInfo) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: _paddingY(context), horizontal: _paddingX(context)),
    child: Wrap(
      direction: Axis.vertical,
      spacing: 1.5,
      children: [
        Text(profileInfo['name'],
            style: Theme.of(context).textTheme.headlineSmall),
        Text(profileInfo['email'],
            style: Theme.of(context).textTheme.titleMedium),
        Text(profileInfo['github'],
            style: Theme.of(context).textTheme.titleSmall),
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

double _paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .022;
  } else {
    return MediaQuery.of(context).size.height * .01;
  }
}
