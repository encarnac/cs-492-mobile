import "package:flutter/material.dart";

class JournalEntryFields {
  // Intermediate data transfer object (DTO)
  late String title;
  late String body;
  late DateTime dateTime;
  late int rating;

  @override
  String toString() {
    return "Title: $title, Body: $body, Time: $dateTime, Rating: $rating";
  }
}

class JournalEntryForm extends StatefulWidget {
  JournalEntryForm({super.key});

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // Required to provide a means of obtaining the underlying FormState object managed by the widget
  final formKey = GlobalKey<FormState>();

  // Used as a bucket to collect the values for each field
  final journalEntryFields = JournalEntryFields();

  // HINT: Use FormField<> to create rating system
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Each form field is responsible for its own save and validation methods
            // by accessing the underlying Formstate
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "Title", border: OutlineInputBorder()),
              onSaved: (value) {
                // Store value in an object
                //
              },
              validator: (value) {
                // Returns null if data is acceptable or else a string
                if (value!.isEmpty) {
                  return "Please enter a title";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // validate() calls each field's validator method and returns false if any fail
                if (formKey.currentState!.validate()) {
                  formKey.currentState?.save();
                  // Complete save by transferring to database for data persistence
                  // Database.of(conext).saveJournalEntry(journalEntryFields);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save Entry'),
            ),
          ],
        ),
      ),
    );
  }
}
