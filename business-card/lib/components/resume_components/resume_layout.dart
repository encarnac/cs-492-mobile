import 'package:flutter/material.dart';
import '../resume_components.dart';

Widget resumeLayout(
    BuildContext context, AsyncSnapshot<List> snapshot, dynamic profileInfo) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: _paddingX(context),
            vertical: _paddingY(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top header containing the name, email, and GitHub link
              resumeHeader(context, profileInfo),
              // Passes each job item to create multiple card Widgets
              for (var job in snapshot.data!) ResumeEntries(job: job)
            ],
          ),
        ),
      );
    },
  );
}

// Media Query Calculations
double _paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * .06;
  } else {
    return MediaQuery.of(context).size.width * .04;
  }
}

double _paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .03;
  } else {
    return MediaQuery.of(context).size.height * .02;
  }
}
