
import 'dart:developer';

import 'package:agc_conpany/model/users.dart';
import 'package:agc_conpany/servisers/firebase/firestore_helper.dart';
import 'package:flutter/material.dart';

import '../model/customer_model.dart';

class FireBaseProvider extends ChangeNotifier {
  FireBaseProvider() {
    getAllCustomerWaiting();
    getAllWaitingUser();
    getAllUser();
  }

  List<UserApp> watingUser=[];
  List<CustomerModel> watingCustomer=[];
  List<UserApp> allUser=[];
getAllWaitingUser()async{
  watingUser=await FirestoreHelper.firestoreHelper.getAllUsersWaiting();
  log(watingUser.length.toString());
  notifyListeners();
}
getAllCustomerWaiting()async{
  watingCustomer=await FirestoreHelper.firestoreHelper.getAllCustomerWaiting();
  log(watingCustomer.length.toString());
  notifyListeners();
}
getAllUser()async{
    allUser=await FirestoreHelper.firestoreHelper.getAllUsers();
  log(allUser.length.toString());
  notifyListeners();
}
disableUser(String userId)async{
   await FirestoreHelper.firestoreHelper.disableUser(userId);
  notifyListeners();
}
acceptedUser(UserApp userApp)async{
  await FirestoreHelper.firestoreHelper.acceptedUser(userApp);
  getAllWaitingUser();
  notifyListeners();
}
rejectedUser(UserApp userApp)async{
  await FirestoreHelper.firestoreHelper.rejectedUser(userApp);
  getAllWaitingUser();
  notifyListeners();
}
deleteFromWating(String userId)async{
  await  FirestoreHelper.firestoreHelper.deletefromUsersAwaiting(userId);
  notifyListeners();
}




}