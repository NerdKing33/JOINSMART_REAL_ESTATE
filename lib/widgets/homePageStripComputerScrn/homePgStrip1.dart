import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/pages/searchPropertiesPage.dart';
import 'package:housing_information_website/widgets/searchDropdown/locationSearch.dart';
import 'package:housing_information_website/widgets/searchDropdown/propertyTypeSearch.dart';
import 'package:page_transition/page_transition.dart';
import '../../impVariable.dart';
import '../../themes/theme.dart';
import '../pageHeader.dart';

class homePgStrip1 extends StatefulWidget {
  const homePgStrip1({super.key});

  @override
  State<homePgStrip1> createState() => _homePgStrip1State();
}

class _homePgStrip1State extends State<homePgStrip1> {
  final TextEditingController _location= TextEditingController();
  final TextEditingController _houseType= TextEditingController();
  int _current = 0;
  final List<String> imgList = [
    lndScp,
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
  void changeImage(){
    _timer = Timer.periodic(const Duration(milliseconds: 2800), (timer) {
      setState(() {
      switch(_current){
        case 0:{
          ++_current;
        }
        case 1:{
          ++_current;
        }
        case 2:{
          --_current;
          --_current;
        }
      }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * .8, // responsive height
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 1.0,
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
            padding: const EdgeInsets.all(30.0),
            width: 590,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(254, 235, 236, .7),
              borderRadius: BorderRadius.only(topRight: Radius.circular(15.0),topLeft: Radius.circular(15.0),bottomLeft: Radius.circular(15.0),bottomRight: Radius.circular(15.0))
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
                sbH10,
                Container(
                  width: 600,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 190,
                          child: locationSearch(controller: _location)),
                      sb10,
                      SizedBox(
                          width: 230,
                          child: propertyTypeSearch(textController: _houseType)),
                      sb10,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: lRed,
                        ),
                        child: IconButton(
                            onPressed: (){
                              Navigator.of(context).push(PageTransition(
                                  duration: const Duration(milliseconds: 250),
                                  child: searchPropertiesPage(location: _location.text, propertyType: _houseType.text),
                                  type: PageTransitionType.bottomToTop));
                              },
                            icon: const Icon(
                              size: 30,
                              Icons.search_outlined,
                              color: Colors.white,
                            ),
                        ),
                      )
                    ],
                  ),
                ),
                sbH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(15.0),
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
          sbH20
        ],
      ),
    );
  }
}
