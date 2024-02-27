import 'package:flutter/material.dart';
import '../components/card_components.dart';

class CardScreen extends StatelessWidget {
  final Map profileInfo;

  const CardScreen({Key? key, required this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 8,
        margin: EdgeInsets.symmetric(
            horizontal: _paddingX(context), vertical: _paddingY(context)),
        shadowColor: const Color.fromARGB(95, 65, 22, 144),
        color: const Color.fromRGBO(236, 239, 241, 0.9),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 6.0,
          children: [
            cardImage(context, profileInfo['profileImg']),
            Text(profileInfo['name'],
                style: Theme.of(context).textTheme.headlineLarge?.merge(
                    const TextStyle(
                        fontFamily: 'Dina',
                        fontSize: 28,
                        color: Colors.deepPurpleAccent))),
            Text(profileInfo['jobTitle'],
                style: Theme.of(context).textTheme.titleMedium?.merge(
                    const TextStyle(
                        letterSpacing: 1.0, color: Colors.deepPurple))),
            cardContactDetails('sms', profileInfo['phone']),
            Row(
              children: [
                cardContactDetails('http', profileInfo['github']),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                cardContactDetails('email', profileInfo['email']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

double _paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .56;
  } else {
    return MediaQuery.of(context).size.height * .01;
  }
}

double _paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * .00001;
  } else {
    return MediaQuery.of(context).size.width * .36;
  }
}
