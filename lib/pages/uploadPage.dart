import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:image_picker/image_picker.dart';

class uploadPage extends StatefulWidget {
  @override
  _uploadPageState createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        _image = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pRed,
      appBar: AppBar(
        title: const pageHeader(title: 'Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
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
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _image != null
                      ? Container(
                    decoration: BoxDecoration(
                      color: pRed,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: lRed,
                        width: .5
                      ),
                      // image: DecorationImage(
                      //     image:  Image.file(_image!)
                      // )
                    ),
                  )
                      :  Container(
                    width: 900,
                    height: 600,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: pRed,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: lRed,
                          width: .5
                      ),
                      // image: DecorationImage(
                      //     image:  Image.file(_image!)
                      // )
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
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: lRed,
                                width: .5
                            ),
                            borderRadius: BorderRadius.circular(5.0)
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
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: lRed,
                                width: .5
                            ),
                            borderRadius: BorderRadius.circular(5.0)
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