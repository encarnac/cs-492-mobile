import 'package:flutter/material.dart';

Widget cardDescription(BuildContext context, String jobTitle) {
  return Text(
    jobTitle,
    style: Theme.of(context).textTheme.titleSmall,
  );
}
