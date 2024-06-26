import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../impVariable.dart';

class pageHeader extends StatefulWidget {
  final String title;
  final  double fontSize;
  final  double height;
  final  double width;
  final MainAxisAlignment mainAxisAlignment;
  final FontWeight fontWeight;
  final Widget? widget;
  final Color? color;
  const pageHeader({
    super.key,
    required this.title,
    required this.fontSize,
    required this.mainAxisAlignment,
    required this.fontWeight,
    required this.height,
    required this.width,
    this.widget,
    this.color,
  });

  @override
  State<pageHeader> createState() => _pageHeaderState();
}

class _pageHeaderState extends State<pageHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        widget.widget ?? Container(
          width: widget.width,
          height: widget.height,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(10.0)),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        widget.width == 0 ? sb0:sb5,
        RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.title,
                    style: GoogleFonts.poppins(
                      fontWeight: widget.fontWeight,
                      color: widget.color ??Theme.of(context).colorScheme.secondary,
                      fontSize: widget.fontSize,
                    ),
                  )
                ]
            )
        ),
      ],
    );
  }
}
