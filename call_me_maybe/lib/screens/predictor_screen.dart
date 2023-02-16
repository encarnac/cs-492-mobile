import 'package:flutter/material.dart';
import '../models/prediction.dart';
// import '../models/call_prediction.dart';

// Turn into Stateful Widget
// final prediction = callPrediction();
// class PredictorScreen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext build) {
//     return Container(
//       child: const Text('3'),
//     );
//   }
// }

class PredictorScreen extends StatefulWidget {
  @override
  PredictionState createState() {
    return PredictionState();
  }
}

class PredictionState extends State<PredictorScreen> {
  final Prediction prediction = Prediction();

  void predictResult() {
    setState(() {
      prediction.predict();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Will I get a call back?',
              style: Theme.of(context).textTheme.titleLarge),
          Text(prediction.result),
          GestureDetector(
            onTap: predictResult,
            child: SizedBox(
              width: 120,
              height: 120,
              child: Image.asset('assets/images/magic-wand.png'),
            ),
          ),
        ],
      ),
    );
  }
}
