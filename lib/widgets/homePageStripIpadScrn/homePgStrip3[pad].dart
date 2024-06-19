import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../impVariable.dart';
import '../../themes/theme.dart';

class homePgStrip3Pad extends StatefulWidget {
  const homePgStrip3Pad({super.key});

  @override
  State<homePgStrip3Pad> createState() => _homePgStrip3PadState();
}

class _homePgStrip3PadState extends State<homePgStrip3Pad> {
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
        children: [
          ///theTopIntroTextToTheWebsite
          AspectRatio(
            aspectRatio: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sbH100,
                sbH40,
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
                sbH20,
                SizedBox(
                  width: 480,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: basicShadow
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon:  Icon(
                                Icons.phone_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                          ),
                        ),
                      ),
                      sb5,
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: basicShadow
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon:  Icon(
                                MdiIcons.emailOutline,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                          ),
                        ),
                      ),
                      sb5,
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: basicShadow
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon:  Icon(
                                Icons.facebook_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                          ),
                        ),
                      ),
                      sb5,
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: basicShadow
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon: Icon(
                                MdiIcons.instagram,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                          ),
                        ),
                      ),
                      sb5,
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: basicShadow
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon:  Icon(
                                MdiIcons.whatsapp,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                          ),
                        ),
                      ),
                      sb5,
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: basicShadow
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.share_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                          ),
                        ),
                      ),
                      sb5,
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: basicShadow
                          ),
                          child: TextButton(
                              onPressed: (){},
                              child: Row(
                                children: [
                                  Icon(
                                    MdiIcons.helpCircleOutline,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' Help',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ///theTopIntroImageToTheWebsite
          AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
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
          ),
        ],
      ),
    );
  }
}
