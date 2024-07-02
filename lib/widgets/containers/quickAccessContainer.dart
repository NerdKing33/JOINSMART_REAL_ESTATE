import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/themes/theme.dart';

class quickAccessContainer extends StatelessWidget {
  final Widget icon;
  final String text;
  final void Function()? func;
  quickAccessContainer({
    Key? key,
    required this.icon,
    required this.text,
  required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 100,
          width:100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(
                text,
                style: GoogleFonts.rajdhani(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
