import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/app_scaffold.dart';
import '../models/post.dart';

class NewPostScreen extends StatefulWidget {
  static const routeName = "new-entry";

  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  late bool uploading;
  Post newEntryValues = Post();
  File? image;
  Position? locationData;
  String? imageURL;

  @override
  void initState() {
    super.initState();
    uploading = false;
    getImage();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: const Text("New Post"),
      body: newEntryForm(),
      button: postButton(),
    );
  }

  void getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      Navigator.of(context).pop();
    }
  }

  Future getImageUrl() async {
    var fileName = '${DateTime.now()}.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    var url = await (await uploadTask).ref.getDownloadURL();
    imageURL = url;
  }

  void getLocation() async {
    Position position = await _getLocation();
    locationData = position;
    setState(() {});
  }

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
              quantityField(),
            ],
          ),
        ),
      );
    }
  }

  Widget quantityField() {
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
        newEntryValues.quantity = int.parse(value!);
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
        onPressed: () async {
          // Validate() calls each field's validator method and returns false if any fail
          if (formKey.currentState!.validate()) {
            newEntryValues.date = Timestamp.now();
            newEntryValues.latitude = locationData!.latitude;
            newEntryValues.longitude = locationData!.longitude;
            setState(() {
              uploading = true;
            });
            formKey.currentState?.save();
            await getImageUrl();
            if (imageURL != null) {
              newEntryValues.imageURL = imageURL!;
              FirebaseFirestore.instance
                  .collection('posts')
                  .add(newEntryValues.savePost());
            }
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        label: buttonIcon(),
      ),
    );
  }

  Widget buttonIcon() {
    if (!uploading) {
      return const Icon(Icons.backup, size: 100.0);
    } else {
      return const CircularProgressIndicator();
    }
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
