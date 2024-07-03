import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../impVariable.dart';
import '../../themes/theme.dart';

class homePgStrip2 extends StatefulWidget {
  const homePgStrip2({super.key});

  @override
  State<homePgStrip2> createState() => _homePgStrip2State();
}

class _homePgStrip2State extends State<homePgStrip2> {
servicesPageNav(){
  setState(() {
    navIndex = 2;
    Navigator.of(context).pushReplacementNamed('/navigationPage');
  });
}
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.8, // responsive height
      width: MediaQuery.of(context).size.width, //
      decoration: BoxDecoration(
        color: pRed,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///theTopIntroImageToTheWebsite
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sbH100,sbH10,
              Stack(
                alignment: const Alignment(4, 3.5),
                children: [
                  Container(
                    width: 320,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(
                            buildings,
                          )
                      ),
                      // boxShadow: basicShadow
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(
                            buildingEquipment,
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          sb100,sb30,
          ///theTopIntroTextToTheWebsite
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const pageHeader(
                  title: 'Why Choose Us',
                  fontSize: 20,
                  mainAxisAlignment: MainAxisAlignment.start,
                  fontWeight: FontWeight.bold,
                  height: 5,
                  width: 60
              ),
              SizedBox(
                width: 520,
                child: RichText(
                  text:  TextSpan(
                      children: [
                        TextSpan(
                          text:  'We strive to give our clients the best through our Large Collection of many ',
                          style:GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                        ),
                        TextSpan(
                          text:  'Quality Properties ',
                          style:GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary
                          ),
                        ),
                        TextSpan(
                          text:  'and ',
                          style:GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                        ),
                        TextSpan(
                          text:  'Services',
                          style:GoogleFonts.poppins(
                              fontSize: 30,
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
                width: 520,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  // boxShadow: basicShadow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: pRed,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundColor: lRed,
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
                    sbH10,
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: pRed,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundColor: lRed,
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
                    sbH10,
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: pRed,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundColor: lRed,
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
                    sbH10,
                    Container(
                      padding: const EdgeInsets.all(.0),
                      decoration: BoxDecoration(
                          color: lRed,
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: InkWell(
                        onTap: (){
                          servicesPageNav();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SEE SERVICES',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                              sb2,
                              const Icon(Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ) ;
  }
}
