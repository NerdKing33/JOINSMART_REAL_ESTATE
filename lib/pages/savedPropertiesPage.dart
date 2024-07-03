import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing_information_website/pages/postPage.dart';
import 'package:housing_information_website/widgets/containers/myPostContainer.dart';
import '../themes/theme.dart';
import '../widgets/pageHeader.dart';

class savedPropertiesPage extends StatefulWidget {
  final String userId;
  const savedPropertiesPage({super.key, required this.userId});

  @override
  State<savedPropertiesPage> createState() => _savedPropertiesPageState();
}

class _savedPropertiesPageState extends State<savedPropertiesPage> {
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
        title: const pageHeader(title: 'Saved Posts', fontSize: 40, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('Posts')
            .where('saved', arrayContains: widget.userId )
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
                      userId: widget.userId,
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
