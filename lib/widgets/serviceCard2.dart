import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';

class serviceCard2 extends StatelessWidget {
  final String title;
  const serviceCard2({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: basicShadow,
        ),
        child: Row(
          children: [
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: title,
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
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