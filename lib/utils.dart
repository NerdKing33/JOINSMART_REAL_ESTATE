import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
}

pickImages() async {
  final ImagePicker imagesPicker = ImagePicker();
  List<XFile> file = await imagesPicker.pickMultiImage();
  List pics = [];
  for(var i = 0; i < file.length; i++) {
    pics.add((await  file[i].readAsBytes()) );
  }
  if (pics.isNotEmpty) {
      return pics;
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
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: const EdgeInsets.all(10.0),
    backgroundColor: pRed,
      content: Text(content,
        style: GoogleFonts.rajdhani(
          fontSize: 20,
          color: Colors.black
        ),
      ),
      behavior: SnackBarBehavior.floating,
  )
  );
}
