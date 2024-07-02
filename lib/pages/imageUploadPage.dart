import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/pages/multiUploadPage.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:image_picker/image_picker.dart';

import '../utils.dart';

class imageUploadPage extends StatefulWidget {
  @override
  _imageUploadPageState createState() => _imageUploadPageState();
}

class _imageUploadPageState extends State<imageUploadPage> {
  Uint8List? imageUpload;
  final picker = ImagePicker();

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.red,
            title: Text(
              'Choose Upload Method',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Take a Photo',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    imageUpload = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Choose from Gallery',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    imageUpload = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Cancel',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pRed,
      appBar: AppBar(
        title: const pageHeader(title: 'Image Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
            backgroundColor: Colors.white,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 4/3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(8.0) ,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: lRed,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  imageUpload != null
                      ? Container(
                    width: 900,
                    height: 600,
                    decoration: BoxDecoration(
                      color: pRed,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: lRed,
                        width: .5
                      ),
                      image: DecorationImage(
                          image:  MemoryImage(imageUpload!)
                      )
                    ),
                  )
                      :  Container(
                    width: 900,
                    height: 600,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: pRed,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: lRed,
                          width: .5
                      ),
                    ),
                    child: Center(
                      child: Text(
                          'No image selected Yet...',
                        style: GoogleFonts.poppins(
                            color:Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0
                                              ),
                                            ),
                    ),
                      ),
                  sbH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _selectImage(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: lRed,
                                  width: .5
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child:  Text(
                            'Select Image',
                            style: GoogleFonts.poppins(
                                color:lRed,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                              letterSpacing: 1.5,
                              wordSpacing: 2.0
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                         setState(() {
                           navIndex2 =1;
                         });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: lRed,
                                  width: .5
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Text(
                            'Upload Image',
                            style: GoogleFonts.poppins(
                                color:lRed,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                              letterSpacing: 1.5,
                              wordSpacing: 2.0
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Example function to upload the image to your server or API
  void uploadImage(File image) async {
    // Your upload logic here
    // For example:
    // final url = 'https://your-server.com/upload-image';
    // final request = http.MultipartRequest('POST', Uri.parse(url));
    // request.files.add(http.MultipartFile.fromBytes(
    //   'image',
    //   image.readAsBytesSync(),
    //   filename: 'image.jpg',
    // ));
    // final response = await request.send();
    // if (response.statusCode == 200) {
    //   print('Image uploaded successfully');
    // } else {
    //   print('Error uploading image');
    // }
  }
}