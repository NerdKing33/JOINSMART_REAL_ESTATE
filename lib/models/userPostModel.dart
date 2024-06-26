import 'package:cloud_firestore/cloud_firestore.dart';

class postModel {
  final String uid;
  final String postId;
  final DateTime datePublished;
  final String price;
  final String noRooms;
  final String noBathrooms;
  final String noFloors;
  final String area;
  final String mainPost;
  final List secondaryPosts;
  final String propertyLocation;
  final String description;
  final String agentNumber;
  final String postVideo;
  final String propertyTitle;
  final String propertyType;
  final String paymentPeriod;
  final GeoPoint mapLocation;

  postModel({
    required this.noRooms,
      required this.noBathrooms,
      required this.area,
      required this.secondaryPosts,
      required this.description,
      required this.price,
      required this.postId,
      required this.datePublished,
      required this.uid,
      required this.propertyLocation,
      required this.mainPost,
      required this.agentNumber,
      required this.postVideo,
      required this.mapLocation,
      required this.propertyTitle,
    required this.propertyType,
    required this.noFloors,
    required this.paymentPeriod,
  });

  Map<String, dynamic> detailsMapper() => {
        'postId': postId,
        'noRooms': noRooms,
        'noBathrooms': noBathrooms,
        'area': area,
        'secondaryPosts': secondaryPosts,
        'description': description,
        'price': price,
        'uid': uid,
        'datePublished': datePublished,
        'propertyLocation': propertyLocation,
        'mainPost': mainPost,
        'agentNumber': agentNumber,
        'postVideo': postVideo,
        'mapLocation': mapLocation,
        'propertyTitle': propertyTitle,
        'propertyType': propertyType,
        'noFloors': noFloors,
        'paymentPeriod': paymentPeriod,
      };

  static postModel fromData(DocumentSnapshot data) {
    var snapshot = (data.data() as Map<String, dynamic>);
    return postModel(
        postId: snapshot['postId'],
        noRooms: snapshot['noRooms'],
        noBathrooms: snapshot['noBathrooms'],
        area: snapshot['area'],
        secondaryPosts: snapshot['secondaryPosts'],
        description: snapshot['description'],
        price: snapshot['price'],
        datePublished: snapshot['datePublished'],
        uid: snapshot['uid'],
        propertyLocation: snapshot['propertyLocation'],
        mainPost: snapshot['mainPost'],
        agentNumber: snapshot['agentNumber'],
        postVideo: snapshot['postVideo'],
        mapLocation: snapshot['mapLocation'],
      propertyTitle: snapshot['propertyTitle'],
      propertyType: snapshot['propertyType'],
      noFloors: snapshot['noFloors'],
      paymentPeriod: snapshot['paymentPeriod'],
    );
  }
}
