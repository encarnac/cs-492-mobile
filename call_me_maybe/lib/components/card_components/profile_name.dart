import 'package:flutter/material.dart';

Widget profileName(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      // FIX: NAME (HEADER STYLE, CENTER)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    ),
  );
}
