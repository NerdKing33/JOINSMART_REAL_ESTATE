import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/propertyCard.dart';

import '../impVariable.dart';
import '../themes/theme.dart';

class postStrip extends StatefulWidget {
final  Color stripBackGColor;
final  Color stripTitleColor;
final String stripTitle;
  const postStrip({super.key, required this.stripBackGColor, required this.stripTitle, required this.stripTitleColor});

  @override
  State<postStrip> createState() => _postStripState();
}

class _postStripState extends State<postStrip> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: widget.stripBackGColor,
      ),
      child: Column(
        children: [
          sbH30,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.stripTitle,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: widget.stripTitleColor,
                    fontSize: 35
                ),
              )
            ],
          ),
          sbH30,
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .99,
            shrinkWrap: true,
            children:  [
              propertyCard(post: prpty1 , location: 'Baifra, Kinondoni, Dar es Salaam', price: 1200000, noRooms: 3, sqMtrs: 50, period: 'mon',),
              propertyCard(post: prpty2, location: 'Baifra, Kinondoni, Dar es Salaam', price: 3000000, noRooms: 2, sqMtrs: 20, period: 'mon',),
              propertyCard(post: prpty3, location: 'Baifra, Kinondoni, Dar es Salaam', price: 70000000, noRooms: 4, sqMtrs: 18, period: 'yr',),
              propertyCard(post: prpty4, location: 'Baifra, Kinondoni, Dar es Salaam', price: 100000, noRooms: 1, sqMtrs: 15, period: 'week',),
            ],
          ),
          // SizedBox(
          //   height: 600,
          //   child: ListView.builder(
          //     padding: const EdgeInsets.all(8.0),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 10,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(15.0),
          //         child: Container(
          //           width: 540,
          //           decoration: BoxDecoration(
          //               color: Colors.grey.shade200,
          //               borderRadius: BorderRadius.circular(8.0),
          //               boxShadow: basicShadow
          //           ),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Expanded(
          //                 child: Container(
          //                   height: 300,
          //                   decoration: BoxDecoration(
          //                       color: pRed,
          //                       borderRadius: const BorderRadius.vertical(top: Radius.circular(0.0)),
          //                       image: DecorationImage(
          //                         image: AssetImage(constructionImage),
          //                         fit: BoxFit.cover,
          //                       )
          //                   ),
          //                 ),
          //               ),
          //              Expanded(
          //                child: Container(
          //                  padding: const EdgeInsets.all(10.0),
          //                  decoration: const BoxDecoration(
          //                    color: Colors.white,
          //                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(.0))
          //                  ),
          //                  child: Column(
          //                    crossAxisAlignment: CrossAxisAlignment.start,
          //                    children: [
          //                      RichText(
          //                          text: TextSpan(
          //                              children: [
          //                                TextSpan(
          //                                    text: 'Baifra, Kinondoni, Dar es Salaam\n',
          //                                    style: GoogleFonts.poppins(
          //                                        fontWeight: FontWeight.w400,
          //                                        fontSize: 28,
          //                                        color: Colors.black
          //                                    )
          //                                ),
          //                              ]
          //                          )
          //                      ),
          //                      Row(
          //                        children: [
          //                          RichText(
          //                              text: TextSpan(
          //                                  children: [
          //                                    TextSpan(
          //                                        text: 'Tshs 120,000,000',
          //                                        style: GoogleFonts.poppins(
          //                                            fontWeight: FontWeight.w500,
          //                                            fontSize: 18,
          //                                            color: lRed
          //                                        )
          //                                    ),
          //                                  ]
          //                              )
          //                          ),
          //                          const VerticalDivider(
          //                            color: Colors.black,
          //                            thickness: .8,
          //                          ),
          //                          RichText(
          //                              text: TextSpan(
          //                                  children: [
          //                                    TextSpan(
          //                                        text: '50 sq/ft',
          //                                        style: GoogleFonts.poppins(
          //                                            fontWeight: FontWeight.w400,
          //                                            fontSize: 18,
          //                                            color: Colors.grey[800]
          //                                        )
          //                                    ),
          //                                  ]
          //                              )
          //                          ),
          //                          const VerticalDivider(
          //                            color: Colors.black,
          //                            thickness: .8,
          //                          ),
          //                          RichText(
          //                              text: TextSpan(
          //                                  children: [
          //                                    TextSpan(
          //                                        text: '4 Bedrooms',
          //                                        style: GoogleFonts.poppins(
          //                                            fontWeight: FontWeight.w400,
          //                                            fontSize: 18,
          //                                            color: Colors.grey[800]
          //                                        )
          //                                    ),
          //                                  ]
          //                              )
          //                          ),
          //                        ],
          //                      ),
          //                      sbH10,
          //                      RichText(
          //                          text: TextSpan(
          //                              children: [
          //                                TextSpan(
          //                                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
          //                                    style: GoogleFonts.poppins(
          //                                        fontWeight: FontWeight.w300,
          //                                        fontSize: 18,
          //                                        color: Colors.black
          //                                    )
          //                                ),
          //                              ]
          //                          )
          //                      ),
          //                    ],
          //                  ),
          //                ),
          //              )
          //               // Padding(
          //               //   padding: const EdgeInsets.all(8.0),
          //               //   child: Container(
          //               //     padding: const EdgeInsets.all(10.0),
          //               //     decoration: BoxDecoration(
          //               //       color: Theme.of(context).colorScheme.secondary,
          //               //       borderRadius: BorderRadius.circular(6.0),
          //               //     ),
          //               //     child: Text(
          //               //       'For Sale',
          //               //       style: GoogleFonts.poppins(
          //               //           fontWeight: FontWeight.w500,
          //               //           fontSize: 18,
          //               //           color: Colors.white
          //               //       ),
          //               //     ),
          //               //   ),
          //               // )
          //               // sbH5,
          //               // Padding(
          //               //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //               //   child: RichText(
          //               //       text: TextSpan(
          //               //           children: [
          //               //             TextSpan(
          //               //                 text: '\$1,200,000 \n',
          //               //                 style: GoogleFonts.galdeano(
          //               //                     fontWeight: FontWeight.w600,
          //               //                     fontSize: 35,
          //               //                     color: Colors.black
          //               //                 )
          //               //             ),
          //               //             TextSpan(
          //               //                 text: 'Gorgeous Apartment Building',
          //               //                 style: GoogleFonts.poppins(
          //               //                     fontSize: 18,
          //               //                     fontWeight: FontWeight.w500,
          //               //                     color: Theme.of(context).colorScheme.secondary
          //               //                 )
          //               //             ),
          //               //           ]
          //               //       )),
          //               // ),
          //               // sbH5,
          //               // TextButton(
          //               //   onPressed: (){},
          //               //   child: Row(
          //               //     children: [
          //               //       const Icon(
          //               //         Icons.location_on_outlined,
          //               //         color: Colors.black,
          //               //       ),
          //               //       Text(
          //               //         'Baifra, Kinondoni, Dar es Salaam',
          //               //         style: GoogleFonts.poppins(
          //               //             color: Colors.grey.shade600,
          //               //             fontWeight: FontWeight.w500
          //               //         ),
          //               //       ),
          //               //     ],
          //               //   ),
          //               // ),
          //               // sbH2,
          //               // const Divider(
          //               //   color: Colors.black,
          //               //   thickness: .8,
          //               // ),
          //               // sbH5,
          //               // Row(
          //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               //   children: [
          //               //     TextButton(onPressed: (){}, child: Row(
          //               //       mainAxisAlignment: MainAxisAlignment.start,
          //               //       children: [
          //               //         const Icon(
          //               //           Icons.hotel_outlined,
          //               //           color: Colors.black,
          //               //         ),
          //               //         Text(
          //               //           ' 5 rooms',
          //               //           style: GoogleFonts.poppins(
          //               //             color: Colors.black,
          //               //           ),
          //               //         ),
          //               //       ],
          //               //     )),
          //               //     TextButton(onPressed: (){}, child: Row(
          //               //       mainAxisAlignment: MainAxisAlignment.start,
          //               //       children: [
          //               //         const Icon(
          //               //           Icons.bathtub_outlined,
          //               //           color: Colors.black,
          //               //         ),
          //               //         Text(
          //               //           '5  bathrooms',
          //               //           style: GoogleFonts.poppins(
          //               //             color: Colors.black,
          //               //           ),
          //               //         ),
          //               //       ],
          //               //     ))
          //               //   ],
          //               // ),
          //               // sbH20,
          //               // Row(
          //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               //   children: [
          //               //     TextButton(onPressed: (){},
          //               //         child: Row(
          //               //           mainAxisAlignment: MainAxisAlignment.start,
          //               //           children: [
          //               //             const Icon(
          //               //               Icons.stairs_outlined,
          //               //               color: Colors.black,
          //               //             ),
          //               //             Text(
          //               //               '2 floors',
          //               //               style: GoogleFonts.poppins(
          //               //                 color: Colors.black,
          //               //               ),
          //               //             ),
          //               //           ],
          //               //         )
          //               //     ),
          //               //     TextButton(onPressed: (){},
          //               //         child: Row(
          //               //           mainAxisAlignment: MainAxisAlignment.start,
          //               //           children: [
          //               //             const Icon(
          //               //               Icons.landscape_outlined,
          //               //               color: Colors.black,
          //               //             ),
          //               //             Text(
          //               //               '1300 square feet',
          //               //               style: GoogleFonts.poppins(
          //               //                 color: Colors.black,
          //               //               ),
          //               //             ),
          //               //           ],
          //               //         )
          //               //     ),
          //               //
          //               //   ],
          //               // ),
          //               // sbH5,
          //               // const Divider(
          //               //   color: Colors.black,
          //               //   thickness: .8,
          //               // ),
          //               // Row(
          //               //   mainAxisAlignment: MainAxisAlignment.end,
          //               //   children: [
          //               //     Padding(
          //               //       padding: const EdgeInsets.all(8.0),
          //               //       child: Container(
          //               //         padding: const EdgeInsets.all(8.0),
          //               //         decoration: BoxDecoration(
          //               //             color: Theme.of(context).colorScheme.secondary,
          //               //             borderRadius: BorderRadius.circular(6.0)
          //               //         ),
          //               //         child: TextButton(onPressed: (){}, child: Text(
          //               //           'Details',
          //               //           style: GoogleFonts.poppins(
          //               //               fontWeight: FontWeight.w500,
          //               //               fontSize: 18,
          //               //               color: Colors.white,
          //               //               letterSpacing: 1.5
          //               //           ),
          //               //         )),
          //               //       ),
          //               //     )
          //               //   ],
          //               // ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: lRed,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: .9,
                    )
                ),
                child: TextButton(onPressed: (){}, child: Text(
                  'View More Properties',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    wordSpacing: 1.5,
                  ),
                )),
              )
            ],
          ),
          sbH50
        ],
      ),
    );
  }
}
