import 'dart:async';
import 'package:flutter/material.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:housing_information_website/widgets/footerSection.dart';
import '../impVariable.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip1.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip2.dart';
import '../widgets/homePageStripComputerScrn/homePgStrip3.dart';
import '../widgets/postStrips.dart';

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
  final String _location = 'Location';
  late final bool _loggedIn = false;
  final List<String> imgList = [
    constructionImage,
    jeLogo,
    dpImage,
  ];
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
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    Color unselectedColor = Theme.of(context).colorScheme.surface;
    // print(MediaQuery.of(context).size.width);   print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          const homePgStrip1(),
          postStrip(stripBackGColor: Colors.white, stripTitle: 'Featured Properties', stripTitleColor: lRed,),
          const homePgStrip2(),
          const homePgStrip3(),
          footerSection(),
        ],
      ),
    );
  }
}
