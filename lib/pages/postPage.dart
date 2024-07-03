import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:housing_information_website/pages/mapPage.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import '../impVariable.dart';
import '../resources/firebaseStorage.dart';
import '../themes/theme.dart';
import '../resources/utils.dart';

class postPage extends StatefulWidget {
  final String postId;

  const postPage({
    super.key,
     required this.postId,
  });

  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  var userPostData = {};
  List<dynamic> images = [];

  @override
  void initState() {
    super.initState();
    postData();
  }
  
  postData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Posts')
          .doc(widget.postId)
          .get();
      userPostData = snap.data()!;
      setState(() {});
      images.add(await userPostData['mainPost']);
      images.addAll(await userPostData['secondaryPosts']);
    } catch (err) {
      setState(() {
        showSnackBar(err.toString(),context);
      });
    }
  }

  _deletePost(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: lRed,
            title: Text(
              'Do You Want To Delete Post',
              style: GoogleFonts.galdeano(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Yes',
                  style: GoogleFonts.rajdhani(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  String res = await storageMethods().deletePost(widget.postId);
                  if (res == 'success') {
                    setState(() {
                      showSnackBar(res,context);
                      Navigator.pop(context);
                    });

                  } else {
                    setState(() {
                      showSnackBar('Delete Failed',context);
                    });
                  }
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   No',
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

  infoCard( String title, String info ){
    return showDialog(context: context, builder: (context){
      return  AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: lRed,
                      letterSpacing: 1.5,
                      wordSpacing: 2,
                      fontSize: 30
                  ),
                )
              ]
          ),
        ),
        content:  RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: info,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      wordSpacing: 2,
                      fontSize: 24
                  ),
                )
              ]
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: lRed,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Text(
                  'CLOSE',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),
                )
            ),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return userPostData['uid'] == null
        ? Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 950,
        height: 790,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey.shade200,
           ),
        child: Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: lRed,
            ),
          ),
        ),
      ),
    )
        : Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 950,
        height: 790,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            ///propertyTitleAreaAndActionWidgets
            Container(
              height: 80,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: userPostData['uid'] == null
                    ? [
                  pageHeader(
                    upperCase: '${userPostData['propertyTitle']} - ${userPostData['propertyType']}', fontSize: 20, mainAxisAlignment: MainAxisAlignment.start, fontWeight: FontWeight.w300, height: 0, width: 2, color: Colors.black,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            highlightColor: lRed,
                            hoverColor: pRed,
                            onPressed: (){},
                            icon: Icon(
                              Icons.bookmark_add_outlined,
                              color: lRed,
                            )),
                        IconButton(
                            highlightColor: lRed,
                            hoverColor: pRed,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: lRed,
                            )),
                      ],
                    ),
                  )
                ]
                    : [
                  pageHeader(
                    upperCase: '${userPostData['propertyTitle']} - ${userPostData['propertyType']}', fontSize: 20, mainAxisAlignment: MainAxisAlignment.start, fontWeight: FontWeight.w300, height: 0, width: 2, color: Colors.black,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            highlightColor: lRed,
                            hoverColor: pRed,
                            onPressed: (){},
                            icon: Icon(
                              Icons.bookmark_add_outlined,
                              color: lRed,
                            )),
                        IconButton(
                            highlightColor: lRed,
                            hoverColor: pRed,
                            onPressed: (){},
                            icon: Icon(
                              Icons.edit_outlined,
                              color: lRed,
                            )),
                        IconButton(
                            hoverColor: pRed,
                            highlightColor: lRed,
                            onPressed: () {
                              _deletePost(context);
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: lRed,
                            )),
                        IconButton(
                            highlightColor: lRed,
                            hoverColor: pRed,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: lRed,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            sbH10,
            SizedBox(
              height: 420,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 410,
                    width: 300,
                    child: Container(
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        image:  DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage(
                                '${userPostData['mainPost']}'
                            )
                        ),
                      ),
                    ),
                  ),
                  sb10,
                  SizedBox(
                    width: 620,
                    height: 420,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              width: 440,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.payments_outlined,
                                              color: lRed,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '  TShs ',
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 20,
                                                          color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: '${userPostData['price']}/${userPostData['paymentPeriod']}',
                                                      style: GoogleFonts.galdeano(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 25,
                                                          color: Colors.black),
                                                    )
                                                  ]
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: lRed,
                                    thickness: .5,
                                  ),
                                  Row(
                                    children: [
                                      TextButton(onPressed: (){}, child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.bed_outlined,
                                            color: lRed,
                                          ),
                                          sb5,
                                          Text(
                                            '${userPostData['noRooms']}',
                                            style: GoogleFonts.galdeano(
                                                fontSize: 20,
                                                color: Colors.black
                                            ),
                                          ),
                                        ],
                                      )),
                                      sb5,
                                      TextButton(onPressed: (){}, child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.bathtub_outlined,
                                            color: lRed,
                                          ),
                                          sb5,
                                          Text(
                                            '${userPostData['noBathrooms']}',
                                            style: GoogleFonts.galdeano(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )),
                                      sb0,
                                      TextButton(onPressed: (){}, child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            MdiIcons.landPlotsMarker,
                                            color: lRed,
                                          ),
                                          sb5,
                                          RichText(
                                            text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:     '${userPostData['area'] }',
                                                    style: GoogleFonts.galdeano(
                                                        fontSize: 20,
                                                        color: Colors.black
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ft',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.black),
                                                  ),
                                                  WidgetSpan(
                                                    child: Transform.translate(
                                                      offset: const Offset(2, -4),
                                                      child: Text(
                                                        '2',
                                                        style: GoogleFonts.galdeano(
                                                            fontSize: 14,
                                                          color: Colors.black
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]
                                            ),
                                          ),
                                        ],
                                      )),
                                      sb0,
                                      TextButton(onPressed: (){}, child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            MdiIcons.floorPlan,
                                            color: lRed,
                                          ),
                                          sb2,
                                          RichText(
                                            text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:     '${userPostData['noFloors'] }',
                                                    style: GoogleFonts.galdeano(
                                                        fontSize: 20,
                                                        color: Colors.black
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' floors',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.black),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                  Divider(
                                    color: lRed,
                                    thickness: .5,
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Row(children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: lRed,
                                      ),
                                      sb5,
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:  '${userPostData['propertyLocation']}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    letterSpacing: 1,
                                                    wordSpacing: 1,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black),
                                              )
                                            ]
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            sb5,
                            Container(
                              width: 175,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: Colors.red.shade300,
                                            width: .5,
                                          )
                                      ),
                                      child:Text(
                                        'Property OnSale',
                                        style: GoogleFonts.poppins(
                                          color: lRed,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      )
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: lRed,
                                    ),
                                    child: IconButton(
                                        highlightColor:Colors.white,
                                        hoverColor: Colors.white10,
                                        onPressed: (){
                                          infoCard('Agents Contact Info:', userPostData['agentNumber']);
                                        },
                                        icon:Text(
                                          'Contact Agent',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        sbH10,
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    wordSpacing: 1
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Published On: ${DateFormat.yMMMd().format(userPostData['datePublished'].toDate())}\n',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${userPostData['description']}',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black)),
                                  ]))
                            ],
                          ),
                        ),
                        sbH10,
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 260,
              child: Row(
                children: [
                  Container(
                    width:555,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListView.builder(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Stack(
                              children: [
                                Container(
                                  height: 260,
                                  width: 260,
                                  decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            images[index],
                                          )
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black26
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${index+1}',
                                        style: GoogleFonts.galdeano(
                                            color:Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  sb10,
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 360,
                        height: 260,
                        decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.green.shade600,
                              width: .5,
                            )
                        ),
                     child:   GoogleMap(
                          initialCameraPosition: CameraPosition(target: LatLng(userPostData['mapLocation'].latitude, userPostData['mapLocation'].longitude),zoom: 18),
                          markers: {
                            Marker(
                              markerId: const MarkerId('Property Location'),
                              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                              position: LatLng(userPostData['mapLocation'].latitude, userPostData['mapLocation'].longitude),
                            )
                          },

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.black12,
                              border: Border.all(
                                color: Colors.green.shade200,
                                width: .5,
                              )
                          ),
                          child: IconButton(
                              onPressed: (){
                                Navigator.of(context).push(PageTransition(
                                    child: mapPage(loca: userPostData['mapLocation']),
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 300)));
                              },
                              icon:Text(
                                'Map Location ',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
