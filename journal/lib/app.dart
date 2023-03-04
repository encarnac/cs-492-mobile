import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/new_entry_screen.dart';
import 'screens/journal_screen.dart';
import 'package:intl/intl.dart';

class App extends StatefulWidget {
  final SharedPreferences preferences;

  const App({super.key, required this.preferences});

  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  // now = DateTime.now();
  final date = DateFormat.yMMMMEEEEd().format(DateTime.now());
  // Replace with data retrieved from database with query
  List<Map> get data => []; // switch b/w fakeData and data
  List<Map> get fakeData => [
        {
          "id": 1,
          "title": "A Post Title 1",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 2,
          "title": "A Post Title 2",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 3,
          "title": "A Post Title 3",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 4,
          "title": "A Post Title 4",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 5,
          "title": "A Post Title 5",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 6,
          "title": "A Post Title 6",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 7,
          "title": "A Post Title 7",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 8,
          "title": "A Post Title 8",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 9,
          "title": "A Post Title 9",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 10,
          "title": "A Post Title 10",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 11,
          "title": "A Post Title 11",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
        {
          "id": 12,
          "title": "A Post Title 12",
          "body":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis ut diam quam nulla porttitor massa. At elementum eu facilisis sed odio morbi quis commodo. Urna porttitor rhoncus dolor purus non enim praesent. Consectetur adipiscing elit duis tristique. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Tempus urna et pharetra pharetra massa massa ultricies mi. Aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin. Maecenas ultricies mi eget mauris. Faucibus et molestie ac feugiat sed lectus vestibulum.",
          "rating": 4,
          "date": date
        },
      ];

  static final routes = {
    JournalScreen.routeName: (context) => const JournalScreen(),
    NewEntryScreen.routeName: (context) => const NewEntryScreen(),
  };

  bool get darkMode => widget.preferences.getBool("darkMode") ?? false;

  void updateDarkMode() {
    setState(() {
      widget.preferences.setBool("darkMode", !darkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.teal,
      ),
      // home: const JournalScaffold(),
      routes: routes,
    );
  }
}
