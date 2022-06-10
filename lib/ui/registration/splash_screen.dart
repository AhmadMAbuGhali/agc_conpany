import 'package:agc_conpany/servisers/auth_provider.dart';
import 'package:agc_conpany/ui/navigations_bar/admin_nav_bar.dart';
import 'package:agc_conpany/ui/registration/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
    SplashScreen({Key? key}) : super(key: key);
  User? user;
  @override
  Widget build(BuildContext context) {

     user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body:  SplashScreenView(
        navigateRoute:( user == null&& user!.email=='admin@admin.com' )?AdminNavBar(): SingUP(),
        duration: 5000,
        imageSize: 233,
        imageSrc: 'assets/images/splahlogo.png',
        backgroundColor: Colors.white,
        text: "مجموعة أبناء أبوغالي للإستثمار",
        textType: TextType.TyperAnimatedText,
        textStyle: const TextStyle(
          fontSize: 31.0,
        ),
      ),
    );
  }
}
