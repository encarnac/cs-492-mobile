import 'package:flutter/material.dart';
import '../../models/job.dart';

class ResumeEntries extends StatelessWidget {
  // Job Model containing job details
  final Job job;

  const ResumeEntries({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _paddingX_P(context), vertical: _paddingY_P(context)),
        child: SizedBox(
          width: _paddingX_C(context),
          height: _paddingY_C(context),
          child: ListTile(
            title: Text(job.title.toUpperCase(),
                style: const TextStyle(color: Colors.deepPurple, fontSize: 16)),
            subtitle: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Text(job.company,
                            style: const TextStyle(fontWeight: FontWeight.w700))
                      ],
                    ),
                    Column(
                      children: [
                        Text(job.dates,
                            style: const TextStyle(fontWeight: FontWeight.w700))
                      ],
                    ),
                    Column(
                      children: [
                        Text(job.location,
                            style: const TextStyle(fontWeight: FontWeight.w700))
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          job.description,
                          textAlign: TextAlign.justify,
                        ))
                  ],
                ),
              ],
            ),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}

// Media Query Calculations
double _paddingX_P(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .001;
  } else {
    return MediaQuery.of(context).size.width * .012;
  }
}

double _paddingY_P(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .03;
  } else {
    return MediaQuery.of(context).size.height * .016;
  }
}

double _paddingX_C(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * 0.5;
  } else {
    return MediaQuery.of(context).size.width * 1.0;
  }
}

double _paddingY_C(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .26;
  } else {
    return MediaQuery.of(context).size.height * .17;
  }
}
