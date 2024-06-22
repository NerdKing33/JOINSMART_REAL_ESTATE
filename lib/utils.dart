import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
}

pickVideo(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickVideo(source: source);
  if (file != null) {
    return file;
  }
}

showSnackBar(String content, BuildContext context) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
