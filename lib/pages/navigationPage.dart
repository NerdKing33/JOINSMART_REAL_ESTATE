import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/pages/aboutPage.dart';
import 'package:housing_information_website/pages/accountPage.dart';
import 'package:housing_information_website/pages/homePage.dart';
import 'package:housing_information_website/pages/logInPage.dart';
import 'package:housing_information_website/pages/postPage.dart';
import 'package:housing_information_website/pages/propertiesPage.dart';
import 'package:housing_information_website/pages/servicesPage.dart';
import 'package:housing_information_website/pages/signUpPage.dart';
import 'package:housing_information_website/pages/uploadPage.dart';

import '../impVariable.dart';
import '../themes/theme.dart';

class navigationPage extends StatefulWidget {

   navigationPage({super.key});

  @override
  State<navigationPage> createState() => _navigationPageState();
}

class _navigationPageState extends State<navigationPage> {
  late final  bool _loggedIn = false;

   final List<Widget> _pages = [
     const postPage(postId: '7cNOElwf9LcFbBubuUOh',),
     const homePage(),
     const propertiesPage(),
     const servicesPage(),
     aboutPage(),
     uploadPage(),
     accountPage(),
     signUpPage(),
     logInPage(),
   ];

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navIndex >= 6  ? Colors.white : Colors.white,
        toolbarHeight:75 ,
        title: SizedBox(
          height: navIndex >= 6 ? 55 : 75,
          width: MediaQuery.of(context).size.width +60,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: navIndex >= 6?
                [
                  TextButton(
                      onPressed: (){
                        setState(() {
                          navIndex = 0;
                        });
                      },
                      child: Row(
                        children: [
                          ///theLogo
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: selectedColor,
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
                                color:  selectedColor,
                                letterSpacing: 1.5,
                                wordSpacing: 2.0
                            ),
                          ),
                        ],
                      )
                  ),
                  navIndex == 7 ? Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: lRed,
                        border: Border.all(
                          color: lRed,
                          width: .5,
                        )
                    ),
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            navIndex = 6;
                          });
                        },
                        icon:Text(
                          'SIGN UP',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        )
                    ),
                  ):
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: lRed,
                        border: Border.all(
                          color: lRed,
                          width: .5,
                        )
                    ),
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            navIndex = 7;
                          });
                        },
                        icon:Text(
                          'Log In',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        )
                    ),
                  ),
                ]
                  :[
                    ///theUpperLeftChatter
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: (){
                            setState(() {
                              navIndex = 0;
                            });
                          },
                          child: Row(
                            children: [
                              ///theLogo
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedColor,
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
                                    color:  selectedColor,
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
                      padding: const EdgeInsets.all(8.0),
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
                              child: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 0;
                                    });
                                  },
                                  child: Text(
                                    'HOME',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 0 ? selectedColor:Colors.grey[700],
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
                              child: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 1;
                                    });
                                  },
                                  child: Text(
                                    'PROPERTIES',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 1 ? selectedColor:Colors.grey[700] ,
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
                              child: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 2;
                                    });
                                  },
                                  child: Text(
                                    'SERVICES',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 2 ?selectedColor:Colors.grey[700] ,
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
                              child: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 3;
                                    });
                                  },
                                  child: Text(
                                    'ABOUT',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: navIndex == 3 ?selectedColor:Colors.grey[700] ,
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
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
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
                                    image: DecorationImage(
                                        image: AssetImage(dpImage),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                sb10,
                                Text(
                                  userName,
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
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
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
                                    color: selectedColor,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                )
                            ),
                          ),
                          sb5,sb2,
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: lRed,
                                border: Border.all(
                                  color: lRed,
                                  width: .5,
                                )
                            ),
                            child: Center(
                              child: _loggedIn == true
                                  ?  Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      navIndex = 5;
                                    });
                                  },
                                  child: Icon(
                                    Icons.person_outline_sharp,
                                    color: selectedColor,
                                  ),
                                ),
                              )
                                  :IconButton(
                                  onPressed: (){
                                    setState(() {
                                      navIndex = 6;
                                    });
                                  },
                                  icon: Text(
                                'SIGN UP',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              )),
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
