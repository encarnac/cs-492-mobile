import 'package:flutter/material.dart';

Widget resumeEntry(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: const [Text('Job Title')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [Text('Company')],
                  ),
                  Column(
                    children: [Text('Dates')],
                  ),
                  Column(
                    children: [Text('Location')],
                  )
                ],
              ),
              Row(
                children: const [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                        textAlign: TextAlign.justify,
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
