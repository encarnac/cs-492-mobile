import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../models/post.dart';
import '../widgets/app_scaffold.dart';

class NewPostScreen extends StatefulWidget {
  static const routeName = "new-entry";

  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final formKey = GlobalKey<FormState>(); // used to save form state
  final picker = ImagePicker(); // initializes image_picker package
  late bool uploading; // handles state of upload button when busy uploading
  Post newEntry = Post(); // DTO used to upload to database
  File? image; // image selected by user
  Position? locationData; // latitude, longitude returned by geolocator package
  String? imageURL; // url of the uploaded image in cloud storage

  /// Prompts user to select image and saves location on screen mount
  @override
  void initState() {
    super.initState();
    uploading = false;
    getImage();
    getLocation();
  }

  /// Creates basic layout of the screen
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: const Text("New Post"),
      body: newEntryForm(),
      button: postButton(),
    );
  }

  /// Displays structure of the form as the body
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
              // Displays image selected
              Image.file(
                image!,
                width: getMaxWidthOf(context),
                height: MediaQuery.of(context).size.width * .85,
              ),
              const SizedBox(height: 5),
              // TextFormField to enter quantity
              quantityField(context),
            ],
          ),
        ),
      );
    }
  }

  // Enter number of waste quantity for post
  Widget quantityField(BuildContext context) {
    return Semantics(
      textField: true,
      focusable: true,
      label: "Number of wasted items",
      hint: "Enter the number of wasted items for this new post",
      child: TextFormField(
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
        // Restricts to numeric keypad values only
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        // Saves value as integer to Post DTO
        onSaved: (value) {
          newEntry.quantity = int.parse(value!);
        },
        validator: (value) {
          // Checks that value was entered
          if (value!.isEmpty) {
            return "Please enter a number";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget postButton() {
    return Semantics(
      button: true,
      image: true,
      link: true,
      enabled: true,
      label: "Large floating action button of a cloud backup icon",
      onLongPressHint: "Saves entered values to a new post in the database",
      child: SizedBox(
        width: getMaxWidthOf(context),
        height: MediaQuery.of(context).size.width * .3,
        child: FloatingActionButton.extended(
          shape: const RoundedRectangleBorder(),
          onPressed: () async {
            // Validate() calls each field's validator method and returns false if any fail
            if (formKey.currentState!.validate()) {
              // Saves current date and time to Post DTO
              newEntry.date = Timestamp.now();
              // Saves the latitude from geolocator to Post DTO
              newEntry.latitude = locationData!.latitude;
              // Saves the longitude from geolocator to Post DTO
              newEntry.longitude = locationData!.longitude;
              // Displays loading icon in button while adding to database
              setState(() {
                uploading = true;
              });
              formKey.currentState?.save();
              // Uploads image to Cloud Storage and returns its url
              await getImageUrl();
              // Waits until image is uploaded before adding to database
              if (imageURL != null) {
                newEntry.imageURL = imageURL!;
                // Saves completed Post DTO to Firebase Firestore database
                FirebaseFirestore.instance
                    .collection('posts')
                    .add(newEntry.values);
              }
              // Redirects back to home screen after post is saved
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          // Determines which button icon to use depending on if busy uploading
          label: uploading == false
              ? const Icon(Icons.backup, size: 100.0)
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }

  /// Prompts user to select image from phone gallery
  void getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      /// Returns to home screen if photo selection cancelled
      Navigator.of(context).pop();
    }
  }

  /// Uploads selected image to Cloud Storage to get the url string
  Future getImageUrl() async {
    var fileName = '${DateTime.now()}.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    var url = await (await uploadTask).ref.getDownloadURL();
    imageURL = url;
  }

  /// Gets the user's location
  void getLocation() async {
    Position position = await _getLocation();
    locationData = position;
    setState(() {});
  }

  /// Uses geolocator to access the user's location
  Future _getLocation() async {
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

  /// Dynamic sizing functions
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
