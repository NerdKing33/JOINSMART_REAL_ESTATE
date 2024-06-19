import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../impVariable.dart';
import '../themes/theme.dart';

class propertyCard extends StatefulWidget {
  final String post;
  final String location;
  final int price;
  final int noRooms;
  final double sqMtrs;
  final String period;
  const propertyCard({
    super.key,
    required this.post,
    required this.location,
    required this.price,
    required this.noRooms,
    required this.sqMtrs,
    required this.period
  });

  @override
  State<propertyCard> createState() => _propertyCardState();
}

class _propertyCardState extends State<propertyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: pRed,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(0.0)),
                    image: DecorationImage(
                      image: AssetImage(widget.post),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(top: 10.0),
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(.0))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: widget.location,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: lRed
                                  )
                              ),
                            ]
                        )
                    ),
                    sbH10,
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Tsh ',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: lRed
                                      )
                                  ),
                                  TextSpan(
                                      text: '${widget.price}',
                                      style: GoogleFonts.galdeano(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28,
                                          color: lRed,
                                        letterSpacing: 1.5
                                      )
                                  ),
                                  TextSpan(
                                      text: '/${widget.period}',
                                      style: GoogleFonts.galdeano(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          color: Colors.grey[800]
                                      )
                                  ),
                                ]
                            )
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                        ),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: '${widget.sqMtrs} ',
                                      style: GoogleFonts.galdeano(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          color: Colors.black
                                      )
                                  ),
                                  TextSpan(
                                      text: 'sq/ft',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.grey[800]
                                      )
                                  ),
                                ]
                            )
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                        ),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: '${widget.noRooms} ',
                                      style: GoogleFonts.galdeano(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          color: Colors.black
                                      )
                                  ),
                                  TextSpan(
                                      text: 'Rooms',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.grey[800]
                                      )
                                  ),
                                ]
                            )
                        ),
                      ],
                    ),
                    sbH10,
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.black
                                  )
                              ),
                            ]
                        )
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
