import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/pages/homePage.dart';
import 'package:housing_information_website/pages/propertiesPage.dart';

import '../impVariable.dart';
import '../themes/theme.dart';

class navigationPage extends StatefulWidget {
   navigationPage({super.key});

  @override
  State<navigationPage> createState() => _navigationPageState();
}

class _navigationPageState extends State<navigationPage> {
  late final  bool _loggedIn = false;

  late int _index =0;

   final List<Widget> _pages = [
     const homePage(),
     const propertiesPage(),
   ];

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    Color unselectedColor = Theme.of(context).colorScheme.surface;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ///theUpperLeftChatter
            TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    ///theLogo
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: selectedColor,
                            width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(100.0),
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
                          color: selectedColor,
                          letterSpacing: 1.5,
                          wordSpacing: 2.0
                      ),
                    ),
                  ],
                )
            ),
            ///these AreTheNavButtons
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10.0)),
                color: pRed,
              ),
              child: ButtonBar(
                children: [
                  Container(
                    padding: const EdgeInsets.all(.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextButton(
                        onPressed: (){
                          setState(() {
                            _index = 0;
                          });
                        },
                        child: Text(
                          'Home',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: selectedColor,
                              fontSize: 13
                          ),
                        )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextButton(
                        onPressed: (){
                          setState(() {
                            _index = 1;
                          });
                        },
                        child: Text(
                          'Properties',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: selectedColor,
                              fontSize: 13
                          ),
                        )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextButton(
                        onPressed: (){
                          setState(() {
                            _index = 0;
                          });
                        },
                        child: Text(
                          'Services',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: selectedColor,
                              fontSize: 13
                          ),
                        )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextButton(
                        onPressed: (){
                          setState(() {
                            _index = 1;
                          });
                        },
                        child: Text(
                          'About',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: unselectedColor,
                              fontSize: 13
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            ///theRightMostSideOfTheAppBar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: selectedColor,
                    ),
                    child: IconButton(
                        onPressed: (){},
                        icon:Text(
                          'CONTACT US',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        )
                    ),
                  ),
                  sb2,
                  Container(
                    decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: _loggedIn == true ? const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Icon(
                          Icons.person_outline_sharp,
                          color: Colors.white,
                        ),
                      ) :IconButton(onPressed: (){}, icon: Text(
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
          ],
        ),
      ),
      body: _pages[_index],
    );
  }
}
