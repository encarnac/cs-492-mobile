import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget cardContactDetails(String type, String contactInfo) {
  Uri contactUri;
  if (type == "sms") {
    contactUri = Uri.parse("sms:$contactInfo");
  } else if (type == "http") {
    contactUri = Uri.parse("https://$contactInfo/");
  } else {
    contactUri =
        Uri.parse("mailto:$contactInfo?subject=News&body=New%20plugin");
  }

  return GestureDetector(
    onTap: () => launchUrl(contactUri),
    child: Text(contactInfo),
  );
}
