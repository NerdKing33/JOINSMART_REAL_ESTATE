import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class storageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _authy = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  //uploadingAnImage
  Future<String> imageUpload(
    String childName,
    Uint8List file,
    bool isPost,
  ) async {
    Reference reference =
        _storage.ref().child(childName).child(_authy.currentUser!.uid);
    String id = const Uuid().v1();
    if (isPost = true) {
      reference = reference.child('mainPosts');
      reference = reference.child(id);
    }
    UploadTask uploadTask = reference.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //uploadingSecondaryPosts
  Future<String> imageUploads(
    String childName,
    String type,
    Uint8List images,
  ) async {
    Reference reference =
        _storage.ref().child(childName).child(_authy.currentUser!.uid);
    String id = const Uuid().v1();
    reference = reference.child(type);
    reference = reference.child(id);
    UploadTask uploadTask = reference.putData(images);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> videoUpload(
    String childName,
    String type,
    Uint8List file,
  ) async {
    Reference reference =
        _storage.ref().child(childName).child(_authy.currentUser!.uid);
    String id = const Uuid().v1();
    reference = reference.child(type);
    reference = reference.child(id);
    UploadTask uploadTask = reference.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<Uint8List?> imageDownload(
      String childName,
      Uint8List? file,
      ) async {
    Reference reference =
        _storage.ref().child(childName).child(_authy.currentUser!.uid);
    Future<Uint8List?> downloadTask = reference.getData();
    file = await downloadTask;
    return file;
  }

  //likingAPost
  Future<String> likePost(
    String postId,
    String uid,
    List likes,
  ) async {
    String liked = '';
    try {
      if (likes.contains(uid)) {
        _store.collection('Posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
        liked = 'false';
      } else {
        await _store.collection('Posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
        liked = 'true';
      }
    } catch (err) {
      err.toString();
    }
    return liked;
  }

  //checkingIfPostIsLiked
  Future<bool> isLikedPost(
    String postId,
    String uid,
    List likes,
  ) async {
    bool liked = false;
    if (likes.contains(uid)) {
      liked = true;
    } else {
      liked = false;
    }
    return liked;
  }

  //deletingAPost
  Future<String> deletePost(postId) async {
    String deleted = 'error';
    try {
      await _store.collection('Posts').doc(postId).delete();
      deleted = 'success';
    } catch (err) {
      deleted = err.toString();
    }
    return deleted;
  }
}
