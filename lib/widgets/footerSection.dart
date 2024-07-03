import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';

class footerSection extends StatefulWidget {
  const footerSection({super.key});

  @override
  State<footerSection> createState() => _footerSectionState();
}

class _footerSectionState extends State<footerSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height * 0.5, // responsive height
    width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      color: Colors.grey[900],
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    navIndex =3;
                  });
                  Navigator.pushReplacementNamed(context, '/navigationPage');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About Us',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        'Our Story',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: (){
                      },
                      child: Text(
                          'Meet Our Founder',
                          style: GoogleFonts.poppins(fontSize: 14),
                          ),
                    ),
                    Text(
                        'Our Values',
                        style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    navIndex =2;
                  });
                  Navigator.pushReplacementNamed(context, '/navigationPage');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Services',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        'Real Estate Agency',
                      style: GoogleFonts.poppins(fontSize:14,)
                    ),
                    Text(
                        'Facility Management',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    Text(
                        'Designing Homes',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    Text(
                        'Renovating Homes',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    Text(
                        'Housing Units Maintenance',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Get in Touch',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      'Contact Us',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      )
    ),
                  Text(
                      'Phone: +255 743 522 226',
                    style: GoogleFonts.poppins(fontSize: 14, ),
                  ),
                  Text(
                      'Email: [info@example.com](mailto:info@example.com)',
                      style: GoogleFonts.poppins(fontSize: 14),
    ),
                  Text(
                    'Location: Mlimani City-Near Lufungila Bus station',
                    style: GoogleFonts.poppins(fontSize: 14, ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 2023 JOSMART ESTATES. All Rights Reserved.',
            style: GoogleFonts.poppins(fontSize: 14,),
          ),
        ],
      ),
    );
  }
}