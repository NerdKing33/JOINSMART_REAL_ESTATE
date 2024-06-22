import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/pages/photosPage.dart';
import 'package:housing_information_website/pages/postLocationPage.dart';
import 'package:housing_information_website/pages/videoPage.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../widgets/calendar.dart';
import '../widgets/containers/quickAccessContainer.dart';

class postPage extends StatefulWidget {
  final String postId;
  final Map<String, dynamic> mainPost;

  const postPage({
    super.key,
    required this.postId,
    required this.mainPost,
  });

  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  var userPostData = {};
  List<dynamic> images = [];
  late bool selected = false;

  @override
  // void initState() {
  //   super.initState();
  //   addDataPost();
  // }

  // addDataPost() async {
  //   try {
  //     var snap = await FirebaseFirestore.instance
  //         .collection('Posts')
  //         .doc(widget.postId)
  //         .get();
  //     userPostData = snap.data()!;
  //     setState(() {});
  //     images.add(widget.mainPost['mainPost']);
  //     images.addAll(await userPostData['posts']);
  //   } catch (err) {
  //     showSnackBar(err.toString(), context);
  //   }
  // }

  // _deletePost(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           backgroundColor: Colors.red.shade900,
  //           title: Text(
  //             'Do You Want To Delete Post',
  //             style: GoogleFonts.galdeano(
  //               color: Colors.white,
  //               fontSize: 20,
  //             ),
  //           ),
  //           children: [
  //             SimpleDialogOption(
  //               padding: const EdgeInsets.all(15),
  //               child: Text(
  //                 '   Yes',
  //                 style: GoogleFonts.rajdhani(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               onPressed: () async {
  //                 String res = await storageMethods().deletePost(widget.postId);
  //                 if (res == 'success') {
  //                   showSnackBar('postDeleted', context);
  //                   Navigator.of(context).pop;
  //                   Navigator.of(context).pushReplacement(PageTransition(
  //                       child: const homePage(),
  //                       type: PageTransitionType.topToBottom,
  //                       duration: const Duration(milliseconds: 300)));
  //                 } else {
  //                   showSnackBar('deleteFailed', context);
  //                 }
  //               },
  //             ),
  //             SimpleDialogOption(
  //               padding: const EdgeInsets.all(15),
  //               child: Text(
  //                 '   No',
  //                 style: GoogleFonts.rajdhani(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               onPressed: () async {
  //                 Navigator.pop(context);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          toolbarHeight: 70,
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
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: userPostData['profilePic'] == null
              ? []
              : FirebaseAuth.instance.currentUser!.uid != userPostData['uid']
              ? [
            IconButton(
                highlightColor: Colors.greenAccent,
                onPressed: () {
                  Navigator.of(context).push(PageTransition(
                      child: const calendar(),
                      type: PageTransitionType.topToBottom,
                      duration: const Duration(milliseconds: 300)));
                },
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                )),
            IconButton(
                tooltip: 'Save Post',
                onPressed: () async {
                  // String liked = await storageMethods().likePost(
                  //   widget.postId,
                  //   FirebaseAuth.instance.currentUser!.uid,
                  //   await widget.mainPost['likes'],
                  // );
                  // if (liked == 'true') {
                  //   setState(() {
                  //     selected = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     selected = false;
                  //   });
                  // }
                },
                isSelected: selected,
                highlightColor: Colors.redAccent.shade100,
                selectedIcon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                '${userPostData['likes'].length}',
                style: GoogleFonts.rajdhani(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ]
              : [
            IconButton(
                highlightColor: Colors.greenAccent,
                onPressed: () {
                  // _deletePost(context);
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.white,
                )),
          ]),
      body: userPostData['profilePic'] == null
          ? Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            color: Colors.red.shade400,
          ),
        ),
      )
          : ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 0.0, left: 8.0, right: 8.0),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(3.0, 1.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
                child: Row(
                    children: userPostData['profilePic'] != null
                        ? [
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              userPostData['profilePic'])),
                      const SizedBox(width: 20),
                      Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              userPostData['username'],
                              style: GoogleFonts.galdeano(
                                  color: Colors.black,
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                  fontSize: 18),
                            ),
                            Text(
                              'Contact info: ${userPostData['phoneNumber']}',
                              style: GoogleFonts.rajdhani(
                                  color: Colors.black),
                            )
                          ]),
                    ]
                        : [
                      const CircleAvatar(
                        radius: 20,
                      ),
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  slideTransform: const ZoomOutSlideTransform(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //uploadButton
              GestureDetector(
                child: quickAccessContainer(
                    icon: Icons.map_outlined, text: 'Map Location'),
                onTap: () {
                  Navigator.of(context).push(PageTransition(
                      child: postLocationPage(postData: userPostData),
                      type: PageTransitionType.bottomToTop,
                      duration: const Duration(milliseconds: 300)));
                },
              ),
              //preferenceButton
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageTransition(
                      child: videoPage(
                        postId: widget.postId,
                        mainPost: widget.mainPost,
                      ),
                      type: PageTransitionType.bottomToTop,
                      duration: const Duration(milliseconds: 300)));
                },
                child: quickAccessContainer(
                  icon: Icons.camera_alt_outlined,
                  text: '${images.length} photos',
                ),
              ),
              //favouriteButton
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageTransition(
                      child: photosPage(
                        postId: widget.postId,
                        mainPost: widget.mainPost,
                      ),
                      type: PageTransitionType.bottomToTop,
                      duration: const Duration(milliseconds: 300)));
                },
                child: quickAccessContainer(
                  icon: Icons.videocam_outlined,
                  text: 'Video',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade100,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 5.0,
                        spreadRadius: 2.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Shs ${userPostData['price']}',
                        style: GoogleFonts.galdeano(
                            fontWeight: FontWeight.w200,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.bed_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            '${userPostData['rooms']}',
                            style:
                            GoogleFonts.rajdhani(color: Colors.black),
                          ),
                          const SizedBox(width: 10.0),
                          const Icon(
                            Icons.bathtub_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            '${userPostData['bathrooms']}',
                            style:
                            GoogleFonts.rajdhani(color: Colors.black),
                          ),
                          const SizedBox(width: 10.0),
                          const Icon(
                            Icons.landscape_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            '${userPostData['acers']}',
                            style:
                            GoogleFonts.rajdhani(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                        Text(
                          '${userPostData['location']}',
                          style: GoogleFonts.rajdhani(
                              letterSpacing: 1,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: GoogleFonts.galdeano(
                                fontSize: 25,
                                color: Colors.black,
                                letterSpacing: 1,
                                wordSpacing: 1),
                          ),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                    'By ${userPostData['username']}, on ${DateFormat.yMMMd().format(userPostData['datePublished'].toDate())} \n',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 18, color: Colors.black)),
                                TextSpan(
                                    text: ' ${userPostData['description']}',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ]))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5.0),
                          Text(
                            'Key Details',
                            style: GoogleFonts.galdeano(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Status:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text: ' For Sale',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Date Published:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text:
                                    'On ${DateFormat.yMMMd().format(userPostData['datePublished'].toDate())}',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Size:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text: '${userPostData['acers']} acers',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Rooms:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text: '${userPostData['rooms']} rooms',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Bathrooms:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text:
                                    '${userPostData['bathrooms']} bathrooms',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Number Floors:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text: ' 3 floors',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Electric System:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text: ' Functional',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Plumbing System:  ',
                                    style: GoogleFonts.galdeano(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text: ' Functional',
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ])),
                        ],
                      ),
                    )
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
