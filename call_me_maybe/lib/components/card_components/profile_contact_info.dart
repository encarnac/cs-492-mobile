import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget profileContactInfo(
  BuildContext context,
  String phone,
  String github,
  String email,
) {
  // Creates URIs for the contact values for launching
  final Uri phoneUri = Uri.parse('sms:$phone');
  final Uri githubUri = Uri.parse('https://$github/');
  final Uri emailUri =
      Uri.parse('mailto:$email?subject=News&body=New%20plugin');

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [launchContact(phone, phoneUri)]),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [launchContact(github, githubUri)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [launchContact(email, emailUri)],
            ),
          ),
        ],
      ),
    ],
  );
}

GestureDetector launchContact(String uriText, Uri uriPath) {
  return GestureDetector(
    onTap: () => launchUrl(uriPath),
    child: Text(uriText),
  );
}
