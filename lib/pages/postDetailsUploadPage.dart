import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/themes/theme.dart';
import 'package:housing_information_website/widgets/detailsDropdown/floorDetails.dart';

import '../widgets/detailsDropdown/areaDetails.dart';
import '../widgets/detailsDropdown/bathroomsDetails.dart';
import '../widgets/detailsDropdown/locationCityDetails.dart';
import '../widgets/detailsDropdown/roomDetails.dart';
import '../widgets/pageHeader.dart';
import '../widgets/textInput.dart';

class postDetailsUploadPage extends StatefulWidget {
  const postDetailsUploadPage({super.key});

  @override
  State<postDetailsUploadPage> createState() => _postDetailsUploadPageState();
}

class _postDetailsUploadPageState extends State<postDetailsUploadPage> {
  final _formKey1 = GlobalKey<FormState>();
  bool isLoading = false;
   TextEditingController acersController = TextEditingController();
   TextEditingController roomController = TextEditingController();
   TextEditingController bathroomController = TextEditingController();
   TextEditingController locationController = TextEditingController();
   TextEditingController locationSpecificController = TextEditingController();
   TextEditingController descriptionController = TextEditingController();
   TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const pageHeader(title: 'Property Details Upload Page', fontSize: 30, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 0, width: 0),
        backgroundColor: Colors.white,
      ),
       body: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                width: 500,
                height: 800,
                child: Form(
                  key: _formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // //title
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 18.0, right: 8.0, top: 8.0, bottom: 8.0),
                      //   child: Row(
                      //     children: [
                      //       //title
                      //       Text(
                      //         'Set Your House\'s Details',
                      //         style: GoogleFonts.poppins(
                      //           color: Colors.black,
                      //           fontSize: 30,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //instruction
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 18.0, right: 8.0, top: 0.0, bottom: 0.0),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'fill in all fields before moving to the next step',
                      //         style: GoogleFonts.poppins(
                      //             color: Colors.black,
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w300)
                      //         ,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //detailedLocation
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: pageHeader(title: 'Add Post Details', fontSize: 40, mainAxisAlignment: MainAxisAlignment.start, fontWeight: FontWeight.w400, height: 0, width: 0),
                      ),
                      textInput(
                          controller: locationSpecificController,
                          hinty: 'Enter Street/Ward Location',
                          icon: Icons.location_on_outlined,
                          obscureText: false,
                          textInputType: TextInputType.streetAddress,
                          textCapitalization: TextCapitalization.none,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your the location';
                          }
                          return null;
                        },
                      ),
                      //Description
                      textInput(
                          controller: descriptionController,
                          hinty: 'Enter Description',
                          icon: Icons.add_comment_outlined,
                          obscureText: false,
                          textInputType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter a Description';
                          }
                          return null;
                        },),
                      textInput(
                          controller: priceController,
                          hinty: 'Enter Price',
                          icon: Icons.payments_outlined,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Property Price';
                          }
                          return null;
                        },),
                      //locationDropdown
                      locationCityDetails(textController: locationController,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //floorDetailsDropdown
                          floorDetails(textController: roomController),
                          //roomDetailsDropdown
                          roomDetails(textController: roomController),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //bathroomsDetailsDropdown
                        bathroomsDetails(textController: bathroomController,),
                        //acersDetailsDropdown
                        areaDetails(textController: acersController,),
                      ],
                    ),
                      //ok/nextButton
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 480,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: lRed
                          ),
                          //ifStatement alternative
                          child: isLoading
                              ?
                          //loadingProgressionAlternative
                          Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary,
                              strokeWidth: 4,
                            ),
                          )
                              :
                          //buttonAlternative
                          IconButton(
                            onPressed: (){
                              if (_formKey1.currentState!.validate()) {
                                // If the form is valid, then invoke the API or whatever you want

                              }
                            },
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
         ],
       )
    );
  }
}
