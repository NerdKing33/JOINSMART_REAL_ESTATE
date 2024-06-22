import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class quickAccessContainer extends StatelessWidget {
  quickAccessContainer({
    Key? key,
    required this.icon,
    required this.text,
  });

  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Text(
                '$text',
                style: GoogleFonts.rajdhani(
                  fontSize: 11,
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
