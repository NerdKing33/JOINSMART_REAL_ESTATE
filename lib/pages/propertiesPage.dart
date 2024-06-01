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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const pageHeader(
          title: 'Our Properties',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          postStrip(stripBackGColor: Colors.grey.shade200, stripTitle: 'Featured Properties', stripTitleColor: Colors.black,),
          postStrip(stripBackGColor: pRed, stripTitle: 'Hot Products', stripTitleColor: Colors.white,),
          postStrip(stripBackGColor: Colors.grey.shade200, stripTitle: 'New Products', stripTitleColor: Colors.black,)
        ],
      ),
    );
  }
}
