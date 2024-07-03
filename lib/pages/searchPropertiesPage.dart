import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../impVariable.dart';
import '../themes/theme.dart';
import '../widgets/pageHeader.dart';
import '../widgets/propertyCard.dart';

class searchPropertiesPage extends StatefulWidget {
  final String location;
  final String propertyType;
  searchPropertiesPage({super.key, required this.location, required this.propertyType});

  @override
  State<searchPropertiesPage> createState() => _searchPropertiesPageState();
}

class _searchPropertiesPageState extends State<searchPropertiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: lRed,
          ),
        ),
        centerTitle: true,
        title: const pageHeader(title: 'Results of Properties Search', fontSize: 30, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 0, width: 0),
        backgroundColor: Colors.white,
      ),
      body:FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Posts').where('propertyLocation', isEqualTo: widget.location)
            .where('propertyType', isEqualTo: widget.propertyType)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 300),
                Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.red.shade400,
                    ),
                  ),
                )
              ],
            );
          }
          return  ListView(
            padding: const EdgeInsets.all(10.0),
            children:  [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  scrollDirection: MediaQuery.of(context).size.width >= 1300 ? Axis.vertical:Axis.horizontal,
                  itemCount:  snapshot.data!.docs.isNotEmpty ? snapshot.data!.docs.length:1,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width >= 1300 ? 2:1,),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: snapshot.data!.docs.isNotEmpty ? propertyCard(
                          postId: snapshot.data!.docs[index].data(),
                        ):Center(
                          child: Text(
                            'No Properties With Those Qualities',
                            style: GoogleFonts.rajdhani(
                                fontSize: 24,
                                color: Colors.grey[800]
                            ),
                          ),
                        ));
                  },
                ),
              ),
              sbH20,
              snapshot.data!.docs.isNotEmpty ? pageHeader(title: 'Loading Up More Properties ....', fontSize: 18, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w400, height: 0, width: 0 , color: Colors.grey.shade800,):sb0,
            ],
          );
        },
      )
    );
  }
}
