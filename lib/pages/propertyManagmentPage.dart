import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housing_information_website/pages/postPage.dart';
import 'package:housing_information_website/themes/theme.dart';

import '../widgets/containers/myPostContainer.dart';
import '../widgets/pageHeader.dart';

class propertyManagementPage extends StatefulWidget {
  const propertyManagementPage({super.key});

  @override
  State<propertyManagementPage> createState() => _propertyManagementPageState();
}

class _propertyManagementPageState extends State<propertyManagementPage> {
  showPost(BuildContext context, String postId) async {
    return showDialog(context: context, builder:
        (context){
      return postPage(postId: postId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: lRed,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const pageHeader(title: 'Our Services', fontSize: 40, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('Posts')
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
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width <1080?MediaQuery.of(context).size.width<900?2:3:4,
                childAspectRatio: 4/4),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showPost(context, snapshot.data!
                          .docs[index]
                          .data()['postId']);
                    },
                    child: myPostContainer(
                      postId: snapshot.data!
                          .docs[index]
                          .data(),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
