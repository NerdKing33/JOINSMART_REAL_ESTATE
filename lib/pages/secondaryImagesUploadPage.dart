import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../impVariable.dart';
import '../themes/theme.dart';
import '../utils.dart';
import '../widgets/pageHeader.dart';

class secondaryImagesUploadPage extends StatefulWidget {
  const secondaryImagesUploadPage({super.key});

  @override
  State<secondaryImagesUploadPage> createState() => _secondaryImagesUploadPageState();
}

class _secondaryImagesUploadPageState extends State<secondaryImagesUploadPage> {
  //secondaryImagesUploadPage
  List<File> imageUpload = [];
  final imagePicker = ImagePicker();
  _selectImages(BuildContext context) async {
    final selectedImages = await imagePicker.pickMultiImage(
      imageQuality: 100,
    );
    List<XFile> xfilePick = selectedImages;
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        imageUpload.add(File(xfilePick[i].path));
      }
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(content: Text('error',style: GoogleFonts.poppins(color: Colors.black),)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pRed,
      appBar: AppBar(
        title: const pageHeader(title: 'Secondary Images Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
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
                  imageUpload.isNotEmpty
                      ? Container(
                    padding:const EdgeInsets.all(10.0) ,
                height: 600,
                width: 900,
                decoration: BoxDecoration(
                  color: pRed,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUpload.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemBuilder: (BuildContext context,
                        int index) {
                      return Padding(
                        padding:
                        const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(10),
                          child: Image.file(
                            File(imageUpload[index].path),
                            fit: BoxFit.cover,
                            filterQuality:
                            FilterQuality.high,
                          ),
                        ),
                      );
                    }),
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
                        'No Images Selected Yet...',
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
                          _selectImages(context);
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
                            'Select Images',
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
                            navIndex2 =2;
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
                            'Upload Images',
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
}
