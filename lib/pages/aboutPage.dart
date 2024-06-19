import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
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
                // Services Section
                const pageHeader(
                  title: 'Services ',
                  fontSize: 40,
                  mainAxisAlignment: MainAxisAlignment.start,
                  fontWeight: FontWeight.w500,
                  height: .0,
                  width: .0,
                ),
                sbH2,sbH2,sbH2,sbH10,
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 4/2.8,
                  shrinkWrap: true,
                  children: [
                    serviceCard1(
                      icon: Icons.real_estate_agent_outlined,
                      title: "Real Estate Service",
                      description: "At JIC, we bring professional expertise to every aspect of community association management and related real estate services. Trust our industry-leading experience to handle your property management needs with excellence",
                    ),
                    serviceCard1(
                      icon: Icons.house_outlined,
                      title: "House Ownership",
                      description: "At JIC, we ensure quality housing ownership services tailored to your needs. Leveraging our professional experience, we not only serve but also provide expert consulting to guide you every step of the way.",
                    ),
                    serviceCard1(
                      icon: Icons.location_on_outlined,
                      title: "Land Ownership",
                      description: "At JIC, we understand that land ownership is crucial for community development. We ensure our clients secure the best properties by strictly adhering to local land tenure laws and regulations. Trust us to guide you through the process with expertise and integrity.",
                    ),
                    serviceCard1(
                      icon: Icons.build_outlined,
                      title: "Construction",
                      description: "Explore our gallery featuring ongoing building projects and homes under construction, highlighting our commitment to meticulous craftsmanship and attention to detail. Join us in creating exceptional spaces where dreams become reality.",
                    ),
                  ],
                ),
                sbH2,sbH2,sbH2,sbH2,sbH20,
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
              ],
            ),
          ),
        ),]
      ),
    );
  }
}

