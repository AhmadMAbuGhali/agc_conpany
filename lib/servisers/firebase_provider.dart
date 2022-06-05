
import 'dart:developer';

import 'package:agc_conpany/model/users.dart';
import 'package:agc_conpany/servisers/firebase/firestore_helper.dart';
import 'package:flutter/material.dart';

class FireBaseProvider extends ChangeNotifier {
  FireBaseProvider() {
    getAllWaitingUser();
  }

  List<UserApp> watingUser=[];
getAllWaitingUser()async{
  watingUser=await FirestoreHelper.firestoreHelper.getAllUsersWaiting();
  log(watingUser.length.toString());
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