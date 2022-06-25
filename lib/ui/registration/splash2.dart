import 'package:agc_conpany/resources/constants_manager.dart';
import 'package:agc_conpany/servisers/auth_provider.dart';
import 'package:agc_conpany/ui/navigations_bar/accountant_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/admin_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/driver_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/salesperson_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/secretary_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/storekeeper_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Splash2 extends StatelessWidget {
   Splash2({ Key? key}) : super(key: key);
   User? user;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0)).then((v) {
      Provider.of<AuthProvider>(context,listen: false).getUserFromFirebase();
      user = FirebaseAuth.instance.currentUser;
    if(user != null&& user!.email=='admin@admin.com' ){
      Get.off(AdminNavBar());
      // ?AdminNavBar(): Login()
    }else if (AppConstants.loggedUser != null) {
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
            Get.to(AccountantNavBar());
          }else if(AppConstants.loggedUser!.jobtitle == "سكرتير"){
            Get.to(SecretaryNavBar());
          }else if(AppConstants.loggedUser!.jobtitle == "مندوب مبيعات"){
            Get.to(SalespersonNavBar());
          }else if(AppConstants.loggedUser!.jobtitle == "أمين مخازن"){
            Get.to(StoreKeeperNavBar());
          }else{
            Get.to(DriverNavBar());
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
      }

    });
    return Scaffold(
      body: Container(),
    );
  }
}