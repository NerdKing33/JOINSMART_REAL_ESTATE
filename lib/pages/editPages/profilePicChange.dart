import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:image_picker/image_picker.dart';
import '../../impVariable.dart';
import '../../resources/auth.dart';
import '../../resources/utils.dart';

class profilePicChange extends StatefulWidget {
  const profilePicChange({super.key});

  @override
  State<profilePicChange> createState() => _profilePicChangeState();
}

class _profilePicChangeState extends State<profilePicChange> {
  bool isLoading = false;
  Uint8List? imageUpload;

  void setNewUserProfilePic() async {
    setState(() {
      isLoading = true;
    });
    String res =
    await AuthMethods().userRetakeProfilePics(profilePic: imageUpload!);
    if (res != 'success') {
      setState(() {
        isLoading = false;
      });
      setState(() {
        Navigator.of(context).pop();
      });
    } else {
      setState(() {
        isLoading = false;
        showSnackBar('changeComplete', context);
      });
      setState(() {
        Navigator.of(context).pop();
      });
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: lRed,
            title: Text(
              'Upload House Images',
              style: GoogleFonts.galdeano(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Take a Photo',
                  style: GoogleFonts.rajdhani(
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
                  style: GoogleFonts.rajdhani(
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
                  style: GoogleFonts.rajdhani(
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
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                width: 600,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0, bottom: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Reset your Profile Picture',
                            style: GoogleFonts.galdeano(
                                fontSize: 25, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 5.0, bottom: 10.0),
                      child: Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: imageUpload == null
                              ? Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: const Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: .5,
                                    ),
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: .5,
                                    ),
                                    right: BorderSide(
                                      color: Colors.black,
                                      width: .5,
                                    ),
                                    top: BorderSide(
                                      color: Colors.black,
                                      width: .5,
                                    )),
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    _selectImage(context);
                                  },
                                  child: const Icon(Icons.download_outlined,
                                      color: Colors.black, size: 50),
                                ),
                              ))
                              : Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: MemoryImage(imageUpload!),
                                )),
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              highlightColor: pRed,
                              icon:  Text(
                              'CANCEL',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        ),
                        sb10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 18,),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 65,
                            child: isLoading
                                ? Center(
                              child: CircularProgressIndicator(
                                color: lRed,
                                strokeWidth: 4,
                              ),
                            )
                                : InkWell(
                              onTap: setNewUserProfilePic,
                              highlightColor: pRed,
                              child: Icon(
                                Icons.navigate_next_rounded,
                                color: lRed,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
