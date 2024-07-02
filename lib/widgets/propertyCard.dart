import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/pages/postPage.dart';
import '../impVariable.dart';
import '../themes/theme.dart';
import '../utils.dart';

class propertyCard extends StatefulWidget {
  final Map<String, dynamic> postId;
  const propertyCard({
    super.key,
    required this.postId
  });

  @override
  State<propertyCard> createState() => _propertyCardState();
}

class _propertyCardState extends State<propertyCard> {



    @override
  Widget build(BuildContext context) {
    return widget.postId['uid'] == null
        ? Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 950,
        height: 790,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.shade200,
            boxShadow: [BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(0.0, 0.0),
                blurRadius: 5.0,
                spreadRadius: 2.0)]),
        child: Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: lRed,
            ),
          ),
        ),
      ),
    )
        : Padding(
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
                      image: NetworkImage(widget.postId['mainPost']),
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
                                  text: widget.postId['propertyLocation'],
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
                                      text: '${widget.postId['price']}',
                                      style: GoogleFonts.galdeano(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28,
                                          color: lRed,
                                        letterSpacing: 1.5
                                      )
                                  ),
                                  TextSpan(
                                      text: '/${widget.postId['paymentPeriod']}',
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
                                      text: '${widget.postId['area']} ',
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
                                      text: '${widget.postId['noRooms']} ',
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
                                  text: '${widget.postId['description']}',
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
