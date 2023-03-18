import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../layouts/app_scaffold.dart';
import '../widgets/new_entry_form.dart';

class NewEntryScreen extends StatefulWidget {
  static const routeName = "/";

  const NewEntryScreen({super.key});

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final picker = ImagePicker();
  File? image;

  void getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "New Entry",
      child: newEntryLayout(),
    );
  }

  Widget newEntryLayout() {
    if (image == null) {
      return Center(
        child: ElevatedButton(
          child: const Text("Select Photo"),
          onPressed: () {
            getImage();
          },
        ),
      );
    } else {
      return NewEntryForm(image: image);
    }
  }
}
