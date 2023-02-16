import 'package:flutter/material.dart';

Widget cardImage(BuildContext context, String profileImg) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: SizedBox(
      width: padding(context),
      height: padding(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300.0),
        child: Image.asset(profileImg),
      ),
    ),
  );
}

double padding(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .3;
  } else {
    return MediaQuery.of(context).size.height * .2;
  }
}
