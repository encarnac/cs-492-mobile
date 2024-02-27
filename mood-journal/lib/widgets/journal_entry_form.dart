import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../db/journal_entry_dto.dart';
import '../db/database_manager.dart';
import '../screens/journal_screen.dart';
import 'dropdown_rating_form_field.dart';

class JournalEntryForm extends StatefulWidget {
  const JournalEntryForm({super.key});

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();

  // Used as a bucket to collect the title, body, date, rating.
  final journalEntryValues = JournalEntryValues();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 7),
            titleField(),
            const SizedBox(height: 10),
            bodyField(),
            const SizedBox(height: 10),
            ratingField(),
            const SizedBox(height: 10),
            formButtons(),
          ],
        ),
      ),
    );
  }

  Widget titleField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: "Title",
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)),
        floatingLabelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      onSaved: (value) {
        journalEntryValues.title = value.toString();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter title";
        } else {
          return null;
        }
      },
    );
  }

  Widget bodyField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: "Body",
        contentPadding: const EdgeInsets.all(8),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)),
        floatingLabelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      maxLines: 10,
      minLines: 10,
      onSaved: (value) {
        journalEntryValues.body = value.toString();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter body text";
        } else {
          return null;
        }
      },
    );
  }

  Widget ratingField() {
    return DropdownRatingFormField(
      maxRating: 4,
      onSaved: (value) {
        journalEntryValues.rating = value;
      },
      validator: (value) {
        if (value == null) {
          return "Please select a number";
        } else {
          return null;
        }
      },
    );
  }

  Widget formButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const Text("Cancel"),
        ),
        const SizedBox(width: 10.0),
        ElevatedButton(
          onPressed: () {
            // validate() calls each field's validator method and returns false if any fail
            if (formKey.currentState!.validate()) {
              String date = DateFormat.yMMMMEEEEd().format(DateTime.now());
              journalEntryValues.date = date;
              formKey.currentState?.save();
              final databaseManager = DatabaseManager.getInstance();
              databaseManager.saveJournalEntry(dto: journalEntryValues);
              print(journalEntryValues.toString());
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const JournalScreen()),
                (Route<dynamic> route) => false,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: const Text('Save Entry'),
        ),
      ],
    );
  }
}
