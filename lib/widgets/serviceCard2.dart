import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';

class serviceCard2 extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const serviceCard2({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.secondary;
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        boxShadow: basicShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(
          //   imagePath,
          //   height: 100,
          // ),
          // const SizedBox(height: 10),
          pageHeader(
              title: title,
              fontSize: 40,
              mainAxisAlignment: MainAxisAlignment.start,
              fontWeight: FontWeight.w500,
              height: 0,
              width: 0,
          ),
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                      text: description,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    )
                  ]
              )
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the service detail page or show a modal
                //  // Replace with your navigation logic
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ServiceDetailPage(
                //       title: title,
                //       description: description,
                //     ),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                backgroundColor: selectedColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: Text(
                'More Info',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}