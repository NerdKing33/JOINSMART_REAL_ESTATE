import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../impVariable.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin{
  late final int _selectedIndex = 0;
  late double abHeight = 0;
  late final bool _done = false;
  late AnimationController _controller;
  late Animation<double> _avatarRadiusAnimation;
  late Animation<double> _sliverABAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _mapWidthAnimation;
  late Animation<double> _mapHeightAnimation;
  late BoxFit _boxFit = BoxFit.cover;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 600 ))..forward();
    _mapWidthAnimation = Tween(begin: 0.0, end: 120.0).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _mapHeightAnimation = Tween(begin: 0.0, end: 60.0).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _avatarRadiusAnimation = Tween(begin: 0.0, end: 15.0).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _sliverABAnimation = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _textAnimation = Tween(begin: 0.0, end: 20.0).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.addListener(() {setState(() {});});
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.stop();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }
  void picResize(){
    if(_boxFit == BoxFit.cover) {
      setState(() {
        _boxFit = BoxFit.contain;
      });
    } else{
      setState(() {
        _boxFit = BoxFit.cover;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    Color unselectedColor = Theme.of(context).colorScheme.surface;
    return Scaffold(
      backgroundColor: Colors.white,
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
                    CircleAvatar(
                      backgroundImage: AssetImage(jeLogo),
                      radius: 18,
                    ),
                    sb5,
                    ///theTitle
                    Text(
                      titleCptl,
                      style: GoogleFonts.poppins(
                          fontSize:18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary,
                          letterSpacing: 1.5,
                          wordSpacing: 2.0
                      ),
                    ),
                  ],
                )
            ),
            ///these are the action buttons
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
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
                        onPressed: (){},
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
                        onPressed: (){},
                        child: Text(
                          'Services',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: unselectedColor,
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
                        onPressed: (){},
                        child: Text(
                          'Properties',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: unselectedColor,
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
                        onPressed: (){},
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
                  Container(
                    padding: const EdgeInsets.all(.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextButton(
                        onPressed: (){},
                        child: Text(
                          'Account',
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
            sb90
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: TextButton(
                  onPressed: (){},
                  child:  Text(
                    'CONTACT US',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      wordSpacing: 1.5,
                    ),
                  )
              ),
            ),
          )
        ],
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(6.0),
        //     child: Container(
        //       padding: const EdgeInsets.all(4.0),
        //       decoration: BoxDecoration(
        //           color: pRed,
        //           borderRadius: BorderRadius.circular(8.0)
        //       ),
        //       child: Row(
        //         children: [
        //           sb2,
        //           GestureDetector(
        //             child: Container(
        //               width: 35,
        //               height: 35,
        //               padding: const EdgeInsets.all(8.0),
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(8.0),
        //                 color: Colors.white,
        //               ),
        //               child: const Center(
        //                 child: Icon(
        //                   Icons.phone_outlined,
        //                   color: Colors.black,
        //                   weight: 1.0,
        //                   fill: .0,
        //                   grade: 1.0,
        //                   size: 18,
        //                 ),
        //               ),
        //             ),
        //           ),
        //           sb2, sb2,
        //           GestureDetector(
        //             child: Container(
        //               width: 35,
        //               height: 35,
        //               padding: const EdgeInsets.all(8.0),
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(8.0),
        //                 color: Colors.white,
        //               ),
        //               child: const Center(
        //                 child: Icon(
        //                   Icons.person_outline_sharp,
        //                   color: Colors.black,
        //                   weight: 1.0,
        //                   fill: .0,
        //                   grade: 1.0,
        //                   size: 18,
        //                 ),
        //               ),
        //             ),
        //           ),
        //           sb2,
        //         ],
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 5/2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: pRed,
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///theTopIntroTextToTheWebsite
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sbH100,
                      sbH40,
                      Text(
                        'Find Properties',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18
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
                            )
                          ]
                        ),
                      ),
                      Text(
                        "Search below from our range of property options, go ahead find your next \nhome, office, studio, renting unit and so much more ",
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w500,
                            fontSize: 12
                        ),
                      ),
                      sbH20,
                      Container(
                        height: 80,
                        width: 570,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(5.0),
                              ),

                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(5.0),
                              ),

                            ),
                            IconButton(
                                onPressed: (){},
                                icon: const Icon(
                                  Icons.filter_list_outlined,
                                  color: Colors.black,
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8.0),
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
                                            fontSize: 15,
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
                    ],
                  ),
                  sb80,
                  ///theTopIntroImageToTheWebsite
                  SizedBox(
                    width: 500,
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
            ),
          ),
          AspectRatio(
            aspectRatio: 7/3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration:  const BoxDecoration(
                color: Colors.white,
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sb100,
                  ///theTopIntroImageToTheWebsite
                  AspectRatio(
                    aspectRatio: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbH80,
                        Stack(
                          alignment: const Alignment(3, 2),
                          children: [
                            Container(
                              width: 350,
                              height: 400,
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
                            Container(
                              width: 280,
                              height: 280,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  ///theTopIntroTextToTheWebsite
                  AspectRatio(
                    aspectRatio: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        sbH60,
                        Text(
                          'Why Choose Us:',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 20
                          ),
                        ),
                        RichText(
                         text:  TextSpan(
                           children: [
                             TextSpan(
                               text:  'We strive to give our clients the best through our Large Collection of many ',
                               style:GoogleFonts.poppins(
                                   fontSize: 35,
                                   fontWeight: FontWeight.w400,
                                   color: Colors.black
                               ),
                             ),
                             TextSpan(
                               text:  'Quality Properties ',
                               style:GoogleFonts.poppins(
                                   fontSize: 35,
                                   fontWeight: FontWeight.w400,
                                   color: Theme.of(context).colorScheme.secondary
                               ),
                             ),
                             TextSpan(
                               text:  'and ',
                               style:GoogleFonts.poppins(
                                   fontSize: 35,
                                   fontWeight: FontWeight.w400,
                                   color: Colors.black
                               ),
                             ),
                             TextSpan(
                               text:  'Services',
                               style:GoogleFonts.poppins(
                                   fontSize: 35,
                                   fontWeight: FontWeight.w400,
                                   color: Theme.of(context).colorScheme.secondary
                               ),
                             ),
                             // TextSpan(
                             //   text:  'Learn More ... ',
                             //   style:GoogleFonts.poppins(
                             //       fontSize: 20,
                             //       fontWeight: FontWeight.w400,
                             //       color: Theme.of(context).colorScheme.secondary
                             //   ),
                             // ),
                           ]
                         ),
                        ),
                        // Text(
                        //   'All For You',
                        //   style:GoogleFonts.poppins(
                        //       fontSize: 35,
                        //       fontWeight: FontWeight.w400,
                        //       color: Theme.of(context).colorScheme.secondary
                        //   ),
                        // ),
                        sbH20,
                        Container(
                          height: 258,
                          width: 620,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child:ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: pRed,
                                  child: Icon(
                                    MdiIcons.tools,
                                  ),
                                ),
                                title: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Field Experts ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.black,
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
                                          text: 'Experts in real estate, design, committed to excellence, client satisfaction, and innovative solutions.',
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
                                  backgroundColor: pRed,
                                  child: const Icon(
                                    Icons.groups_outlined,
                                  ),
                                ),
                                title: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'LIFELONG CLIENT RELATIONSHIPS ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.black,
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
                                          text: 'Josmart Investment Company builds lasting relationships with clients through annual appreciation events.',
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
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: pRed,
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(onPressed: (){}, child: Text(
                                      'Show All',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black
                                      ),
                                    )),
                                    sb2,
                                    const Icon(Icons.keyboard_arrow_down_sharp,
                                    color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 5/2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration:   BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///theTopIntroTextToTheWebsite
                  AspectRatio(
                    aspectRatio: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        sbH100,
                        sbH40,
                        Text(
                          'About Us',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18
                          ),
                        ),
                        RichText(
                          text:  TextSpan(
                              children: [
                                TextSpan(
                                 text:  'To achieve the above,\nWe pride ourselves on our',
                                  style:GoogleFonts.poppins(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                                TextSpan(
                                 text:  '\nCompany Values',
                                  style:GoogleFonts.poppins(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.secondary
                                  ),
                                ),
                              ]
                          ),
                        ),
                        sbH20,
                        SizedBox(
                          width: 450,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                    onPressed: (){},
                                    icon:  Icon(
                                      Icons.phone_outlined,
                                      color: Theme.of(context).colorScheme.secondary,
                                    )
                                ),
                              ),
                              sb5,
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(
                                      Icons.alternate_email_outlined,
                                      color: Theme.of(context).colorScheme.secondary,
                                    )
                                ),
                              ),
                              sb5,
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                    onPressed: (){},
                                    icon:  Icon(
                                      MdiIcons.whatsapp,
                                      color: Theme.of(context).colorScheme.secondary,
                                    )
                                ),
                              ),
                              sb5,
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(
                                      Icons.share_outlined,
                                      color: Theme.of(context).colorScheme.secondary,
                                    )
                                ),
                              ),
                              sb5,
                              Container(
                                padding: const EdgeInsets.all(9.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextButton(
                                    onPressed: (){},
                                    child: Row(
                                      children: [
                                         Icon(
                                          MdiIcons.scriptTextOutline,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          ' About Us',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
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
                      ],
                    ),
                  ),
                  sb80,
                  ///theTopIntroImageToTheWebsite
                  AspectRatio(
                    aspectRatio: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: pRed,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                    image: AssetImage(
                                      dpImage,
                                    )
                                ),
                                // boxShadow: basicShadow
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
