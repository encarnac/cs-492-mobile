import 'package:flutter/material.dart';

Widget resumeHeader(BuildContext context, Map profileInfo) {
  return Wrap(
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
  );
}
