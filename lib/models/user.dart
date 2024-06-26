import 'package:cloud_firestore/cloud_firestore.dart';

class userModel{
  final String userName;
  final String uid ;
  final String userEmail ;
  final String? profilePic ;
  final String userNumber;
  final String userTitle;

  userModel({
   this.userName='',
   this.userEmail = '',
    this.uid ='',
    this.profilePic,
     this.userNumber = '',
    this.userTitle = '',
  });

  Map<String,dynamic> objMapper() => {
    'userName' :userName,
    'uid' :uid,
    'userEmail'  :userEmail,
    'profilePic' :profilePic,
    'userNumber' :userNumber,
    'userTitle' :userTitle,
  };

 static userModel fromData (DocumentSnapshot data){
   var snapshot = (data.data() as Map<String,dynamic>);
   return userModel
     (
     userName: snapshot['username'],
     userEmail: snapshot['userEmail'],
     uid: snapshot['uid'],
     profilePic: snapshot['profilePic'],
     userNumber: snapshot['userNumber'],
     userTitle: snapshot['userTitle'],
   );
 }
}

