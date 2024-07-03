import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/pages/multiUploadPage.dart';
import 'package:housing_information_website/pages/propertyManagmentPage.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:housing_information_website/widgets/containers/quickAccessContainer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

import '../resources/auth.dart';
import '../resources/utils.dart';
import '../widgets/pageHeader.dart';

class accountPage extends StatefulWidget {

  const accountPage({
    super.key,
  });

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  var userData = {};
  @override
  void initState() {
    super.initState();
    addDataPost();
  }

  cont(){
    return context;
  }
  addDataPost() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = snap.data()!;
      setState(() {});
    } catch (err) {
      setState(() {
        showSnackBar(err.toString(),context);
      });
    }
  }

  _signOut(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: lRed,
            title: Text(
              'Do You Want To Sign Out',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Yes',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  String res = await AuthMethods().signOut();
                  if (res == 'Success') {
                    showSnackBar('Sgned Out', cont());
                    setState(() {
                      navIndex=0;
                    });
                    Navigator.of(cont()).pushReplacementNamed('/navigationPage');
                  } else {
                    showSnackBar('Sign Out Failed', cont());
                  }
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   No',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
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
      body: userData.isEmpty?Center(
       child: Container(
         padding: const EdgeInsets.all(10.0),
         width: 300,
         height: 300,
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(15.0)
         ),
         child: Center(
             child: CircularProgressIndicator(
               color: lRed,
               strokeWidth: 4,
             )
         ),
       ),
     ): Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sbH20,
                // Profile Picture
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: pRed,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: userData['profilePic']!=''?NetworkImage(userData['profilePic']):AssetImage(avatar),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                sbH20,
                Container(
                  width: 600,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 580,
                    decoration: BoxDecoration(
                      color: pRed,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children:  [
                        userData['userTitle'] == 'Admin' ?  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            quickAccessContainer(icon: Container(
                              padding: const EdgeInsets.all(.0),
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: pRed,
                              ),
                              child: IconButton(
                                tooltip:'Upload New Property',
                                icon:Icon(Icons.upload_outlined, color: lRed,),
                                onPressed: (){ Navigator.of(context).push(
                                    PageTransition(
                                        duration: const Duration(milliseconds: 300),
                                        child:  const multiUploadPage(),
                                        type: PageTransitionType.bottomToTop
                                    )
                                );
                                  },
                              ),
                            ), text: 'Upload', func: () {},),
                            quickAccessContainer(icon: Container(
                              padding: const EdgeInsets.all(.0),
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: pRed,
                              ),
                              child: IconButton(
                                tooltip:'Manage Existing Posts',
                                icon:Icon(Icons.real_estate_agent_outlined, color: lRed,),
                                onPressed: (){ Navigator.of(context).push(
                                    PageTransition(
                                        duration: const Duration(milliseconds: 300),
                                        child:  const propertyManagementPage(),
                                        type: PageTransitionType.bottomToTop
                                    )
                                );
                                },
                              ),
                            ), text: 'Posts', func: () {  },),
                            quickAccessContainer(icon: Container(
                              padding: const EdgeInsets.all(.0),
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: pRed,
                              ),
                              child: IconButton(
                                tooltip:'Change The Website Contact Information',
                                icon:Icon(Icons.contact_mail_outlined, color: lRed,),
                                onPressed: (){},
                              ),
                            ), text: 'Info', func: () {  },),
                            quickAccessContainer(icon: Container(
                              padding: const EdgeInsets.all(.0),
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: pRed,
                              ),
                              child: IconButton(
                                tooltip:'Change Images Used in the Website',
                                icon:Icon(Icons.photo_library_outlined, color: lRed,),
                                onPressed: (){},
                              ),
                            ), text: 'Images', func: () {  },),
                            quickAccessContainer(icon: Container(
                              padding: const EdgeInsets.all(.0),
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: pRed,
                              ),
                              child: IconButton(
                                tooltip:'Update Services Details',
                                icon:Icon(MdiIcons.tools, color: lRed,),
                                onPressed: (){},
                              ),
                            ), text: 'Services', func: () {  },),
                          ],
                        ):sb0,
                        userData['userTitle'] == 'Admin' ?  sbH10:sb0,
                        userData['userTitle'] == 'Admin' ?  Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child:ListTile(
                              leading: CircleAvatar(
                                backgroundColor: pRed,
                                child:  Icon(
                                  Icons.admin_panel_settings_outlined,
                                  color: lRed,
                                ),
                              ),
                              title: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Administrator',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: lRed,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              subtitle: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Account Status',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w200
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                            )):sb0,
                        userData['userTitle'] == 'Admin' ? sbH5:sb0,
                        userData['username'] != null ? Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child:ListTile(
                              leading: CircleAvatar(
                                backgroundColor: pRed,
                                child:  Icon(
                                  Icons.person_outlined,
                                  color: lRed,
                                ),
                              ),
                              title: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: userData['username'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: lRed,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              subtitle: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Account Name',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w200
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.all(.0),
                                decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: pRed,
                                ),
                                child: IconButton(
                                  tooltip:  userData['username'] != null ?'Edit Info':'Add Info',
                                  icon: userData['username'] != null ? Icon(Icons.edit_outlined, color: lRed,):Icon(Icons.add, color: lRed,),
                                  onPressed: (){},
                                ),
                              ),
                            )):sb0,
                        userData['username'] != null ? sbH5:sb0,
                        userData['userNumber'] != null ? Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child:ListTile(
                              leading: CircleAvatar(
                                backgroundColor: pRed,
                                child:  Icon(
                                  Icons.phone_outlined,
                                  color: lRed,
                                ),
                              ),
                              title: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: userData['userNumber'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: lRed,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              subtitle: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Phone Number',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w200
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.all(.0),
                                decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: pRed,
                                ),
                                child: IconButton(
                                  tooltip:  userData['username'] != null ?'Edit Info':'Add Info',
                                  icon: userData['userNumber'] != null ? Icon(Icons.edit_outlined, color: lRed,):Icon(Icons.add, color: lRed,),
                                  onPressed: (){},
                                ),
                              ),
                            )):sb0,
                        userData['userNumber'] != null ?sbH5:sb0,
                        userData['userEmail'] != null ?Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child:ListTile(
                              leading: CircleAvatar(
                                backgroundColor: pRed,
                                child:  Icon(
                                  Icons.alternate_email_outlined,
                                  color: lRed,
                                ),
                              ),
                              title: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: userData['userEmail'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: lRed,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              subtitle: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Email Handle',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w200
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.all(.0),
                                decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: pRed,
                                ),
                                child: IconButton(
                                  tooltip:  userData['username'] != null ?'Edit Info':'Add Info',
                                  icon: userData['userEmail'] != null ? Icon(Icons.edit_outlined, color: lRed,):Icon(Icons.add, color: lRed,),
                                  onPressed: (){},
                                ),
                              ),
                            )):sb0,
                        userData['userEmail'] != null ?sbH10:sb0,
                        userData['uid']!=null?InkWell(
                          onTap: (){ _signOut(context);},
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color:lRed,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sign Out',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sb5,
                                const Icon(
                                  Icons.logout_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ):sb0,
                      ],
                    ),
                  ),
                ),
                sbH50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('by nk',
                      style: GoogleFonts.rajdhani(
                        color: const Color.fromRGBO(3, 5, 77, .3),
                        fontSize: 13,
                      ),),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}