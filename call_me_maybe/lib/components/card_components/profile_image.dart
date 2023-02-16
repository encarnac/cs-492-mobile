import 'package:flutter/material.dart';

Widget profileImage(String imageURI) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(imageURI),
          ),
        ),
      ],
    ),
  );
}
