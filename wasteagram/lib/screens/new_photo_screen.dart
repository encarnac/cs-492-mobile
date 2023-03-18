import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../layouts/app_scaffold.dart';
import '../widgets/new_entry_form.dart';

class NewPhotoScreen extends StatefulWidget {
  static const routeName = "new-entry";

  const NewPhotoScreen({super.key});

  @override
  State<NewPhotoScreen> createState() => _NewPhotoScreenState();
}

class _NewPhotoScreenState extends State<NewPhotoScreen> {
  final picker = ImagePicker();
  File? image;

  @override
  void initState() {
    super.initState();
    getImage();
    setState(() {});
  }

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
      buttonState: false,
      child: newEntryLayout(),
    );
  }

  Widget newEntryLayout() {
    if (image == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return NewEntryForm(image: image);
    }
  }
}
