import 'package:agc_conpany/resources/constants_manager.dart';
import 'package:agc_conpany/router_class.dart';
import 'package:agc_conpany/servisers/auth_provider.dart';
import 'package:agc_conpany/ui/navigations_bar/accountant_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/admin_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/driver_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/salesperson_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/secretary_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/storekeeper_nav_bar.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Splash2 extends StatelessWidget {
   Splash2({ Key? key}) : super(key: key);
   User? user;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0)).then((v) async{
      user = await FirebaseAuth.instance.currentUser;
      if(user == null){
        Get.to(Login());
      }else {
        await Provider.of<AuthProvider>(context, listen: false)
            .getUserFromFirebase(user!.uid);

        if (user != null && user!.email == 'admin@admin.com') {
          RouterClass.routerClass.pushWidgetReplacement(AdminNavBar());
          // Get.off(AdminNavBar());
          // ?AdminNavBar(): Login()
        } else if (AppConstants.loggedUser != null) {
          if (AppConstants.loggedUser!.isaccept == false &&
              AppConstants.loggedUser!.isreject == false) {
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('Waiting for Accept'),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          } else if (AppConstants.loggedUser!.isaccept == true) {
            if (AppConstants.loggedUser!.jobtitle == "محاسب") {
              RouterClass.routerClass.pushWidgetReplacement(AccountantNavBar());
              // Get.to(AccountantNavBar());
            } else if (AppConstants.loggedUser!.jobtitle == "سكرتير") {
              RouterClass.routerClass.pushWidgetReplacement(SecretaryNavBar());

              // Get.to(SecretaryNavBar());
            } else if (AppConstants.loggedUser!.jobtitle == "مندوب مبيعات") {
              RouterClass.routerClass.pushWidgetReplacement(
                  SalespersonNavBar());

              // Get.to(SalespersonNavBar());
            } else if (AppConstants.loggedUser!.jobtitle == "أمين مخازن") {
              RouterClass.routerClass.pushWidgetReplacement(
                  StoreKeeperNavBar());

              // Get.to(StoreKeeperNavBar());
            } else {
              RouterClass.routerClass.pushWidgetReplacement(DriverNavBar());

              // Get.to(DriverNavBar());
            }
          } else {
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('Reject from app'),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Ok'),
                        ),
                      ],
                    ),

                  ],
                );
              },
            );
          }
        }
      }
    });
    return Scaffold(
      body: Container(),
    );
  }
}