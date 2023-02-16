import 'package:flutter/material.dart';

Widget cardName(BuildContext context, String name) {
  return Text(
    name,
    style: Theme.of(context).textTheme.titleLarge,
  );
}
