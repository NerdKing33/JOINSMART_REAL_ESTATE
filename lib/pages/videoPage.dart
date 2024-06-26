import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/snackBar.dart';
import '../utils.dart';
class videoPage extends StatefulWidget {
  final String postId;
  final Map<String, dynamic> mainPost;

  const videoPage({
    super.key,
    required this.postId,
    required this.mainPost,
  });

  @override
  State<videoPage> createState() => _videoPageState();
}

class _videoPageState extends State<videoPage> {
  var userPostData = {};
  List<dynamic> images = [];

  @override
  void initState() {
    super.initState();
    addDataPost();
  }

  addDataPost() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Posts')
          .doc(widget.postId)
          .get();
      var userPostData = snap.data()!;
      setState(() {});
      images.add(widget.mainPost['mainPost']);
      images.addAll(await userPostData['posts']);
    } catch (err) {
      snackBar(description: err.toString(),);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 70,
        title: Text(
          'Post Pictures',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Center(
          child: Container(
              height: 350,
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
              child: CarouselSlider.builder(
                unlimitedMode: true,
                slideTransform: const CubeTransform(),
                slideIndicator: CircularWaveSlideIndicator(
                  currentIndicatorColor: Colors.white,
                  indicatorBackgroundColor: Colors.white70,
                  padding: const EdgeInsets.only(
                      bottom: 20.0, right: 40.0, left: 40.0),
                ),
                itemCount: images.length,
                slideBuilder: (int index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(images[index]),
                      ));
                },
              )),
        ),
      ),
    );
  }
}
