import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await dotenv.load(fileName: "lib/.env");
  final dsnURL = dotenv.env['DSN'];
  await SentryFlutter.init(
    (options) => options.dsn = dsnURL,
    appRunner: () => runApp(const App()),
  );
}
