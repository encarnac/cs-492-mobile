import 'package:flutter/material.dart';
import '../models/prediction.dart';

class PredictorScreen extends StatefulWidget {
  const PredictorScreen({Key? key}) : super(key: key);

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
      widthFactor: 0.9,
      heightFactor: 0.9,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Will I get a call back?',
              style: Theme.of(context).textTheme.headlineMedium),
          Text(prediction.result,
              style: Theme.of(context).textTheme.headlineSmall),
          GestureDetector(
            onTap: predictResult,
            child: const Text('Tap here for answer'),
          ),
        ],
      ),
    );
  }
}
