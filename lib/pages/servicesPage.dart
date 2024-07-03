import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/widgets/pageHeader.dart';
import 'package:housing_information_website/widgets/serviceCard2.dart';

import '../impVariable.dart';
import '../themes/theme.dart';
class servicesPage extends StatelessWidget {
  const servicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    infoCard( String title, String info ){
      return showDialog(context: context, builder: (context){
        return  AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          ),
          backgroundColor: Colors.white,
          title: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: lRed,
                        letterSpacing: 1.5,
                        wordSpacing: 2,
                        fontSize: 30
                    ),
                  )
                ]
            ),
          ),
          content:  RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: info,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                        wordSpacing: 2,
                        fontSize: 24
                    ),
                  )
                ]
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: lRed,
                  width: .5,
                )
              ),
              child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Text(
                    'CLOSE',
                    style: GoogleFonts.poppins(
                        color: lRed,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  )
              ),
            )
          ],
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const pageHeader(title: 'Our Services', fontSize: 40, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Services').snapshots(),
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
              sbH10,
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap:(){
                          infoCard(snapshot.data?.docs[index].data()['title'], snapshot.data?.docs[index].data()['description']);
                        },
                        child: serviceCard2(
                          title: snapshot.data?.docs[index].data()['title'],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ]
          );
        },
      ),
    );}
}

