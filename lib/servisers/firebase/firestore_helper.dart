import 'dart:developer';
import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/customer_model.dart';
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
    await firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }
  acceptedCustomer(CustomerModel customerModel) async {
    await firebaseFirestore.collection('Customer').doc(customerModel.id).set(customerModel.toMap());
  }
  rejectedUser(UserApp user) async {
    await firebaseFirestore.collection('usersRejected').doc(user.id).set(user.toMap());
  }
addCategory(CategoryModel categoryModel)async{
  await firebaseFirestore.collection('Category').doc(categoryModel.id).set(categoryModel.toMap());

}
  rejectedCustomer(CustomerModel customerModel) async {
    await firebaseFirestore.collection('CustomersRejected').doc(customerModel.id).set(customerModel.toMap());
  }
  deletefromUsersAwaiting(String userID)async{
    await firebaseFirestore.collection('usersWaiting').doc(userID).delete();
  }
  deletefromCustomerAwaiting(String userID)async{
    await firebaseFirestore.collection('customersWaiting').doc(userID).delete();
  }
  Future<UserApp> getUserFromWaiting(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('usersWaiting').doc(userid).get();

      Map<String, dynamic>? userData = document.data();
      userData?['id'] = document.id;

    if(userData !=null) {
      UserApp gdUser = UserApp.fromMap(userData);
      return gdUser;
    }
    return getUserFromAccepted(userid);
  }
  Future<UserApp> getUserFromAccepted(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(userid).get();
    Map<String, dynamic>? userData = document.data();
    userData?['id'] = document.id;
    if(userData !=null) {
      UserApp gdUser = UserApp.fromMap(userData);
      return gdUser;
    }
    return getUserFromReject(userid);
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
  Future<List<UserApp>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('users').get();
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
  Future<List<CategoryModel>> getAllCategory() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('Category').get();
    List<CategoryModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      CategoryModel categoryModel = CategoryModel.formMap(documentMap);
      return categoryModel;
    }).toList();
    return allAsset;
  }
  Future<List<CustomerModel>> getAllCustomer() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('Customer').get();
    List<CustomerModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      CustomerModel customerModel = CustomerModel.fromMap(documentMap);
      return customerModel;
    }).toList();
    return allAsset;
  }
  Future<List<CustomerModel>> getAllCustomerWaiting() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('customersWaiting').get();
    List<CustomerModel> allUser = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      CustomerModel userApp = CustomerModel.fromMap(documentMap);
      return userApp;
    }).toList();
    return allUser;
  }
  Future disableUser(String userId)async{
  await firebaseFirestore.collection('users').doc(userId).update({'disable': false});
}
}
