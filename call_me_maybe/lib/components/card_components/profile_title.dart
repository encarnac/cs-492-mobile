import 'package:flutter/material.dart';

Widget profileTitle(BuildContext context, String jobTitle) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      // FIX: JOB TITLE (HEADER STYLE, CENTER)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          jobTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    ),
  );
}
