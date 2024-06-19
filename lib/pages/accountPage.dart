import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/pageHeader.dart';

class accountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pRed,
      appBar: AppBar(
        title: const pageHeader(title: 'Account Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      width: MediaQuery.of(context).size.width*.35,
                      height: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: basicShadow,
                        image: DecorationImage(
                            image: AssetImage(dpImage),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    sb20,
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 580,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: basicShadow,
                      ),
                      child: Column(
                        children:  [
                          Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child:ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: lRed,
                                  child: const Icon(
                                    Icons.person_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: userName,
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
                              )),
                          sbH5,
                          Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.0)
                              ),
                              child:ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: lRed,
                                  child: const Icon(
                                    Icons.phone_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '+255 743 522 226',
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
                              )),
                          sbH5,
                          Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.0)
                              ),
                              child:ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: lRed,
                                  child: const Icon(
                                    Icons.alternate_email_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'joinsmartestates@gmail.com ',
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
                              )),
                          sbH5,
                          Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: lRed,
                                  child:  Icon(
                                    MdiIcons.instagram,
                                    color: Colors.white,
                                  ),
                                ),
                                title: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'josmart_real_estate_team ',
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
                                            text: 'Instagram Handle',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                              )),
                          sbH5,
                          Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: lRed,
                                  child:  Icon(
                                    MdiIcons.instagram,
                                    color: Colors.white,
                                  ),
                                ),
                                title: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'josmart_real_estate_team ',
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
                                            text: 'Instagram Handle',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                              )),
                          sbH5,
                          // Container(
                          //   padding: const EdgeInsets.all(8.0),
                          //   decoration: BoxDecoration(
                          //       color: lRed,
                          //       borderRadius: BorderRadius.circular(8.0)
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       TextButton(onPressed: (){}, child: Text(
                          //         'Show All',
                          //         style: GoogleFonts.poppins(
                          //             fontWeight: FontWeight.w400,
                          //             color: Colors.white
                          //         ),
                          //       )),
                          //       sb2,
                          //       const Icon(Icons.keyboard_arrow_down_sharp,
                          //         color: Colors.white,
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // // Profile Information
            // sbH20,
            // // Contact Information
            // sbH20,
            // // Social Media Links
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     IconButton(
            //       icon: const Icon(Icons.facebook),
            //       onPressed: () {
            //         // Open Facebook link
            //       },
            //     ),
            //     IconButton(
            //       icon: Icon(MdiIcons.twitter),
            //       onPressed: () {
            //         // Open Twitter link
            //       },
            //     ),
            //     IconButton(
            //       icon: Icon(MdiIcons.instagram),
            //       onPressed: () {
            //         // Open Instagram link
            //       },
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 20),
            //
            // // Bio
            // Text(
            //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nulla auctor, vestibulum magna sed, convallis ex.',
            //   style: GoogleFonts.poppins(
            //       fontSize: 18,
            //       color: Colors.black
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}