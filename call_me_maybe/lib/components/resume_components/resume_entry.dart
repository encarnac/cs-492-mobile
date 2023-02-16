import 'package:flutter/material.dart';
import '../../models/job.dart';

class ResumeEntries extends StatelessWidget {
  final Job job;

  const ResumeEntries({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // obviously this can be any widget you want
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: _paddingY(context)),
        child: SizedBox(
          width: _paddingX(context),
          height: _paddingY(context),
          child: ListTile(
            title: Text(job.title),
            subtitle: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text(job.company)],
                    ),
                    Column(
                      children: [Text(job.dates)],
                    ),
                    Column(
                      children: [Text(job.location)],
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child:
                            Text(job.description, textAlign: TextAlign.justify))
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

double _paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * .99;
  } else {
    return MediaQuery.of(context).size.width * 1.0;
  }
}

double _paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .3;
  } else {
    return MediaQuery.of(context).size.height * .16;
  }
}












// import 'package:flutter/material.dart';
// import '../../models/job.dart';

// class ResumeEntries extends StatelessWidget {
//   final Job job;

//   const ResumeEntries({Key? key, required this.job}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // obviously this can be any widget you want
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Row(
//                   children: [Text(job.title)],
//                 ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       children: [Text(job.company)],
                //     ),
                //     Column(
                //       children: [Text(job.dates)],
                //     ),
                //     Column(
                //       children: [Text(job.location)],
                //     )
                //   ],
                // ),
                // Row(
                //   children: [
                //     Flexible(
                //         fit: FlexFit.tight,
                //         child:
                //             Text(job.description, textAlign: TextAlign.justify))
                //   ],
                // ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
