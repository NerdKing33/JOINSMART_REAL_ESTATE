// //upperPartContactInfo
// Container(
// padding: const EdgeInsets.all(8.0),
// decoration: BoxDecoration(
// color: Colors.grey.shade100,
// borderRadius: BorderRadius.circular(10),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.shade500,
// offset: const Offset(3.0, 1.0),
// blurRadius: 5.0,
// spreadRadius: 1.0)
// ]),
// child: Row(
// children: userPostData['uid'] != null
// ? [
// CircleAvatar(
// radius: 30,
// backgroundImage: NetworkImage(
// userPostData['mainPost'])),
// sb20,
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// userPostData['username'],
// style: GoogleFonts.galdeano(
// color: Colors.black,
// letterSpacing: 1,
// wordSpacing: 1,
// fontSize: 18),
// ),
// Text(
// 'Contact info: ${userPostData['userNumber']}',
// style: GoogleFonts.rajdhani(
// color: Colors.black),
// )
// ]),
// ]
//     : [
// const CircleAvatar(
// radius: 30,
// ),
// SizedBox(
// width: MediaQuery.of(context).size.width*.45,
// ),
// Center(
// child: SizedBox(
// height: 40,
// width: 40,
// child: CircularProgressIndicator(
// strokeWidth: 5,
// color: lRed,
// ),
// ),
// )
// ])),


