import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/pages/postPage.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:housing_information_website/widgets/footerSection.dart';
import '../impVariable.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip1.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip2.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip3.dart';
import '../widgets/homePagePostStrip.dart';
import '../widgets/propertyCard.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin{
  late double abHeight = 0;
  late AnimationController _controller;
  late Animation<double> _avatarRadiusAnimation;
  late Animation<double> _sliverABAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _mapWidthAnimation;
  late Animation<double> _mapHeightAnimation;
  late BoxFit _boxFit = BoxFit.cover;

  int _current = 0;
  late Timer _timer;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void changeImage() {
    _timer = Timer.periodic(const Duration(milliseconds: 1950), (timer) {
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
    changeImage();
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

  showPost(BuildContext context, String postId) async {
    return showDialog(context: context, builder:
        (context){
      return postPage(postId: postId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          const homePgStrip1(),
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Column(
                children: [
                  sbH30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Featured Properties',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 35
                        ),
                      )
                    ],
                  ),
                  sbH30,
                  SizedBox(
                    height: 1000,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return postPage(
                          postId: snapshot.data!.docs[index].data()['postId'],
                        );
                      },
                    ),
                  ),
                  sbH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: lRed,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .secondary,
                              width: .9,
                            )
                        ),
                        child: TextButton(onPressed: () {
                          setState(() {
                            navIndex = 1;
                          });
                        }, child: Text(
                          'View More Properties',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            wordSpacing: 1.5,
                          ),
                        )),
                      )
                    ],
                  ),
                  sbH50
                ],
              ),
            );
        },
      ),
          const homePgStrip2(),
          const homePgStrip3(),
          footerSection(),
        ],
      ),
    );
  }
}
