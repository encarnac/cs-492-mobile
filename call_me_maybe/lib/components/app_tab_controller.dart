import 'package:flutter/material.dart';
import '../screens.dart';

class AppTabController extends StatelessWidget {
  static const tabs = [
    Icon(
      Icons.person,
    ),
    Icon(
      Icons.view_stream_rounded,
    ),
    Icon(
      Icons.contact_support,
    ),
  ];

  final screens = [
    CardScreen(),
    ResumeScreen(),
    PredictorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Call Me Maybe'),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(children: screens),
      ),
    );
  }
}
