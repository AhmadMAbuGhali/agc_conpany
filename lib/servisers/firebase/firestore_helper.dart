
import 'dart:developer';

import 'package:agc_conpany/model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  waitingUser(UserApp user) async {
    await firebaseFirestore.collection('usersWaiting').doc(user.id).set(user.toMap());
  }
  acceptedUser(UserApp user) async {
    await firebaseFirestore.collection('usersAccepted').doc(user.id).set(user.toMap());
  }
  rejectedUser(UserApp user) async {
    await firebaseFirestore.collection('usersRejected').doc(user.id).set(user.toMap());
  }

  Future<UserApp> getUserFromWaiting(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('usersWaiting').doc(userid).get();
    Map<String, dynamic>? userData = document.data();
    userData?['id'] = document.id;
    UserApp gdUser = UserApp.fromMap(userData!);
    return gdUser;
  }
  Future<UserApp> getUserFromAccepted(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('usersAccepted').doc(userid).get();
    Map<String, dynamic>? userData = document.data();
    userData?['id'] = document.id;
    UserApp gdUser = UserApp.fromMap(userData!);
    return gdUser;
  }
  Future<UserApp> getUserFromReject(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('usersRejected').doc(userid).get();
    Map<String, dynamic>? userData = document.data();
    userData?['id'] = document.id;
    UserApp gdUser = UserApp.fromMap(userData!);
    return gdUser;
  }
  Future<List<UserApp>> getAllUsersWaiting() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('usersWaiting').get();
    List<UserApp> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      UserApp userApp = UserApp.fromMap(documentMap);
      return userApp;
    }).toList();
    return allAsset;
  }

}
  // deleteCollectio() async {
  //   await firebaseFirestore.collection('users').doc().delete();
  // }

  // addNewAsset(Asset1 asset1) async {
  //   // DocumentReference<Map<String, dynamic>> doc =
  //   await firebaseFirestore.collection('asset').add(asset1.toMap());
  // }
  //
  // Future<List<Asset1>> getAllAsset() async {
  //   QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
  //       await firebaseFirestore.collection('asset').get();
  //
  //   List<Asset1> allAsset = allAssetSnapshot.docs.map((e) {
  //     Map<String, dynamic> documentMap = e.data();
  //     documentMap['id'] = e.id;
  //     // log('firestore helper e.id: ${e.id}');
  //     // log("firestore helper documentMap['id']: ${documentMap['id']}");
  //     Asset1 asset1 = Asset1.fromMap(documentMap);
  //     return asset1;
  //   }).toList();
  //   return allAsset;
  // }

