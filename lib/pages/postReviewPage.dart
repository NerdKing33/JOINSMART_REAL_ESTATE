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
