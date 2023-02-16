import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/card_components.dart';

class CardScreen extends StatelessWidget {
  final Map profileInfo;

  const CardScreen({Key? key, required this.profileInfo}) : super(key: key);

  GestureDetector launchContact(String uriText, Uri uriPath) {
    return GestureDetector(
      onTap: () => launchUrl(uriPath),
      child: Text(uriText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 9.0,
        children: [
          cardImage(context, profileInfo['profileImg']),
          cardName(context, profileInfo['name']),
          cardDescription(context, profileInfo['jobTitle']),
          cardContactDetails('sms', profileInfo['phone']),
          Row(
            children: [
              cardContactDetails('http', profileInfo['github']),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              cardContactDetails('email', profileInfo['email']),
            ],
          )
          // profileContactInfo(context, profileInfo),
        ],
      ),
    );
  }
}
