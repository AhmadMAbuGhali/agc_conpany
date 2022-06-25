import 'dart:developer';
import 'package:agc_conpany/model/users.dart';
import 'package:agc_conpany/resources/constants_manager.dart';
import 'package:agc_conpany/servisers/firebase/auth_helper.dart';
import 'package:agc_conpany/servisers/firebase/firestore_helper.dart';
import 'package:agc_conpany/ui/navigations_bar/admin_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/driver_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/salesperson_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/secretary_nav_bar.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/navigations_bar/accountant_nav_bar.dart';
import '../ui/navigations_bar/storekeeper_nav_bar.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() ;

  SnackBar snackBar = const SnackBar(
    content: Text('Enter All Field!'),
    backgroundColor: Colors.red,
    duration: Duration(milliseconds: 2000),
  );

  register(BuildContext context,String name,String email,String password,String jopTitel,String phoneNumber) async {
   log('start register');
    UserApp userApp = UserApp(name:name,password: password,phonenumber: phoneNumber,jobtitle: jopTitel,email: email );
    try {
      UserCredential? x = await AuthHelper.authHelper
          .createNewAccount(userApp.email!.trim(), userApp.password!.trim());
      userApp.id = x?.user!.uid;
      await FirestoreHelper.firestoreHelper.waitingUser(userApp);
      AppConstants.loggedUser = userApp;
      log('تم التسجيل بنجاح ');
    } on Exception catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().split(']').last),
        backgroundColor: Colors.red,
      ));
    }
  }
  login(BuildContext context,String email,String password) async {
    try {
         await AuthHelper.authHelper.signIn(email,password);
      if (AuthHelper.authHelper.success) {
        String? email = await FirebaseAuth.instance.currentUser!.email;

   if(email=='admin@admin.com'){
     Get.off(AdminNavBar());
   }else{
     await getUserFromFirebase();
     if (AppConstants.loggedUser != null) {
       if(AppConstants.loggedUser!.isaccept==false &&AppConstants.loggedUser!.isreject==false){
         return showDialog(
           context: context,
           builder: (BuildContext context) {
             return AlertDialog(
               content:  const Text('Waiting for Accept'),
               actions:[
                 Row(
                   mainAxisAlignment:MainAxisAlignment.center,
                   children: [
                     ElevatedButton(
                       onPressed: () => Navigator.of(context).pop(false),
                       child:  Text('Ok'),
                     ),
                   ],
                 ),

               ],
             );
           },
         );
       }else if(AppConstants.loggedUser!.isaccept==true){
         if(AppConstants.loggedUser!.jobtitle == "محاسب"){
           Get.off(AccountantNavBar());
         }else if(AppConstants.loggedUser!.jobtitle == "سكرتير"){
           Get.off(SecretaryNavBar());
         }else if(AppConstants.loggedUser!.jobtitle == "مندوب مبيعات"){
           Get.off(SalespersonNavBar());
         }else if(AppConstants.loggedUser!.jobtitle == "أمين مخازن"){
           Get.off(StoreKeeperNavBar());
         }else{
           Get.off(DriverNavBar());
         }

       }else{
         return showDialog(
           context: context,
           builder: (BuildContext context) {
             return AlertDialog(
               content:  const Text('Reject from app'),
               actions:[
                 Row(
                   mainAxisAlignment:MainAxisAlignment.center,
                   children: [
                     ElevatedButton(
                       onPressed: () => Navigator.of(context).pop(false),
                       child:  Text('Ok'),
                     ),
                   ],
                 ),

               ],
             );
           },
         );
       }
     } else {
       return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
         content: Text('خطأ في البريد أو كلمة المرور'),
         backgroundColor: Colors.red,
       ));
     }
   }
      }

    } on Exception catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().split(']').last),
        backgroundColor: Colors.red,
      ));
    }
  }
  getUserFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    AppConstants.loggedUser = await FirestoreHelper.firestoreHelper.getUserFromWaiting(userId);
    AppConstants.loggedUser ??= await FirestoreHelper.firestoreHelper.getUserFromAccepted(userId);
    AppConstants.loggedUser ??= await FirestoreHelper.firestoreHelper.getUserFromReject(userId);
    notifyListeners();
  }

  logOut() async {
    AppConstants.loggedUser = null;
    await AuthHelper.authHelper.logout();
    Get.off(Login());
  }

  forgetPassword(String email) async {
    AuthHelper.authHelper.forgetPassword(email);
  }


}