import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/propertyCard.dart';
import '../impVariable.dart';
import '../themes/theme.dart';

class homePagePostStrip extends StatefulWidget {

  const homePagePostStrip({super.key,});

  @override
  State<homePagePostStrip> createState() => _homePagePostStripState();
}

class _homePagePostStripState extends State<homePagePostStrip> {
  propertiesPageNav(){
    setState(() {
      navIndex = 1;
    });
    Navigator.pushReplacementNamed(context, '/navigationPage');
  }
  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
       stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
       builder: (BuildContext context,
           AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return Center(
             child: SizedBox(
               height: 100,
               width: 100,
               child: CircularProgressIndicator(
                 strokeWidth: 5,
                 color: Colors.red.shade400,
               ),
             ),
           );
         }
         return Container(
           padding: const EdgeInsets.all(8.0),
           decoration: BoxDecoration(
             color: Colors.grey[100],
           ),
           child: Column(
             children: [
               sbH30,
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'Featured Properties',
                     style: GoogleFonts.poppins(
                         fontWeight: FontWeight.w600,
                         color: Colors.black,
                         fontSize: 35
                     ),
                   )
                 ],
               ),
               sbH30,
               SizedBox(
                 height: 850,
                 child: ListView.builder(
                   itemCount: snapshot.data!.docs.isNotEmpty ? snapshot.data!.docs.length:0,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (BuildContext context, int index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: snapshot.data!.docs.isNotEmpty ? SizedBox(
                         width: 800,
                         child: propertyCard(
                           postId: snapshot.data!.docs[index].data(),
                         ),
                       ):sb0,
                     );
                   },
                 ),
               ),
               sbH20,
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     padding: const EdgeInsets.all(8.0),
                     decoration: BoxDecoration(
                         color: lRed,
                         borderRadius: BorderRadius.circular(5.0),
                         border: Border.all(
                           color: Theme
                               .of(context)
                               .colorScheme
                               .secondary,
                           width: .9,
                         )
                     ),
                     child: TextButton(
                         onPressed: () {
                           propertiesPageNav();
                     }, child: Text(
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
       },
     );
  }
}
