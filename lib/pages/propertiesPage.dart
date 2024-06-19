import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:housing_information_website/widgets/postStrips.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../impVariable.dart';
import '../themes/theme.dart';

class propertiesPage extends StatefulWidget {
  const propertiesPage({super.key});

  @override
  State<propertiesPage> createState() => _propertiesPageState();
}

class _propertiesPageState extends State<propertiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children:  [
          const postStrip(stripBackGColor: Colors.white, stripTitle: 'Featured Properties', stripTitleColor: Colors.black,),
          postStrip(stripBackGColor: Colors.grey.shade100, stripTitle: 'Popular Properties', stripTitleColor: Colors.black,),
          const postStrip(stripBackGColor: Colors.white, stripTitle: 'Hot Properties', stripTitleColor: Colors.black,),
        ],
      ),
    );
  }
}
