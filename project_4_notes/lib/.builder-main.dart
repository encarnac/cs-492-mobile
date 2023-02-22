import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MainApp());
}

/// Problem: The .of(context) MUST have a different context than the builder
/// because Scaffold's context is searching for a scaffold above it to raise to.
///
///OPTION 1 = Build your own widget / Separate closure with its own build function
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Material Apps",
//       theme: ThemeData(primarySwatch: Colors.brown),
//       home: Scaffold(
//         appBar: AppBar(title: Text("Adaptive Layouts")),
//         body: const Center(child: Text('Builder Demo')),
//         floatingActionButton: SnackFab(),
//       ),
//     );
//   }
// }

// class SnackFab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(onPressed: () {
//       Scaffold.of(context)
//           .showSnackBar(const SnackBar(content: Text('SNAAACKS')));
//     });
//   }
// }

/// Problem: The .of(context) MUST have a different context than the builder
/// because Scaffold's context is searching for a scaffold above it to raise to.
///
/// Option 2 = Use the builder context of the Scaffold using a builder
///   - Similar to wrapping the build function with no way of defining it
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Apps",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(title: const Text("Adaptive Layouts")),
        body: const Center(child: Text('Builder Demo')),
        floatingActionButton: Builder(builder: (context) {
          // Invoked later after the first build is done
          return FloatingActionButton(onPressed: () {
            Scaffold.of(context)
                .showSnackBar(const SnackBar(content: Text('SNAAACKS')));
          });
        }),
      ),
    );
  }
}
