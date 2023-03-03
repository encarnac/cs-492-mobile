import 'package:flutter/material.dart';
import '../app.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    AppState? appState = context.findAncestorStateOfType<AppState>();

    final bool darkMode = appState!.darkMode;
    final void Function() updateDarkMode = appState.updateDarkMode;

    return Switch(
        // This bool value toggles the switch.
        value: darkMode,
        // activeColor:
        onChanged: (darkMode) {
          setState(() {
            updateDarkMode();
            darkMode = appState.darkMode;
          });
        });
  }
}
