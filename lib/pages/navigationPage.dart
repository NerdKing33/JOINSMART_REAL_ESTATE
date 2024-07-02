import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/pages/aboutPage.dart';
import 'package:housing_information_website/pages/accountPage.dart';
import 'package:housing_information_website/pages/geoPointUploadPage.dart';
import 'package:housing_information_website/pages/homePage.dart';
import 'package:housing_information_website/pages/logInPage.dart';
import 'package:housing_information_website/pages/propertiesPage.dart';
import 'package:housing_information_website/pages/servicesPage.dart';
import 'package:housing_information_website/pages/signUpPage.dart';
import 'package:housing_information_website/pages/imageUploadPage.dart';
import 'package:housing_information_website/utils.dart';

import '../impVariable.dart';
import '../themes/theme.dart';

class navigationPage extends StatefulWidget {

   navigationPage({super.key});

  @override
  State<navigationPage> createState() => _navigationPageState();
}

class _navigationPageState extends State<navigationPage> {

   final List<Widget> _pages = [
     const homePage(),
     const propertiesPage(),
     const servicesPage(),
     aboutPage(),
     imageUploadPage(),
     const accountPage(),
     signUpPage(),
     logInPage(),
   ];
  var userData = {};
  @override
  void initState() {
    super.initState();
    addUserData();
  }
  addUserData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = snap.data()!;
      setState(() {});
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        toolbarHeight:80 ,
        leading: null,
        title: SizedBox(
          height: 75,
          width: MediaQuery.of(context).size.width +60,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                    ///theUpperLeftChatter
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          border: Border.all(
                            color: lRed,
                            width: .5,
                          )
                      ),
                      child: IconButton(
                          hoverColor: Colors.white24,
                          highlightColor: pRed,
                          onPressed: (){
                            setState(() {
                              navIndex = 0;
                            });
                          },
                          icon: Row(
                            children: [
                              ///theLogo
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: lRed,
                                      width: 1.0
                                  ),
                                 shape: BoxShape.circle,
                                  color: Colors.transparent,
                                ),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(jeLogo),
                                  radius: 18,
                                ),
                              ),
                              sb5,
                              ///theTitle
                              Text(
                                titleCptl,
                                style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color:  lRed,
                                    letterSpacing: 1.5,
                                    wordSpacing: 2.0
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    ///these AreTheNavButtons
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          border: Border.all(
                            color: lRed,
                            width: .5,
                          )
                        ),
                        child: ButtonBar(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: navIndex == 0 ?pRed : Colors.white,
                              ),
                              child: IconButton(
                                  hoverColor: Colors.black12,
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 0;
                                    });
                                  },
                                  icon: Text(
                                    'HOME',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 0 ? lRed:Colors.grey[700],
                                        fontSize: 14,
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: navIndex == 1 ?pRed : Colors.white,
                              ),
                              child: IconButton(
                                  hoverColor: Colors.black12,
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 1;
                                    });
                                  },
                                  icon: Text(
                                    'PROPERTIES',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 1 ? lRed:Colors.grey[700] ,
                                        fontSize: 14,
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: navIndex == 2 ?pRed : Colors.white,
                              ),
                              child: IconButton(
                                  hoverColor: Colors.black12,
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 2;
                                    });
                                  },
                                  icon: Text(
                                    'SERVICES',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 2 ?lRed:Colors.grey[700] ,
                                        fontSize: 14
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: navIndex == 3 ?pRed : Colors.white,
                              ),
                              child: IconButton(
                                  hoverColor: Colors.black12,
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 3;
                                    });
                                  },
                                  icon: Text(
                                    'ABOUT',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 3 ?lRed:Colors.grey[700] ,
                                        fontSize: 14
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///theRightMostSideOfTheAppBar
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: navIndex == 5
                            ?[
                          Container(
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                                border: Border.all(
                                  color: lRed,
                                  width: .5,
                                )
                            ),
                            child:  Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: pRed,
                                    image: DecorationImage(
                                        image: userData['profilePic']!=null?NetworkImage(userData['profilePic']):AssetImage(avatar),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                sb10,
                                userData['username']== null?const Text(''):Text(
                                  '${userData['username']}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: lRed
                                  ),
                                ),
                              ],
                            )
                          ),
                        ]
                            :[
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                                border: Border.all(
                                  color: lRed,
                                  width: .5,
                                )
                            ),
                            child: IconButton(
                                onPressed: (){},
                                icon:Text(
                                  'CONTACT US',
                                  style: GoogleFonts.poppins(
                                    color: lRed,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                )
                            ),
                          ),
                          sb5,sb2,
                          Container(
                            padding: const EdgeInsets.all(.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: lRed,
                                border: Border.all(
                                  color: lRed,
                                  width: .5,
                                )
                            ),
                            child: Center(
                            child: userData['uid'] != null
                                  ?  Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: IconButton(
                                      hoverColor: Colors.white38,
                                      highlightColor: lRed,
                                      onPressed: (){
                                        setState(() {
                                          navIndex = 5;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.person_outline_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                  :Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                    onPressed: (){
                                      Navigator.of(context).pushReplacementNamed('/signUpPage');
                                    },
                                        icon: Text(
                                          'SIGN UP',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                          ),
                                        )
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]
              )
            ],
          ),
        ),
      ),
      body: _pages[navIndex],
    );
  }
}
