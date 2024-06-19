import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../impVariable.dart';
import '../../themes/theme.dart';

class homePgStrip2 extends StatefulWidget {
  const homePgStrip2({super.key});

  @override
  State<homePgStrip2> createState() => _homePgStrip2State();
}

class _homePgStrip2State extends State<homePgStrip2> {
  final String _location = 'Location';

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    return  Container(
      height: MediaQuery.of(context).size.height * 0.9, // responsive height
      width: MediaQuery.of(context).size.width, //
      decoration:  const BoxDecoration(
        color: Colors.white,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///theTopIntroImageToTheWebsite
          Stack(
            alignment: const Alignment(3, 2),
            children: [
              Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: pRed,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      image: AssetImage(
                        constructionImage,
                      )
                  ),
                  // boxShadow: basicShadow
                ),
              ),
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: pRed,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        image: AssetImage(
                          constructionImage,
                        )
                    ),
                    boxShadow: basicShadow
                ),
              ),
            ],
          ),
          sb100,
          sb80,
          ///theTopIntroTextToTheWebsite
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sbH60,
              Row(
                children: [
                  sb2,
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
                    'Why Choose Us:',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 600,
                child: RichText(
                  text:  TextSpan(
                      children: [
                        TextSpan(
                          text:  'We strive to give our clients the best through our Large Collection of many ',
                          style:GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                        ),
                        TextSpan(
                          text:  'Quality Properties ',
                          style:GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary
                          ),
                        ),
                        TextSpan(
                          text:  'and ',
                          style:GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                        ),
                        TextSpan(
                          text:  'Services',
                          style:GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary
                          ),
                        ),
                      ]
                  ),
                ),
              ),
              sbH20,
              Container(
                width: 600,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: basicShadow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundColor: selectedColor,
                            child: Icon(
                              MdiIcons.tools,
                              color: Colors.white,
                            ),
                          ),
                          title: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Field Experts ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          subtitle: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Experts in real estate, design, committed to excellence, client satisfaction, and innovative solutions.',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ]
                              )
                          ),
                        )),
                    sbH5,
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundColor: selectedColor,
                            child: const Icon(
                              Icons.groups_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'LIFELONG CLIENT RELATIONSHIPS ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          subtitle: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Josmart Investment Company builds lasting relationships with clients through annual appreciation events.',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ]
                              )
                          ),
                        )),
                    sbH5,
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundColor: selectedColor,
                            child: const Icon(
                              Icons.groups_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'LIFELONG CLIENT RELATIONSHIPS ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          subtitle: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Josmart Investment Company builds lasting relationships with clients through annual appreciation events.',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ]
                              )
                          ),
                        )),
                    sbH5,
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){}, child: Text(
                            'Show All',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          )),
                          sb2,
                          const Icon(Icons.keyboard_arrow_down_sharp,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
