import 'package:flutter/material.dart';
import '../screens.dart';

class AppTabController extends StatelessWidget {
  AppTabController({Key? key}) : super(key: key);

  // Profile info shared between screens
  static Map profileInfo = {
    'profileImg': 'assets/images/profile-img.png',
    'name': 'Colene Encarnado',
    'jobTitle': 'Aspiring Developer',
    'phone': '323-578-8030',
    'github': 'github.com/encarnac',
    'email': 'coleneenca@gmail.com',
  };

  static const tabs = [
    Icon(Icons.person),
    Icon(Icons.view_stream_rounded),
    Icon(Icons.contact_support),
  ];

  final screens = [
    CardScreen(profileInfo: profileInfo),
    ResumeScreen(profileInfo: profileInfo),
    const PredictorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Call Me Maybe",
              style: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Sofia Pro Light')),
          bottom: const TabBar(labelPadding: EdgeInsets.all(10), tabs: tabs),
        ),
        body: TabBarView(children: screens),
      ),
    );
  }
}
