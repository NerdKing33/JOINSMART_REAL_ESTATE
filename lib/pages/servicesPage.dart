import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:housing_information_website/widgets/serviceCard2.dart';

import '../impVariable.dart';
class servicesPage extends StatelessWidget {
  const servicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const pageHeader(title: 'Our Services', fontSize: 40, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white, 
      body: GridView.builder(
        itemCount: 6,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 4/2.8,
          crossAxisCount: MediaQuery.of(context).size.width >= 1300 ? 3:2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: serviceCard2(
                title: 'Real Estate Agency',
                description: 'Our real estate company expertly handles letting, '
                    'leasing, buying, and selling properties. '
                    'We provide up-to-date market insights and attract reliable tenants, '
                    'ensuring consistent rental payments. Experience seamless and '
                    'rewarding real estate transactions with us.',
                imagePath: constructionImage, // Add your image
              ),
          );
          },
      ),
    );}
}

