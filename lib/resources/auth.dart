import 'dart:io';
import 'package:housing_information_website/models/user.dart' as model;
import 'package:housing_information_website/models/userPostModel.dart';
import 'package:housing_information_website/models/userRetakeProfilePicModel.dart' as model;
import 'package:housing_information_website/resources/firebaseStorage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/userNewEmail.dart' as model;
import '../models/userPreference.dart' as model;
import '../models/userRename.dart' as model;
import '../models/userRenumber_.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  String postUid = const Uuid().v1();
  String geoLocUid = const Uuid().v1();

  //signUpUser
  Future<String> signUpUser(
  {
    required String username,
    required String password,
    required String userEmail,
    required String userNumber,
    required String userTitle,
  }) async {
    String res = "error";
    try {
      if (username.isNotEmpty ||
          password.isNotEmpty ||
          userEmail.isNotEmpty ||
          userNumber.isNotEmpty) {
        UserCredential id = await _auth.createUserWithEmailAndPassword(
          email: userEmail,
          password: password,
        );


        model.userModel theUser = model.userModel(
            username: username,
            userEmail: userEmail,
            uid: id.user!.uid,
            userNumber: userNumber,
            userTitle: userTitle
        );
        await _store
            .collection('Users')
            .doc(id.user!.uid)
            .set(theUser.objMapper());
        res = 'Success';
      } else {
        res = 'Enter All Fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//loginUser
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        res = 'Success';
      } else {
        res = 'Enter All Fields';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> signOut() async {
    String res = 'error';
    try {
      await _auth.signOut();
      res = 'Success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //userPostUpload
  Future<String> propertyUpload({
    required  String noRooms,
    required  String noBathrooms,
    required  String noFloors,
    required String area,
    required  String description,
    required  String price,
    required  String propertyTitle,
    required  String propertyType,
    required  String uid,
    required  String agentNumber,
    required  String paymentPeriod,
    required String propertyLocation,
      required List<Uint8List> secondaryPosts,
      required Uint8List mainPost,
      required String postVideo,
      required GeoPoint mapLocation,
  }) async {
    String res = "error";
    try {
      if(paymentPeriod == 'Full'){
        paymentPeriod = '=';
      }
      if (noRooms.isNotEmpty ||
          noBathrooms.isNotEmpty ||
          area.isNotEmpty ||
          price.isNotEmpty ||
          noFloors.isNotEmpty ||
          propertyLocation.isNotEmpty ||
          agentNumber.isNotEmpty ||
          propertyTitle.isNotEmpty ||
          propertyType.isNotEmpty ||
          paymentPeriod.isNotEmpty ||
          uid.isNotEmpty ||
          secondaryPosts.isNotEmpty ||
          mainPost.isNotEmpty) {

        List<String> mainUrls = [];
        for (int k = 0; k < secondaryPosts.length; k++) {
          mainUrls.add(await storageMethods()
              .imageUploads('posts', 'secondaryPosts', secondaryPosts[k]));
        }
        String mainUrl =
            await storageMethods().imageUpload('posts', mainPost, true);

        postModel userPost = postModel(
          noRooms: noRooms,
          noBathrooms: noBathrooms,
          area: area,
          secondaryPosts: mainUrls,
          description: description,
          price: price,
          postId: postUid,
          datePublished: DateTime.now(),
          uid: uid,
          propertyLocation: propertyLocation,
          mainPost: mainUrl,
          agentNumber: agentNumber,
          postVideo: '',
          mapLocation: mapLocation,
          propertyTitle: propertyTitle,
          propertyType: propertyType,
          noFloors: noFloors,
          paymentPeriod: paymentPeriod,
        );
        _store.collection('Posts').doc(postUid).set(userPost.detailsMapper());
        res = 'Success';
      } else {
        res = 'Input All Fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//getUserDetails
  Future<model.userModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot data = await _store.collection('Users').doc(currentUser.uid).get();
    return model.userModel.fromData(data);
  }

  //getUserPreferenceDetails
  Future<model.userPreferenceData> getUserPreferenceDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot data =
        await _store.collection('Preferences').doc(currentUser.uid).get();
    return model.userPreferenceData.fromData(data);
  }

  //getUserPostDetails
  Future<postModel> getUserPostDetails() async {
    String postUid = const Uuid().v1();
    DocumentSnapshot data = await _store.collection('Posts').doc(postUid).get();
    return postModel.fromData(data);
  }

  //userPreference
  Future<String> userPreference({
    required String startBudget,
    required String endBudget,
    required String targetLocation,
  }) async {
    String res = "error";
    try {
      if (startBudget.isNotEmpty ||
          endBudget.isNotEmpty ||
          targetLocation.isNotEmpty) {
        User currentUser = _auth.currentUser!;
        model.userPreferenceData userPreference = model.userPreferenceData(
          targetLocation: targetLocation,
          startBudget: startBudget,
          uid: _auth.currentUser!.uid,
        );
        await _store
            .collection('Preferences')
            .doc(currentUser.uid)
            .set(userPreference.preferenceMapper());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//userRename
  Future<String> userRename({
    required String userName,
  }) async {
    String res = "error";
    try {
      if (userName.isNotEmpty) {
        User currentUser = _auth.currentUser!;
        model.userRenameModel userRename = model.userRenameModel(
          username: userName,
          uid: currentUser.uid,
        );
        await _store
            .collection('Users')
            .doc(currentUser.uid)
            .update(userRename.renameMapper());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//userNewEmail
  Future<String> userNewEmail({
    required String email,
  }) async {
    String res = "error";
    try {
      if (email.isNotEmpty) {
        User currentUser = _auth.currentUser!;
        model.userNewEmailModel userEmail = model.userNewEmailModel(
          email: email,
          uid: currentUser.uid,
        );
        await _store
            .collection('Users')
            .doc(currentUser.uid)
            .update(userEmail.emailMapper());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//userRenumber
  Future<String> userRenumber({
    required String phonenumber,
  }) async {
    String res = "error";
    try {
      if (phonenumber.isNotEmpty) {
        User currentUser = _auth.currentUser!;
        model.userRenumberModel userRenumber = model.userRenumberModel(
          userNumber: phonenumber,
          uid: currentUser.uid,
        );
        await _store
            .collection('Users')
            .doc(currentUser.uid)
            .update(userRenumber.renumberMapper());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //userRetake
  Future<String> userRetakeProfilePics({
    required Uint8List profilePic,
  }) async {
    String res = "error";
    try {
      if (profilePic.isNotEmpty) {
        String photoUrl = await storageMethods().imageUpload(
          'profilePics',
          profilePic,
          false,
        );
        User currentUser = _auth.currentUser!;
        model.userRetakeProfilePicsModel userRetake =
            model.userRetakeProfilePicsModel(
          profilePic: photoUrl,
          uid: currentUser.uid,
        );
        await _store
            .collection('Users')
            .doc(currentUser.uid)
            .update(userRetake.retakeMapper());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
