import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../impVariable.dart';
import '../../themes/theme.dart';

class homePgStrip3 extends StatefulWidget {
  const homePgStrip3({super.key});

  @override
  State<homePgStrip3> createState() => _homePgStrip3State();
}

class _homePgStrip3State extends State<homePgStrip3> {
  infoCard( String title, String info ){
    return showDialog(context: context, builder: (context){
      return  AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                    color: lRed,
                    letterSpacing: 1.5,
                    wordSpacing: 2,
                    fontSize: 30
                ),
              )
            ]
          ),
        ),
        content:  RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: info,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      wordSpacing: 2,
                      fontSize: 24
                  ),
                )
              ]
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: lRed,
                  width: .5,
                )
            ),
            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Text(
                  'CLOSE',
                  style: GoogleFonts.poppins(
                      color: lRed,
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),
                )
            ),
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.7, // responsive height
      width: MediaQuery.of(context).size.width,
      decoration:   BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///theTopIntroTextToTheWebsite
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  sb2,
                  Text(
                    'About Us',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
              RichText(
                text:  TextSpan(
                    children: [
                      TextSpan(
                        text:  'To achieve the above,\nWe pride ourselves on our',
                        style:GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      ),
                      TextSpan(
                        text:  '\nCompany Values',
                        style:GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.secondary
                        ),
                      ),
                    ]
                ),
              ),
              RichText(
                text:  TextSpan(
                    children: [
                      TextSpan(
                        text:  'Select below the desirable way to contact us\nor share our platform.',
                        style:GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]
                        ),
                      ),
                    ]
                ),
              ),
              sbH20,
              SizedBox(
                width: 480,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: basicShadow
                      ),
                      child: IconButton(
                          hoverColor: pRed,
                          highlightColor: lRed,
                          onPressed: (){ infoCard(
                            'Our Contact Information',
                              '+255 743 522 226'
                          );},
                          icon:  Icon(
                            Icons.phone_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ),
                    sb5,sb2,
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: basicShadow
                      ),
                      child: IconButton(
                          hoverColor: pRed,
                          highlightColor: lRed,
                          onPressed: (){infoCard(
                            'Our Email Handle:',
                              'josmartrealestateteam@gmail.com'
                          );},
                          icon:  Icon(
                            MdiIcons.emailOutline,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ),
                    sb5,sb2,
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: basicShadow
                      ),
                      child: IconButton(
                        hoverColor: pRed,
                          highlightColor: lRed,
                          onPressed: (){
                          infoCard(
                      'Our Facebook Handle:',
                           '',
                      );
                        },
                          icon:  Icon(
                            Icons.facebook_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ),
                    sb5,sb2,
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: basicShadow
                      ),
                      child: IconButton(
                          hoverColor: pRed,
                          highlightColor: lRed,
                          onPressed: (){infoCard(
                            'Our Instagram Handle',
                              'josmart_real_estate_team'
                          );
                            },
                          icon: Icon(
                            MdiIcons.instagram,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ),
                    sb5,sb2,
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: basicShadow
                      ),
                      child: IconButton(
                          hoverColor: pRed,
                          highlightColor: lRed,
                          onPressed: (){infoCard(
                            'Our Whatsapp Contact Information',
                              '+255 743 522 226'
                          );
                            },
                          icon:  Icon(
                            MdiIcons.whatsapp,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ),
                    sb5,sb2,
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: basicShadow
                      ),
                      child: IconButton(
                          hoverColor: pRed,
                          highlightColor: lRed,
                          onPressed: (){
                            infoCard(
                              'Our Offices Location:',
                                'Mlimani City-Near Lufungila Bus station'
                            );
                          },
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ),
                    sb5,sb2,
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: basicShadow
                      ),
                      child: IconButton(
                          hoverColor: pRed,
                          highlightColor: lRed,
                          onPressed: (){},
                          icon: Icon(
                            Icons.share_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ///theTopIntroImageToTheWebsite
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: pRed,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      image: AssetImage(
                        dpImage,
                      )
                  ),
                  boxShadow: basicShadow
              ),
            ),
          ),
        ],
      ),
    );
  }
}
