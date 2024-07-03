import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';

import '../impVariable.dart';

class serviceCard1 extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const serviceCard1({
    super.key,
    required this.icon,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: basicShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageHeader(
              title: title,
              fontSize: 40,
              mainAxisAlignment: MainAxisAlignment.start,
              fontWeight: FontWeight.w500,
              height: .0,
              width: .0,
              widget: Icon(
                icon,
                size: 40,
                color: selectedColor,
              ),
            ),
            sbH2,sbH2,sbH2,sbH2,
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: description,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black
                        ),
                      )
                    ]
                )
            ),
          ],
        ),
      ),
    );
  }
}