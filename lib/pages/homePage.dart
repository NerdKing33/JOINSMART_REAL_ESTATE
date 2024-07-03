import 'dart:async';
import 'package:flutter/material.dart';
import 'package:housing_information_website/widgets/footerSection.dart';
import 'package:housing_information_website/widgets/homePagePostStrip.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip1.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip2.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip3.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin{
  late double abHeight = 0;
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          const homePgStrip1(),
          const homePagePostStrip(),
          const homePgStrip2(),
          const homePgStrip3(),
          footerSection(),
        ],
      ),
    );
  }
}
