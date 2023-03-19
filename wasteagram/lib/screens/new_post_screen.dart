import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import '../layouts/app_scaffold.dart';
import '../models/new_entry_dto.dart';

class NewPostScreen extends StatefulWidget {
  static const routeName = "new-entry";

  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final formKey = GlobalKey<FormState>();
  final newEntryValues = NewEntryValues();
  final picker = ImagePicker();

  File? image;
  Position? locationData;

  @override
  void initState() {
    super.initState();
    getImage();
    // setState(() {});
  }

  void getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      cancelNewPost();
    }
  }

  void cancelNewPost() {
    Navigator.pushNamed(context, '/');
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
    return AppScaffold(
      title: "New Post",
      body: newEntryForm(),
      button: postButton(),
    );
  }

  Widget newEntryForm() {
    if (image == null) {
      return const CircularProgressIndicator();
    } else {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: getHeightOf(context),
          horizontal: getWidthOf(context),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.file(
                image!,
                width: getMaxWidthOf(context),
                height: MediaQuery.of(context).size.width * .85,
              ),
              const SizedBox(height: 5),
              itemCountField(),
            ],
          ),
        ),
      );
    }
  }

  Widget itemCountField() {
    return TextFormField(
      textAlign: TextAlign.center,
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
      width: getMaxWidthOf(context),
      height: MediaQuery.of(context).size.width * .3,
      child: FloatingActionButton.extended(
          shape: const RoundedRectangleBorder(),
          onPressed: () {
            // Validate() calls each field's validator method and returns false if any fail
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
            }
          },
          label: const Icon(Icons.backup, size: 100.0)),
    );
  }

  double getMaxWidthOf(context) {
    return MediaQuery.of(context).size.width;
  }

  double getWidthOf(context) {
    return MediaQuery.of(context).size.width * .04;
  }

  double getHeightOf(context) {
    return MediaQuery.of(context).size.height * .04;
  }
}
