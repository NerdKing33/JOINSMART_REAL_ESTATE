import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/themes/theme.dart';

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
        toolbarHeight: 58,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                    color: Theme.of(context).colorScheme.secondary
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
                       borderRadius: BorderRadius.circular(15.0),
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
                       borderRadius: BorderRadius.circular(15.0),
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
                       borderRadius: BorderRadius.circular(15.0),
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
                       borderRadius: BorderRadius.circular(15.0),
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
                       borderRadius: BorderRadius.circular(15.0),
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
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 55/16,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8.0)
                ),
                child: TextButton(
                    onPressed: (){

                    },
                    child: Text(
                  'Contact Us',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: BoxDecoration(
                color: pRed,
            ),
            child:  Stack(
              alignment: const Alignment(-.43, .6),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///theTopIntroTextToTheWebsite
                    Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '  To achieve the above,\n  We pride ourselves on our ',
                                style:GoogleFonts.poppins(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),
                              ),
                              Text(
                                '  Company Values',
                                style:GoogleFonts.poppins(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).colorScheme.secondary
                                ),
                              ),
                            ],
                          ),
                    ),
                    ///theTopIntroImageToTheWebsite
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 380,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: pRed,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      image: AssetImage(
                                        constructionImage,
                                      )
                                  ),
                                  boxShadow: basicShadow
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                      ],
                ),
                Container(
                  height: 60,
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
                                    color: Colors.white
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
