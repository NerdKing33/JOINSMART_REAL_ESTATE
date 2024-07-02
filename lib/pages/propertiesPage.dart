import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:housing_information_website/widgets/homePagePostStrip.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../impVariable.dart';
import '../themes/theme.dart';
import '../widgets/propertyCard.dart';

class propertiesPage extends StatefulWidget {
  const propertiesPage({super.key});

  @override
  State<propertiesPage> createState() => _propertiesPageState();
}

class _propertiesPageState extends State<propertiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
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
          }return ListView(
            padding: const EdgeInsets.all(10.0),
            children:  [
              const pageHeader(title: 'FIND YOUR DREAM PROPERTY HERE...', fontSize: 24, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w400, height: 5, width: 20),
           sbH20,
           GridView.builder(
           itemCount: snapshot.data!.docs.length,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2),
           itemBuilder: (BuildContext context, int index) {
           return propertyCard(
           postId: snapshot.data!.docs[index].data()['postId'],);
           },
           ),
              sbH20,
              pageHeader(title: 'Loading Up More Properties ....', fontSize: 18, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w400, height: 0, width: 0 , color: Colors.grey.shade800,)
            ],
          );
        },
      ),
    );
  }
}
