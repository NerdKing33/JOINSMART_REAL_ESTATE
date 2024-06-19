import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../impVariable.dart';
import '../../themes/theme.dart';
import '../pageHeader.dart';

class homePgStrip1 extends StatefulWidget {
  const homePgStrip1({super.key});

  @override
  State<homePgStrip1> createState() => _homePgStrip1State();
}

class _homePgStrip1State extends State<homePgStrip1> {
  final String _location = 'Location';
  int _current = 0;
  final List<String> imgList = [
    hotel,
    landscapeCity,
    buildings,
  ];
late Timer _timer;
  @override
  void initState() {
    super.initState();
    changeImage();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void changeImage() {
    _timer = Timer.periodic(const Duration(milliseconds: 2800), (timer) {
      setState(() {
        if(_current < 2){
          _current++;
        }
        else{
          _current = 0;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    return  Container(
      height: MediaQuery.of(context).size.height * .75, // responsive height
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: .8,
              image:  AssetImage(
                  imgList[_current]
              ),
              fit: BoxFit.fill,
          )
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            width: 590,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(254, 235, 236, .7),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const pageHeader(
                    title: 'Find Properties',
                    fontSize: 18,
                    mainAxisAlignment: MainAxisAlignment.start,
                    fontWeight: FontWeight.bold,
                    height: 5,
                    width: 60
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text:  'The Most Suitable ',
                          style:GoogleFonts.poppins(
                              fontSize: 38,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                        ),
                        TextSpan(
                          text:  '\nReal Estate Property For You ',
                          style:GoogleFonts.poppins(
                              fontSize: 38,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary
                          ),
                        ),
                        TextSpan(
                          text:   "\nSearch below from our range of property options, go ahead find your next home, office, studio, renting unit and so much more ... ",
                          style: GoogleFonts.poppins(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                          ),
                        )
                      ]
                  ),
                ),
                sbH20,
                Container(
                  width: 600,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            border: Border.all(
                              color: lRed,
                              width: 1,
                            )
                        ),
                        child: DropdownButton<String>(
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: selectedColor,
                                child: const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              sb5,
                              Text(
                                'Location',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700] ,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                          items: [],
                          underline: sb0,
                          onChanged: (Object? k) {
                            setState(() {
                              _location == k;
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.black,
                          ),

                        ),
                      ),
                      sb10,
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            border: Border.all(
                              color: lRed,
                              width: 1,
                            )
                        ),
                        child: DropdownButton<String>(
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: selectedColor,
                                child: Icon(
                                  MdiIcons.homeRoof,
                                  color: Colors.white,
                                ),
                              ),
                              sb5,
                              Text(
                                'Property Type',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700] ,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                          items: [],
                          underline: sb0,
                          onChanged: (Object? k) {
                            setState(() {
                              _location == k;
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.black,
                          ),

                        ),
                      ),
                      sb5,
                      // IconButton(
                      //     onPressed: (){},
                      //     icon:  Icon(
                      //       Icons.filter_list_outlined,
                      //       color: selectedColor,
                      //     )
                      // ),
                      sb5,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: selectedColor,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            )
                        ),
                        child: TextButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Search',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Colors.white
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30.0,
                              height: 30.0,
                              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == 0
                                    ? Colors.black38
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: GoogleFonts.galdeano(
                                      color:_current == 0
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30.0,
                              height: 30.0,
                              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == 1
                                    ? Colors.black38
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: GoogleFonts.galdeano(
                                      color: _current == 1
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30.0,
                              height: 30.0,
                              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == 2
                                    ? Colors.black38
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '3',
                                  style: GoogleFonts.galdeano(
                                      color:_current == 2
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
