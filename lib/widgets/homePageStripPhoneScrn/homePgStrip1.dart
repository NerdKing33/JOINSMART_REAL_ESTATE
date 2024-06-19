import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../impVariable.dart';
import '../../themes/theme.dart';

class homePgStrip1 extends StatefulWidget {
  const homePgStrip1({super.key});

  @override
  State<homePgStrip1> createState() => _homePgStrip1State();
}

class _homePgStrip1State extends State<homePgStrip1> {
  final String _location = 'Location';
  int _current = 0;
  final List<String> imgList = [
    constructionImage,
    jeLogo,
   dpImage,
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
    _timer = Timer.periodic(const Duration(milliseconds: 2300), (timer) {
      setState(() {
        if(_current<2){
          _current++;
        }else{
          _current = 0;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    return  Container(
      height: MediaQuery.of(context).size.height * .99, // responsive height
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: .5,
              image:  AssetImage(
                  imgList[_current]
              ),
              fit: BoxFit.fill
          )
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///theTopIntroTextToTheWebsite
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sbH100,
              sbH100,
              sbH50,
              SizedBox(
                width: 560,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sb5,
                    Container(
                      width: 60,
                      height: 5,
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(right: Radius.circular(10.0)),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    sb5,
                    Text(
                      'Find Properties',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text:  'The Most Suitable ',
                        style:GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      ),
                      TextSpan(
                        text:  '\nReal Estate Property For You ',
                        style:GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.secondary
                        ),
                      ),
                      TextSpan(
                        text:   "\n Search below from our range of property options, go ahead find your next \n home, office, studio, renting unit and so much more ",
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w500,
                            fontSize: 12
                        ),
                      )
                    ]
                ),
              ),
              sbH20,
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6.0),
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
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        items: [

                        ],
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
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6.0),
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
                                color: Colors.black,
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
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.filter_list_outlined,
                          color: Colors.black,
                        )
                    ),
                    sb10,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13.0),
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(6.0),
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
              sbH100,
              sbH100,
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: 120,
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
          ),
          sb80,
          ///theTopIntroImageToTheWebsite
          SizedBox(
            width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 4/3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: pRed,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(
                            constructionImage,
                          )
                      ),
                      // boxShadow: basicShadow
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
