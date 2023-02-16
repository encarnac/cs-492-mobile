import 'package:flutter/material.dart';
import '../components/card_components.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String imageURI = 'assets/images/Image001.png';
    const String name = 'Colene Encarnado';
    const String jobTitle = 'Aspiring Developer';
    const String phone = '323-578-8030';
    const String github = 'github.com/encarnac';
    const String email = 'coleneenc@gmail.com';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        profileImage(imageURI),
        profileName(context, name),
        profileTitle(context, jobTitle),
        profileContactInfo(context, phone, github, email),
      ],
    );
  }
}
