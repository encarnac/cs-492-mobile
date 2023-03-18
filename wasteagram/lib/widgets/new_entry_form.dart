import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../models/new_entry_dto.dart';

class NewEntryForm extends StatefulWidget {
  final File? image;

  const NewEntryForm({Key? key, @required this.image}) : super(key: key);

  @override
  State<NewEntryForm> createState() => _NewEntryFormState();
}

class _NewEntryFormState extends State<NewEntryForm> {
  final formKey = GlobalKey<FormState>();
  final newEntryValues = NewEntryValues();
  Position? locationData;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Position position = await _getLocation();
    setState(() {
      locationData = position;
    });
  }

  Future<Position> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    // Check for permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request permissions.");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(widget.image!),
            const SizedBox(height: 10),
            itemCountField(),
            const SizedBox(height: 10),
            postButton(),
          ],
        ),
      ),
    );
  }

  Widget itemCountField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: "Number of Wasted Items",
        border: const UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary)),
        floatingLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onSaved: (value) {
        newEntryValues.itemCount = int.parse(value!);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter a number";
        } else {
          return null;
        }
      },
    );
  }

  Widget postButton() {
    return SizedBox(
      width: getWidthOf(context),
      height: MediaQuery.of(context).size.width * .2,
      child: ElevatedButton(
          onPressed: () {
            // validate() calls each field's validator method and returns false if any fail
            if (formKey.currentState!.validate()) {
              String date = DateFormat.yMMMMEEEEd().format(DateTime.now());
              newEntryValues.date = date;
              if (locationData != null) {
                newEntryValues.longitude = locationData!.latitude;
                newEntryValues.longitude = locationData!.longitude;
                print(locationData!.latitude);
                print(locationData!.longitude);
              }
              formKey.currentState?.save();
              Navigator.of(context).pop();
              // final databaseManager = DatabaseManager.getInstance();
              // databaseManager.saveJournalEntry(dto: journalEntryValues);
              // print(journalEntryValues.toString());
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => const JournalScreen()),
              //   (Route<dynamic> route) => false,
              // );
            }
          },
          child: const Icon(Icons.backup, size: 100.0)),
    );
  }

  double getWidthOf(context) {
    return MediaQuery.of(context).size.width;
  }
}
