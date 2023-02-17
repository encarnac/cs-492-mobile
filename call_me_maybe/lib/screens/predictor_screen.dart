import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../components/predictor_components.dart';
import '../models/prediction.dart';

class PredictorScreen extends StatefulWidget {
  const PredictorScreen({Key? key}) : super(key: key);

  @override
  PredictionState createState() {
    return PredictionState();
  }
}

class PredictionState extends State<PredictorScreen> {
  // Prediction Model to hold state
  final Prediction prediction = Prediction();

  // Randomly picks a new String answer
  void predictResult() {
    setState(() {
      prediction.predict();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.88,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Will I get a call back?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.merge(
                  const TextStyle(
                      fontFamily: 'Sofia Pro',
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 182, 182, 182),
                            offset: Offset(-10.2, 20.4),
                            blurRadius: 140.0),
                      ]),
                ),
          ),
          SizedBox(height: _paddingY(context)),
          Text(prediction.result,
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: _paddingY(context)),
          magicBall(context, predictResult),
        ],
      ),
    );
  }
}

// Media Query Calculations
double _paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .45;
  } else {
    return MediaQuery.of(context).size.height * .23;
  }
}

double _paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * 0.002;
  } else {
    return MediaQuery.of(context).size.height * .015;
  }
}
