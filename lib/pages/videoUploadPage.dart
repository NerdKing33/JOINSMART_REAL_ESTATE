import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../impVariable.dart';
import '../themes/theme.dart';
import '../utils.dart';
import '../widgets/pageHeader.dart';

class videoUploadPage extends StatefulWidget {
  const videoUploadPage({super.key});

  @override
  State<videoUploadPage> createState() => _videoUploadPageState();
}

class _videoUploadPageState extends State<videoUploadPage> {
  VideoPlayerController? videoPlayerController;
  Uint8List? videoUpload;
  final picker = ImagePicker();
  _selectVideo(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: lRed,
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
                  '   Take a Video',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  XFile file = await pickVideo(ImageSource.camera);
                  setState(() async {
                    videoUpload = await file.readAsBytes();
                    videoPlayerController = VideoPlayerController.file(File(file.path))..initialize().then((value) {setState(() {});});
                    videoPlayerController!.setLooping(false);
                    videoPlayerController!.setVolume(1.0);
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
                  XFile file = await pickVideo(ImageSource.gallery);
                  setState(() async {
                    videoUpload = await file.readAsBytes();
                    videoPlayerController = VideoPlayerController.file(File(file.path))..initialize().then((value) {
                      setState(() {});});
                    videoPlayerController!.setLooping(false);
                    videoPlayerController!.setVolume(1.0);
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
        title: const pageHeader(title: 'Video Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 4/3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20.0) ,
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
              Container(
                    width: 900,
                    height: 600,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: pRed,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: lRed,
                          width: .5
                      ),),
                    child: videoUpload == null ? Center(
                      child: Text(
                        'No video selected Yet...',
                        style: GoogleFonts.poppins(
                            color:Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0
                        ),
                      ),
                    ): AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(videoPlayerController!),
            ),
                  ),
                  sbH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _selectVideo(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: lRed,
                                  width: .5
                              ),
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child:  Text(
                            'Select Video',
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
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Text(
                            'Upload Video',
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
