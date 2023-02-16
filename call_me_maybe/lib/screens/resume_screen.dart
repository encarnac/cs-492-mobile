import 'package:flutter/material.dart';
import '../components/resume_components.dart';

class ResumeScreen extends StatelessWidget {
  final Map profileInfo;

  const ResumeScreen({Key? key, required this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: paddingX(context),
        vertical: paddingY(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          resumeHeader(context, profileInfo),
          resumeEntry(context),
        ],
      ),
    );
  }
}

double paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .14;
  } else {
    return MediaQuery.of(context).size.height * .03;
  }
}

double paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .06;
  } else {
    return MediaQuery.of(context).size.height * .03;
  }
}
