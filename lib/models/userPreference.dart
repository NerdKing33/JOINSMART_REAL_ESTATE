import 'package:cloud_firestore/cloud_firestore.dart';


class userPreferenceData{
  final String targetLocation;
  final String startBudget;
  final String uid;

  userPreferenceData({
    required this .targetLocation,
    required this.startBudget,
    required this.uid
  });

  Map<String, dynamic> preferenceMapper() =>
      {
        'startBudget': startBudget,
        'targetLocation': targetLocation,
        'uid': uid,
      };

  static userPreferenceData fromData (DocumentSnapshot data){
    var snapshot = (data.data() as Map<String,dynamic>);
    return userPreferenceData
      (
        targetLocation: snapshot['targetLocation'],
        startBudget: snapshot['startBudget'],
        uid: snapshot['uid']
    );
  }

}