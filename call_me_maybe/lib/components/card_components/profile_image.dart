import 'package:flutter/material.dart';

Widget profileImage(String imageURI) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(imageURI),
          ),
        ),
      ],
    ),
  );
}
