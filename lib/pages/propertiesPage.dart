import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import '../impVariable.dart';
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
      backgroundColor: Colors.grey[100],
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
           SizedBox(
             height: MediaQuery.of(context).size.height*.9,
             width: MediaQuery.of(context).size.width,
             child: GridView.builder(
               scrollDirection: MediaQuery.of(context).size.width >= 1300 ? Axis.vertical:Axis.horizontal,
             itemCount:  snapshot.data!.docs.isNotEmpty ? snapshot.data!.docs.length:0,
             gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: MediaQuery.of(context).size.width >= 1300 ? 2:1,),
             itemBuilder: (BuildContext context, int index) {
             return Padding(
                 padding: const EdgeInsets.all(8.0),
               child: snapshot.data!.docs.isNotEmpty ? propertyCard(
               postId: snapshot.data!.docs[index].data(),
               ):sb0);
             },
             ),
           ),
              sbH10,
              pageHeader(title: 'Loading Up More Properties ....', fontSize: 18, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w400, height: 0, width: 0 , color: Colors.grey.shade800,),
            sbH20,
            ],
          );
        },
      ),
    );
  }
}
