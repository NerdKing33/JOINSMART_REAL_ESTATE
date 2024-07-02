import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';

import '../widgets/serviceCard1.dart';

class aboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            width: 900,
            child: Column(
              children: [
                // Hero Image
                Container(
                  decoration: BoxDecoration(
                    boxShadow: basicShadow,
                    shape: BoxShape.circle
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(jeLogo),
                    radius: 180,
                  ),
                ),
              sbH10,sbH2,sbH2,
                // About Us Section
                const pageHeader(
                    title: 'About Us',
                  fontSize: 40,
                  mainAxisAlignment: MainAxisAlignment.start,
                  fontWeight: FontWeight.w500,
                  height: .0,
                  width: .0,
                ),
               sbH2,sbH2,sbH2,sbH10,
                RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Josmart Investment Company business started as a building maintenance team to local individuals around 2013 as a homebased business. Our tradition business model is based on the accomplishment of properties in the real estate market in Tanzania by developing estates/apartments, Lands as well uniting Buyers, Sellers, and Tenants professionally.",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.black
                          ),
                        )
                      ]
                    )
                ),
                sbH20,sbH2,sbH2,
                // Mission and Vision Section
                Text(
                  "Our Mission",
                  style: GoogleFonts.poppins(
                    color: selectedColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sbH2,sbH2,sbH2,sbH10,
                Text(
                  "Mission is to provide first- class services in the area of our core competences that leave our clients happy and thoroughly satisfied",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                    color: Colors.black
                  ),
                ),
                sbH2,sbH2,sbH2,sbH10,
                Text(
                  "Our Vision",
                  style: GoogleFonts.poppins(
                    color: selectedColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sbH2,sbH2,sbH2,sbH10,
                Text(
                  "To become the leading real estate company in Africa providing world class real estate services that meet our clients needs at all times",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                    color: Colors.black
                  ),
                ),
                sbH2,sbH2,sbH2,sbH2,sbH10,
                // Core Values Section
                Text(
                  "Our Core Values",
                  style: GoogleFonts.poppins(
                    color: selectedColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sbH2,sbH2,sbH2,sbH10,
                Text(
                  "We exist to Keep our client satisfied; our colleagues/collaborators happy; our staffs fulfilled and motivated; our management proud and celebrated; our brand competitive and progressive",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                      fontSize: 20
                  ),
                ),
                sbH2,sbH2,sbH2,sbH2,sbH20,
                // Domain Name Section
                Text(
                  "Domain Name",
                  style: GoogleFonts.poppins(
                    color: selectedColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sbH2,sbH2,sbH2,sbH10,
                Text(
                  "www.josmartrealestate.com",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20
                  ),
                ),
                sbH2,sbH2,sbH2,sbH2,sbH20,
                // Images Section
                Text(
                  "Images",
                  style: GoogleFonts.poppins(
                    color: selectedColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sbH10,
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3/2,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: basicShadow,
                          image: DecorationImage(
                              image: AssetImage(constructionImage),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: basicShadow,
                          image: DecorationImage(
                              image: AssetImage(constructionImage),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: basicShadow,
                          image: DecorationImage(
                              image: AssetImage(constructionImage),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: basicShadow,
                          image: DecorationImage(
                              image: AssetImage(constructionImage),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                sbH2,sbH2,sbH2,sbH2,sbH20,
                const pageHeader(title: 'Our Founder', fontSize: 30, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w600, height: 5, width: 60),
                sbH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: pRed,
                        image: DecorationImage(
                            image: AssetImage(dpImage),
                          fit: BoxFit.cover,
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),]
      ),
    );
  }
}

