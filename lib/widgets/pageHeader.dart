import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../impVariable.dart';

class pageHeader extends StatefulWidget {
  final String title;
  const pageHeader({super.key, required this.title});

  @override
  State<pageHeader> createState() => _pageHeaderState();
}

class _pageHeaderState extends State<pageHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 5,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(10.0)),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        sb5,
        Text(
          widget.title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18
          ),
        )
      ],
    );
  }
}
