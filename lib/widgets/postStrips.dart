import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      height: 780,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: widget.stripBackGColor,
      ),
      child: Column(
        children: [
          sbH5,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.stripTitle,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: widget.stripTitleColor,
                    fontSize: 35
                ),
              )
            ],
          ),
          SizedBox(
            height: 600,
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 470,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: basicShadow
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  color: pRed,
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image: AssetImage(constructionImage),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Text(
                                  'For Sale',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        sbH5,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '\$1,200,000 \n',
                                        style: GoogleFonts.galdeano(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 35,
                                            color: Colors.black
                                        )
                                    ),
                                    TextSpan(
                                        text: 'Gorgeous Apartment Building',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).colorScheme.secondary
                                        )
                                    ),
                                  ]
                              )),
                        ),
                        sbH5,
                        TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                              ),
                              Text(
                                'Baifra, Kinondoni, Dar es Salaam',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                        sbH2,
                        const Divider(
                          color: Colors.black,
                          thickness: .8,
                        ),
                        sbH5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){}, child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.hotel_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  ' 5 rooms',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                            TextButton(onPressed: (){}, child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.bathtub_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  '5  bathrooms',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                        sbH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.stairs_outlined,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      '2 floors',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            TextButton(onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.landscape_outlined,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      '1300 square feet',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                            ),

                          ],
                        ),
                        sbH5,
                        const Divider(
                          color: Colors.black,
                          thickness: .8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(6.0)
                                ),
                                child: TextButton(onPressed: (){}, child: Text(
                                  'Details',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.white,
                                      letterSpacing: 1.5
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          sbH10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: .9,
                    )
                ),
                child: TextButton(onPressed: (){}, child: Text(
                  'View All',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    wordSpacing: 1.5,
                  ),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