// //videoUploadPage
// VideoPlayerController? videoPlayerController;
// Uint8List? videoUpload;
// _selectVideo(BuildContext context) async {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return SimpleDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           backgroundColor: lRed,
//           title: Text(
//             'Choose Upload Method',
//             style: GoogleFonts.poppins(
//               color: Colors.white,
//               fontSize: 20,
//             ),
//           ),
//           children: [
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(15),
//               child: Text(
//                 '   Take a Video',
//                 style: GoogleFonts.poppins(
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () async {
//                 Navigator.pop(context);
//                 XFile file = await pickVideo(ImageSource.camera);
//                 setState(() async {
//                   videoUpload = await file.readAsBytes();
//                   videoPlayerController = VideoPlayerController.file(File(file.path))..initialize().then((value) {setState(() {});});
//                   videoPlayerController!.setLooping(false);
//                   videoPlayerController!.setVolume(1.0);
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(15),
//               child: Text(
//                 '   Choose from Gallery',
//                 style: GoogleFonts.poppins(
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () async {
//                 Navigator.pop(context);
//                 XFile file = await pickVideo(ImageSource.gallery);
//                 setState(() async {
//                   videoUpload = await file.readAsBytes();
//                   videoPlayerController = VideoPlayerController.file(File(file.path))..initialize().then((value) {setState(() {});});
//                   videoPlayerController!.setLooping(false);
//                   videoPlayerController!.setVolume(1.0);
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(15),
//               child: Text(
//                 '   Cancel',
//                 style: GoogleFonts.poppins(
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

//secondaryImagesUploadPage



////videoUploadPage
// Scaffold(
//   backgroundColor: pRed,
//   appBar: AppBar(
//     title: const pageHeader(title: 'Video Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
//     backgroundColor: Colors.white,
//   ),
//   body: Center(
//     child: AspectRatio(
//       aspectRatio: 4/3,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Container(
//           padding: const EdgeInsets.all(20.0) ,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(
//                 color: lRed,
//                 width: .5,
//               ),
//               borderRadius: BorderRadius.circular(20.0)
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 900,
//                 height: 600,
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   color: pRed,
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(
//                       color: lRed,
//                       width: .5
//                   ),),
//                 child: videoUpload == null ? Center(
//                   child: Text(
//                     'No video selected Yet...',
//                     style: GoogleFonts.poppins(
//                         color:Colors.black,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 20.0
//                     ),
//                   ),
//                 ): AspectRatio(
//                   aspectRatio: videoPlayerController!.value.aspectRatio,
//                   child: VideoPlayer(videoPlayerController!),
//                 ),
//               ),
//               sbH20,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   GestureDetector(
//                     onTap: (){
//                       _selectVideo(context);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(
//                               color: lRed,
//                               width: .5
//                           ),
//                           borderRadius: BorderRadius.circular(15.0)
//                       ),
//                       child:  Text(
//                         'Select Video',
//                         style: GoogleFonts.poppins(
//                             color:lRed,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 20.0,
//                             letterSpacing: 1.5,
//                             wordSpacing: 2.0
//                         ),
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         navIndex2 =1;
//                       });
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(
//                               color: lRed,
//                               width: .5
//                           ),
//                           borderRadius: BorderRadius.circular(15.0)
//                       ),
//                       child: Text(
//                         'Upload Video',
//                         style: GoogleFonts.poppins(
//                             color:lRed,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 20.0,
//                             letterSpacing: 1.5,
//                             wordSpacing: 2.0
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   ),
// ),




// Future<void>  getUserLocation()async{
//    bool serviceEnabled;
//
//    PermissionStatus permissionStatus;
//
//    serviceEnabled = await  locationController.serviceEnabled();
//    if(serviceEnabled){
//      serviceEnabled = await  locationController.requestService();
//    }else{
//      return;
//    }
//    permissionStatus = await locationController.hasPermission();
//    if(permissionStatus==PermissionStatus.denied){
//      permissionStatus  = await locationController.requestPermission();
//      if(permissionStatus != PermissionStatus.granted ){
//        return;
//      }
//    }
//    locationController.onLocationChanged
//        .listen((LocationData currentLocation){
//      if(currentLocation.latitude!=null && currentLocation.longitude!=null){
//        setState(() {
//          _userLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
//        });
//      }
//    });
//  }




//videoFeature
// String videoUrl =
//     await storageMethods().videoUpload('posts', 'videoPost', postVideo);


// if(kIsWeb) {
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//         apiKey: "AIzaSyD-8y-5awQXBxqxcevTRq5MIaF4rjYG_aw",
//         appId: "1:999658565706:web:003e212c086dc62da9b6b3",
//         messagingSenderId: "999658565706",
//         projectId: "joinsmart-estates",
//       storageBucket: "joinsmart-estates.appspot.com",
//     )
//   );
// }else{}


///postRiviewPage
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//
// import '../impVariable.dart';
// import '../themes/theme.dart';
// import '../widgets/pageHeader.dart';
//
// class postReviewPage extends StatefulWidget {
//   const postReviewPage({super.key});
//
//   @override
//   State<postReviewPage> createState() => _postReviewPageState();
// }
//
// class _postReviewPageState extends State<postReviewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: (){
//             setState(() {
//               Navigator.pushReplacementNamed(context, '/accountPage');
//             });
//           },
//           icon: Icon(
//             Icons.arrow_back_ios_outlined,
//             color: lRed,
//           ),
//         ),
//         centerTitle: true,
//         title: const pageHeader(title: 'Image Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           width: 950,
//           height: 790,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0),
//               color: Colors.grey.shade100,
//               boxShadow: [BoxShadow(
//                   color: Colors.grey.shade400,
//                   offset: const Offset(0.0, 0.0),
//                   blurRadius: 5.0,
//                   spreadRadius: 2.0)]),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 420,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 410,
//                       width: 300,
//                       child: Container(
//                         decoration:  BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15.0),
//                           image:  DecorationImage(
//                               fit: BoxFit.cover,
//                               image:MemoryImage(
//
//                               )
//                           ),
//                         ),
//                       ),
//                     ),
//                     sb10,
//                     SizedBox(
//                       width: 620,
//                       height: 420,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 width: 440,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         TextButton(
//                                           onPressed: (){},
//                                           child: Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.payments_outlined,
//                                                 color: lRed,
//                                               ),
//                                               RichText(
//                                                 text: TextSpan(
//                                                     children: [
//                                                       TextSpan(
//                                                         text: '  TShs ',
//                                                         style: GoogleFonts.poppins(
//                                                             fontWeight: FontWeight.w300,
//                                                             fontSize: 20,
//                                                             color: Colors.black),
//                                                       ),
//                                                       TextSpan(
//                                                         text: '${userPostData['price']}/${userPostData['paymentPeriod']}',
//                                                         style: GoogleFonts.galdeano(
//                                                             fontWeight: FontWeight.w400,
//                                                             fontSize: 25,
//                                                             color: Colors.black),
//                                                       )
//                                                     ]
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Divider(
//                                       color: lRed,
//                                       thickness: .5,
//                                     ),
//                                     Row(
//                                       children: [
//                                         TextButton(onPressed: (){}, child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Icon(
//                                               Icons.bed_outlined,
//                                               color: lRed,
//                                             ),
//                                             sb5,
//                                             Text(
//                                               '${userPostData['noRooms']}',
//                                               style: GoogleFonts.galdeano(
//                                                   fontSize: 20,
//                                                   color: Colors.black
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//                                         sb5,
//                                         TextButton(onPressed: (){}, child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Icon(
//                                               Icons.bathtub_outlined,
//                                               color: lRed,
//                                             ),
//                                             sb5,
//                                             Text(
//                                               '${userPostData['noBathrooms']}',
//                                               style: GoogleFonts.galdeano(
//                                                 fontSize: 20,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//                                         sb0,
//                                         TextButton(onPressed: (){}, child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Icon(
//                                               MdiIcons.landPlotsMarker,
//                                               color: lRed,
//                                             ),
//                                             sb5,
//                                             RichText(
//                                               text: TextSpan(
//                                                   children: [
//                                                     TextSpan(
//                                                       text:     '${userPostData['area'] }',
//                                                       style: GoogleFonts.galdeano(
//                                                           fontSize: 20,
//                                                           color: Colors.black
//                                                       ),
//                                                     ),
//                                                     TextSpan(
//                                                       text: ' m',
//                                                       style: GoogleFonts.poppins(
//                                                           fontWeight: FontWeight.w300,
//                                                           color: Colors.black),
//                                                     ),
//                                                     WidgetSpan(
//                                                       child: Transform.translate(
//                                                         offset: const Offset(2, -4),
//                                                         child: Text(
//                                                           '2',
//                                                           style: GoogleFonts.galdeano(
//                                                               fontSize: 14
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     )
//                                                   ]
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//                                         sb0,
//                                         TextButton(onPressed: (){}, child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Icon(
//                                               MdiIcons.floorPlan,
//                                               color: lRed,
//                                             ),
//                                             sb2,
//                                             RichText(
//                                               text: TextSpan(
//                                                   children: [
//                                                     TextSpan(
//                                                       text:     '${userPostData['noFloors'] }',
//                                                       style: GoogleFonts.galdeano(
//                                                           fontSize: 20,
//                                                           color: Colors.black
//                                                       ),
//                                                     ),
//                                                     TextSpan(
//                                                       text: ' floors',
//                                                       style: GoogleFonts.poppins(
//                                                           fontWeight: FontWeight.w300,
//                                                           color: Colors.black),
//                                                     ),
//                                                   ]
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//                                       ],
//                                     ),
//                                     Divider(
//                                       color: lRed,
//                                       thickness: .5,
//                                     ),
//                                     TextButton(
//                                       onPressed: (){},
//                                       child: Row(children: [
//                                         Icon(
//                                           Icons.location_on_outlined,
//                                           color: lRed,
//                                         ),
//                                         sb5,
//                                         RichText(
//                                           text: TextSpan(
//                                               children: [
//                                                 TextSpan(
//                                                   text:  '${userPostData['propertyLocation']}',
//                                                   style: GoogleFonts.poppins(
//                                                       fontSize: 16,
//                                                       letterSpacing: 1,
//                                                       wordSpacing: 1,
//                                                       fontWeight: FontWeight.w300,
//                                                       color: Colors.black),
//                                                 )
//                                               ]
//                                           ),
//                                         ),
//                                       ]),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               sb5,
//                               Container(
//                                 width: 175,
//                                 height: 150,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15.0),
//                                             color: Colors.transparent,
//                                             border: Border.all(
//                                               color: Colors.red.shade300,
//                                               width: .5,
//                                             )
//                                         ),
//                                         child:Text(
//                                           'Property OnSale',
//                                           style: GoogleFonts.poppins(
//                                             color: lRed,
//                                             fontWeight: FontWeight.w500,
//                                             letterSpacing: 1.2,
//                                           ),
//                                         )
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.all(10.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15.0),
//                                         color: lRed,
//                                       ),
//                                       child: IconButton(
//                                           highlightColor:Colors.white,
//                                           hoverColor: Colors.white10,
//                                           onPressed: (){
//                                             setState(() {
//                                               navIndex = 6;
//                                             });
//                                           },
//                                           icon:Text(
//                                             'Contact Agent',
//                                             style: GoogleFonts.poppins(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w500,
//                                               letterSpacing: 1.2,
//                                             ),
//                                           )
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                           sbH10,
//                           Container(
//                             padding: const EdgeInsets.all(15.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Description',
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w400,
//                                       color: Colors.black,
//                                       letterSpacing: 1,
//                                       wordSpacing: 1
//                                   ),
//                                 ),
//                                 RichText(
//                                     text: TextSpan(children: [
//                                       TextSpan(
//                                           text: 'Published On: ${DateFormat.yMMMd().format(userPostData['datePublished'].toDate())}\n',
//                                           style: GoogleFonts.poppins(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w300,
//                                               color: Colors.black)),
//                                       TextSpan(
//                                           text: '${userPostData['description']}',
//                                           style: GoogleFonts.poppins(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w300,
//                                               color: Colors.black)),
//                                     ]))
//                               ],
//                             ),
//                           ),
//                           sbH10,
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 260,
//                 child: Row(
//                   children: [
//                     Container(
//                       width:555,
//                       decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: ListView.builder(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           scrollDirection: Axis.horizontal,
//                           itemCount: images.length,
//                           itemBuilder: (context, index){
//                             return Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height: 260,
//                                     width: 260,
//                                     decoration:BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(15.0),
//                                         image: DecorationImage(
//                                             image: NetworkImage(
//                                               images[index],
//                                             )
//                                         )
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left:8.0),
//                                     child: Container(
//                                       width: 30.0,
//                                       height: 30.0,
//                                       margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//                                       decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.black26
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           '${index+1}',
//                                           style: GoogleFonts.galdeano(
//                                               color:Colors.white,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }
//                       ),
//                     ),
//                     sb10,
//                     Stack(
//                       alignment: Alignment.bottomCenter,
//                       children: [
//                         Container(
//                           width: 360,
//                           height: 260,
//                           decoration: BoxDecoration(
//                               color: Colors.green.shade100,
//                               borderRadius: BorderRadius.circular(15.0),
//                               border: Border.all(
//                                 color: Colors.green.shade600,
//                                 width: .5,
//                               )
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             padding: const EdgeInsets.all(10.0),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6.0),
//                                 color: Colors.black12,
//                                 border: Border.all(
//                                   color: Colors.green.shade200,
//                                   width: .5,
//                                 )
//                             ),
//                             child: IconButton(
//                                 onPressed: (){
//                                   setState(() {
//                                     navIndex = 6;
//                                   });
//                                 },
//                                 icon:Text(
//                                   'Map Location ',
//                                   style: GoogleFonts.poppins(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                     letterSpacing: 1.2,
//                                   ),
//                                 )
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


///videoPage
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../utils.dart';
// class videoPage extends StatefulWidget {
//   final String postId;
//   final Map<String, dynamic> mainPost;
//
//   const videoPage({
//     super.key,
//     required this.postId,
//     required this.mainPost,
//   });
//
//   @override
//   State<videoPage> createState() => _videoPageState();
// }
//
// class _videoPageState extends State<videoPage> {
//   var userPostData = {};
//   List<dynamic> images = [];
//
//   @override
//   void initState() {
//     super.initState();
//     addDataPost();
//   }
//
//   addDataPost() async {
//     try {
//       var snap = await FirebaseFirestore.instance
//           .collection('Posts')
//           .doc(widget.postId)
//           .get();
//       var userPostData = snap.data()!;
//       setState(() {});
//       images.add(widget.mainPost['mainPost']);
//       images.addAll(await userPostData['posts']);
//     } catch (err) {
//       setState(() {
//         showSnackBar(err.toString(),context);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         toolbarHeight: 70,
//         title: Text(
//           'Post Pictures',
//           style: GoogleFonts.galdeano(
//             fontSize: 35,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               splashColor: Colors.greenAccent,
//               icon: const Icon(
//                 color: Colors.white,
//                 Icons.arrow_circle_left_outlined,
//                 size: 25,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             );
//           },
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
//         child: Center(
//           child: Container(
//               height: 350,
//               decoration: BoxDecoration(
//                   color: Colors.grey.shade100,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.shade500,
//                         offset: const Offset(0.0, 0.0),
//                         blurRadius: 5.0,
//                         spreadRadius: 1.0)
//                   ]),
//               child: CarouselSlider.builder(
//                 unlimitedMode: true,
//                 slideTransform: const CubeTransform(),
//                 slideIndicator: CircularWaveSlideIndicator(
//                   currentIndicatorColor: Colors.white,
//                   indicatorBackgroundColor: Colors.white70,
//                   padding: const EdgeInsets.only(
//                       bottom: 20.0, right: 40.0, left: 40.0),
//                 ),
//                 itemCount: images.length,
//                 slideBuilder: (int index) {
//                   return ClipRRect(
//                       borderRadius: BorderRadius.circular(5),
//                       child: Image(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(images[index]),
//                       ));
//                 },
//               )),
//         ),
//       ),
//     );
//   }
// }


///postDetailsUploadPage
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:housing_information_website/themes/theme.dart';
// import 'package:housing_information_website/widgets/detailsDropdown/floorDetails.dart';
//
// import '../widgets/detailsDropdown/areaDetails.dart';
// import '../widgets/detailsDropdown/bathroomsDetails.dart';
// import '../widgets/detailsDropdown/locationCityDetails.dart';
// import '../widgets/detailsDropdown/roomDetails.dart';
// import '../widgets/pageHeader.dart';
// import '../widgets/textInput.dart';
//
// class postDetailsUploadPage extends StatefulWidget {
//   const postDetailsUploadPage({super.key});
//
//   @override
//   State<postDetailsUploadPage> createState() => _postDetailsUploadPageState();
// }
//
// class _postDetailsUploadPageState extends State<postDetailsUploadPage> {
//   final _formKey1 = GlobalKey<FormState>();
//   bool isLoading = false;
//    TextEditingController acersController = TextEditingController();
//    TextEditingController roomController = TextEditingController();
//    TextEditingController bathroomController = TextEditingController();
//    TextEditingController locationController = TextEditingController();
//    TextEditingController locationSpecificController = TextEditingController();
//    TextEditingController descriptionController = TextEditingController();
//    TextEditingController priceController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const pageHeader(title: 'Property Details Upload Page', fontSize: 30, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 0, width: 0),
//         backgroundColor: Colors.white,
//       ),
//        body: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: [
//            Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 width: 500,
//                 height: 800,
//                 child: Form(
//                   key: _formKey1,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // //title
//                       // Padding(
//                       //   padding: const EdgeInsets.only(
//                       //       left: 18.0, right: 8.0, top: 8.0, bottom: 8.0),
//                       //   child: Row(
//                       //     children: [
//                       //       //title
//                       //       Text(
//                       //         'Set Your House\'s Details',
//                       //         style: GoogleFonts.poppins(
//                       //           color: Colors.black,
//                       //           fontSize: 30,
//                       //         ),
//                       //       )
//                       //     ],
//                       //   ),
//                       // ),
//                       // //instruction
//                       // Padding(
//                       //   padding: const EdgeInsets.only(
//                       //       left: 18.0, right: 8.0, top: 0.0, bottom: 0.0),
//                       //   child: Row(
//                       //     children: [
//                       //       Text(
//                       //         'fill in all fields before moving to the next step',
//                       //         style: GoogleFonts.poppins(
//                       //             color: Colors.black,
//                       //             fontSize: 18,
//                       //             fontWeight: FontWeight.w300)
//                       //         ,
//                       //       ),
//                       //     ],
//                       //   ),
//                       // ),
//                       //detailedLocation
//                       const Padding(
//                         padding: EdgeInsets.only(left: 10.0),
//                         child: pageHeader(title: 'Add Post Details', fontSize: 40, mainAxisAlignment: MainAxisAlignment.start, fontWeight: FontWeight.w400, height: 0, width: 0),
//                       ),
//                       textInput(
//                           controller: locationSpecificController,
//                           hinty: 'Enter Street/Ward Location',
//                           icon: Icons.location_on_outlined,
//                           obscureText: false,
//                           textInputType: TextInputType.streetAddress,
//                           textCapitalization: TextCapitalization.none,
//                         validation: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter your the location';
//                           }
//                           return null;
//                         },
//                       ),
//                       //Description
//                       textInput(
//                           controller: descriptionController,
//                           hinty: 'Enter Description',
//                           icon: Icons.add_comment_outlined,
//                           obscureText: false,
//                           textInputType: TextInputType.name,
//                           textCapitalization: TextCapitalization.none,
//                         validation: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please Enter a Description';
//                           }
//                           return null;
//                         },),
//                       textInput(
//                           controller: priceController,
//                           hinty: 'Enter Price',
//                           icon: Icons.payments_outlined,
//                           obscureText: false,
//                           textInputType: TextInputType.number,
//                           textCapitalization: TextCapitalization.none,
//                         validation: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please Enter Property Price';
//                           }
//                           return null;
//                         },),
//                       //locationDropdown
//                       locationCityDetails(textController: locationController,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           //floorDetailsDropdown
//                           floorDetails(textController: roomController),
//                           //roomDetailsDropdown
//                           roomDetails(textController: roomController),
//                         ],
//                       ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         //bathroomsDetailsDropdown
//                         bathroomsDetails(textController: bathroomController,),
//                         //acersDetailsDropdown
//                         areaDetails(textController: acersController,),
//                       ],
//                     ),
//                       //ok/nextButton
//                       Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Container(
//                           width: 480,
//                           padding: const EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15.0),
//                               color: lRed
//                           ),
//                           //ifStatement alternative
//                           child: isLoading
//                               ?
//                           //loadingProgressionAlternative
//                           Center(
//                             child: CircularProgressIndicator(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .inversePrimary,
//                               strokeWidth: 4,
//                             ),
//                           )
//                               :
//                           //buttonAlternative
//                           IconButton(
//                             onPressed: (){
//                               if (_formKey1.currentState!.validate()) {
//                                 // If the form is valid, then invoke the API or whatever you want
//
//                               }
//                             },
//                             icon: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Next',
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 24,
//                                       color: Colors.white
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//          ],
//        )
//     );
//   }
// }


///imageUploadPage
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:housing_information_website/impVariable.dart';
// import 'package:housing_information_website/themes/theme.dart';
// import 'package:housing_information_website/widgets/pageHeader.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../utils.dart';
//
// class imageUploadPage extends StatefulWidget {
//   const imageUploadPage({super.key});
//
//   @override
//   _imageUploadPageState createState() => _imageUploadPageState();
// }
//
// class _imageUploadPageState extends State<imageUploadPage> {
//   Uint8List? imageUpload;
//   final picker = ImagePicker();
//
//   _selectImage(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return SimpleDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             backgroundColor: Colors.red,
//             title: Text(
//               'Choose Upload Method',
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             ),
//             children: [
//               SimpleDialogOption(
//                 padding: const EdgeInsets.all(15),
//                 child: Text(
//                   '   Take a Photo',
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () async {
//                   Navigator.pop(context);
//                   Uint8List file = await pickImage(ImageSource.camera);
//                   setState(() {
//                     imageUpload = file;
//                   });
//                 },
//               ),
//               SimpleDialogOption(
//                 padding: const EdgeInsets.all(15),
//                 child: Text(
//                   '   Choose from Gallery',
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () async {
//                   Navigator.pop(context);
//                   Uint8List file = await pickImage(ImageSource.gallery);
//                   setState(() {
//                     imageUpload = file;
//                   });
//                 },
//               ),
//               SimpleDialogOption(
//                 padding: const EdgeInsets.all(15),
//                 child: Text(
//                   '   Cancel',
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () async {
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: pRed,
//       appBar: AppBar(
//         title: const pageHeader(title: 'Image Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
//             backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: AspectRatio(
//           aspectRatio: 4/3,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               padding: const EdgeInsets.all(8.0) ,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: lRed,
//                   width: .5,
//                 ),
//                 borderRadius: BorderRadius.circular(20.0)
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   imageUpload != null
//                       ? Container(
//                     width: 900,
//                     height: 600,
//                     decoration: BoxDecoration(
//                       color: pRed,
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(
//                         color: lRed,
//                         width: .5
//                       ),
//                       image: DecorationImage(
//                           image:  MemoryImage(imageUpload!)
//                       )
//                     ),
//                   )
//                       :  Container(
//                     width: 900,
//                     height: 600,
//                     padding: const EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       color: pRed,
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(
//                           color: lRed,
//                           width: .5
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                           'No image selected Yet...',
//                         style: GoogleFonts.poppins(
//                             color:Colors.black,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 20.0
//                                               ),
//                                             ),
//                     ),
//                       ),
//                   sbH20,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           _selectImage(context);
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(15.0),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: lRed,
//                                   width: .5
//                               ),
//                               borderRadius: BorderRadius.circular(20.0)
//                           ),
//                           child:  Text(
//                             'Select Image',
//                             style: GoogleFonts.poppins(
//                                 color:lRed,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 20.0,
//                               letterSpacing: 1.5,
//                               wordSpacing: 2.0
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: (){
//                          setState(() {
//                            navIndex2 =1;
//                          });
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(15.0),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: lRed,
//                                   width: .5
//                               ),
//                               borderRadius: BorderRadius.circular(20.0)
//                           ),
//                           child: Text(
//                             'Upload Image',
//                             style: GoogleFonts.poppins(
//                                 color:lRed,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 20.0,
//                               letterSpacing: 1.5,
//                               wordSpacing: 2.0
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Example function to upload the image to your server or API
//   void uploadImage(File image) async {
//     // Your upload logic here
//     // For example:
//     // final url = 'https://your-server.com/upload-image';
//     // final request = http.MultipartRequest('POST', Uri.parse(url));
//     // request.files.add(http.MultipartFile.fromBytes(
//     //   'image',
//     //   image.readAsBytesSync(),
//     //   filename: 'image.jpg',
//     // ));
//     // final response = await request.send();
//     // if (response.statusCode == 200) {
//     //   print('Image uploaded successfully');
//     // } else {
//     //   print('Error uploading image');
//     // }
//   }
// }


///geoPointUploadPage
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:housing_information_website/impVariable.dart';
// import 'package:housing_information_website/themes/theme.dart';
//
//
// class geoPointUploadPage extends StatefulWidget {
//   const geoPointUploadPage({super.key});
//
//   @override
//   State<geoPointUploadPage> createState() => _geoPointUploadPageState();
// }
//
// class _geoPointUploadPageState extends State<geoPointUploadPage> {
//   // Location locationController = Location();
//   // LatLng? _userLocation;
//   late GoogleMapController googleMapController;
//   CameraPosition? initialPosition;
//   Set<Marker> marker = {};
//   late GeoPoint loca;
//   bool instructionClosed = false;
//   bool locationSet = false;
//   @override
//   void initState(){
//     super.initState();
//     _determinePosition();
//     clientLocations();
//   }
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location Service are disabled');
//     }
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location Permission Denied');
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location Permission are Denied Permanently change Settings');
//     }
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       initialPosition = CameraPosition(
//           target: LatLng(position.latitude, position.longitude), zoom: 20);
//     });
//     return position;
//   }
//   clientLocations() async {
//     Position position = await _determinePosition();
//     marker.clear();
//     marker.add(
//         Marker(
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
//         visible: true,
//         zIndex: 5,
//         markerId: const MarkerId('Your Location'),
//         draggable: true,
//         position: LatLng(position.latitude, position.longitude),
//         onDragEnd: (loc) {
//           setState(() {
//             locationSet = true;
//             loca = GeoPoint(loc.latitude, loc.longitude);
//           });
//         }));
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(50.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30.0),
//           child:  initialPosition == null
//                 ?Center(
//         child: SizedBox(
//           height: 100,
//           width: 100,
//           child: CircularProgressIndicator(
//             strokeWidth: 5,
//             color: Colors.green.shade200,
//           ),
//         ),
//       )
//               : Stack(
//             children: [
//                   GoogleMap(
//                     onMapCreated: (GoogleMapController controller) {
//                       googleMapController = controller;
//                     },
//                     initialCameraPosition: initialPosition!,
//                     zoomControlsEnabled: false,
//                     markers: marker,
//                   ),
//                   instructionClosed? sb0: Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: 500,
//                       height: 300,
//                       padding: const EdgeInsets.all(20.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20.0),
//                         boxShadow: basicShadow
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: 'Map Location Setting Instructions:\n',
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 24,
//                                     color: lRed,
//                                     letterSpacing: 1.5,
//                                     wordSpacing: 2
//                                   )
//                                 ),
//                                 TextSpan(
//                                   text: ' Tap and Drag the Red Pin on Your Location on the Map at the Center Of The Screen Behind this Instructions Banner and Move to the Position of The Property a option to continue will appear to the Bottom Right of your Screen when completed correctly ',
//                                   style: GoogleFonts.rajdhani(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   )
//                                 )
//                               ]
//                             ),
//                           ),
//                           sbH10,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                   color: lRed,
//                                   borderRadius: BorderRadius.circular(10.0)
//                                 ),
//                                 child: TextButton(onPressed: (){
//                                   setState(() {
//                                     instructionClosed = true;
//                                   });
//                                 }, child: Text(
//                                   'CLOSE',
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 20,
//                                     color: Colors.white
//                                   ),
//                                 )),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   locationSet ? Align(
//                     alignment: Alignment.bottomRight,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(20.0),
//                         decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             borderRadius: BorderRadius.circular(15.0),
//                           border: Border.all(
//                             color: lRed,
//                             width: .5,
//                           )
//                         ),
//                         child: TextButton(onPressed: (){
//                           setState(() {
//                             instructionClosed = true;
//                           });
//                         }, child: Text(
//                           'Finish Property Post',
//                           style: GoogleFonts.poppins(
//                               fontSize: 20,
//                               color: lRed
//                           ),
//                         )),
//                       ),
//                     ),
//                   ):sb0,
//                 ],
//               )
//         ),
//       ),
//     );
//   }
// }



///importantVariables
// import 'package:flutter/material.dart';
//
// FontWeight w100 = FontWeight.w100;
// FontWeight w200 = FontWeight.w200;
// FontWeight w300 = FontWeight.w300;
// FontWeight w400 = FontWeight.w400;
// FontWeight w500 = FontWeight.w500;
// FontWeight w600 = FontWeight.w600;
// FontWeight w700 = FontWeight.w700;
// FontWeight w800 = FontWeight.w800;
// FontWeight w900 = FontWeight.w900;
// FontWeight wBold = FontWeight.bold;
// FontWeight wNrml = FontWeight.normal;
//
// String jeLogo = 'lib/images/jeLogo.jpg';
// String dpImage = 'lib/images/dp.jpg';
// String constructionImage = 'lib/images/constructionImage.png';
// String buildingEquipment = 'lib/images/buildingEquipment.jpg';
// String hotel = 'lib/images/hotel.jpg';
// String landscapeCity = 'lib/images/landscapeCity.jpg';
// String buildings = 'lib/images/buildings.jpg';
// String illustrationImage = 'lib/images/illustrationImage.png';
// String prpty3 = 'lib/images/prpty3.jpg';
// String prpty4 = 'lib/images/prpty4.jpg';
// String prpty2 = 'lib/images/prpty2.jpg';
// String prpty1 = 'lib/images/prpty1.jpg';
// String lndScp = 'lib/images/lndScp.jpg';
// String hs1 = 'lib/images/hs1.jpg';
// String hs2 = 'lib/images/hs2.jpg';
// String hs3 = 'lib/images/hs3.jpg';
// String hs4 = 'lib/images/hs4.jpg';
// String hs5 = 'lib/images/hs5.jpg';
// String avatar = 'lib/images/avatar.jpg';
//
//
//
// String title = 'Joinsmart Estates';
// String userName = 'KWAME PETER MUSHI';
// String titleCptl = 'JOINSMART ESTATES ';
// int navIndex =0;
// int navIndex2 =0;
//
//
// SizedBox sb0 = const SizedBox(width: 0);
// SizedBox sb2 = const SizedBox(width: 2);
// SizedBox sb5 = const SizedBox(width: 5);
// SizedBox sb10 = const SizedBox(width: 10,);
// SizedBox sb15 = const SizedBox(width: 15,);
// SizedBox sb20 = const SizedBox(width: 20,);
// SizedBox sb25 = const SizedBox(width: 25,);
// SizedBox sb30 = const SizedBox(width: 30,);
// SizedBox sb35 = const SizedBox(width: 35,);
// SizedBox sb40 = const SizedBox(width: 40,);
// SizedBox sb45 = const SizedBox(width: 45,);
// SizedBox sb50 = const SizedBox(width: 50,);
// SizedBox sb55 = const SizedBox(width: 55,);
// SizedBox sb60 = const SizedBox(width: 60,);
// SizedBox sb65 = const SizedBox(width: 65,);
// SizedBox sb70 = const SizedBox(width: 70,);
// SizedBox sb75 = const SizedBox(width: 75,);
// SizedBox sb80 = const SizedBox(width: 80,);
// SizedBox sb85 = const SizedBox(width: 85,);
// SizedBox sb90 = const SizedBox(width: 90,);
// SizedBox sb95 = const SizedBox(width: 95,);
// SizedBox sb100 = const SizedBox(width: 100,);
//
// SizedBox sbH2 = const SizedBox(height: 2);
// SizedBox sbH5 = const SizedBox(height: 5);
// SizedBox sbH8 = const SizedBox(height: 8);
// SizedBox sbH10 = const SizedBox(height: 10,);
// SizedBox sbH15 = const SizedBox(height: 15,);
// SizedBox sbH20 = const SizedBox(height: 20,);
// SizedBox sbH25 = const SizedBox(height: 25,);
// SizedBox sbH30 = const SizedBox(height: 30,);
// SizedBox sbH35 = const SizedBox(height: 35,);
// SizedBox sbH40 = const SizedBox(height: 40,);
// SizedBox sbH45 = const SizedBox(height: 45,);
// SizedBox sbH50 = const SizedBox(height: 50,);
// SizedBox sbH55 = const SizedBox(height: 55,);
// SizedBox sbH60 = const SizedBox(height: 60,);
// SizedBox sbH65 = const SizedBox(height:  65,);
// SizedBox sbH70 = const SizedBox(height: 70,);
// SizedBox sbH75 = const SizedBox(height: 75,);
// SizedBox sbH80 = const SizedBox(height: 80,);
// SizedBox sbH85 = const SizedBox(height: 85,);
// SizedBox sbH90 = const SizedBox(height: 90,);
// SizedBox sbH95 = const SizedBox(height: 95,);
// SizedBox sbH100 = const SizedBox(height: 100,);
//
// LinearGradient blueGradient = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.center,
//   colors: [
//     Colors.blue.shade800,
//     Colors.blue.shade700,
//     Colors.blue.shade600,
//   ],
//   transform:  const GradientRotation(.0),
// );
//
// List<BoxShadow> basicShadow = [
//   BoxShadow(
//       color: Colors.grey.shade500,
//       offset: const Offset(4.0, 4.0),
//       blurRadius: 10.0,
//       spreadRadius: 1.0
//   ),
//   BoxShadow(
//       color: Colors.grey.shade400,
//       offset: const Offset(4.0, 4.0),
//       blurRadius: 10.0,
//       spreadRadius: 1.0
//   )
// ];
//


///gridImageSection
//// Images Section
// Text(
// "Images",
// style: GoogleFonts.poppins(
// color: selectedColor,
// fontSize: 40,
// fontWeight: FontWeight.w500,
// ),
// ),
// sbH10,
// GridView.count(
// crossAxisCount: 2,
// childAspectRatio: 3/2,
// shrinkWrap: true,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8.0),
// boxShadow: basicShadow,
// image: DecorationImage(
// image: AssetImage(constructionImage),
// fit: BoxFit.fill,
// )
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8.0),
// boxShadow: basicShadow,
// image: DecorationImage(
// image: AssetImage(constructionImage),
// fit: BoxFit.fill,
// )
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8.0),
// boxShadow: basicShadow,
// image: DecorationImage(
// image: AssetImage(constructionImage),
// fit: BoxFit.fill,
// )
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8.0),
// boxShadow: basicShadow,
// image: DecorationImage(
// image: AssetImage(constructionImage),
// fit: BoxFit.fill,
// )
// ),
// ),
// ),
// ],
// ),
// sbH2,sbH2,sbH2,sbH2,sbH20,