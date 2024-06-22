import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class photosPage extends StatefulWidget {
  final String postId;
  final Map<String, dynamic> mainPost;

  const photosPage({
    super.key,
    required this.postId,
    required this.mainPost,
  });

  @override
  State<photosPage> createState() => _photosPageState();
}

class _photosPageState extends State<photosPage> {
  VideoPlayerController? controller;

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  void initState() {
    super.initState();
    addDataPost();
    controller = VideoPlayerController.network(widget.mainPost['video'])
      ..initialize().then((value) {
        setState(() {});
      });
  }

  addDataPost() async {
    var snap = await FirebaseFirestore.instance
        .collection('Posts')
        .doc(widget.postId)
        .get();
    var userPostData = snap.data()!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 70,
        title: Text(
          'Post Video',
          style: GoogleFonts.galdeano(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              splashColor: Colors.greenAccent,
              icon: const Icon(
                color: Colors.white,
                Icons.arrow_circle_left_outlined,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 3.0, right: 3.0, bottom: 15.0, top: 10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 5.0,
                        spreadRadius: 1.0)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: controller!.value.aspectRatio,
                          child: VideoPlayer(controller!),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                    child: Container(
                      width: 220,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                controller!.play();
                              },
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: Row(
                                children: [
                                  const Icon(Icons.play_circle_outline),
                                  Text('Play',
                                      style:
                                      GoogleFonts.galdeano(fontSize: 20)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                controller!.pause();
                              },
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: Row(
                                children: [
                                  const Icon(Icons.pause_circle_outline),
                                  Text('Pause',
                                      style:
                                      GoogleFonts.galdeano(fontSize: 20)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
