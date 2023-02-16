import 'package:flutter/material.dart';
import '../components/card_components.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String imageURI = 'assets/images/Image001.png';
    const String name = 'Nelly Song';
    const String jobTitle = 'Self-taught Programmer';
    const String phone = '777-777-7777';
    const String github = 'github.com/nelsong';
    const String email = 'nelsong@gmail.com';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileImage(imageURI),
        profileName(context, name),
        profileTitle(context, jobTitle),
        profileContactInfo(context, phone, github, email),
      ],
    );
  }
}
