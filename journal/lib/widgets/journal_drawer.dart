import 'package:flutter/material.dart';
import 'theme_switch.dart';

class JournalDrawer extends StatelessWidget {
  const JournalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        minimum: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Settings', style: Theme.of(context).textTheme.headlineSmall),
            const Divider(thickness: 0.9),
            const ListTile(
                leading: Icon(Icons.brightness_6),
                trailing: ThemeSwitch(),
                title: Text('Dark Mode')),
          ],
        ),
      ),
    );
  }
}
