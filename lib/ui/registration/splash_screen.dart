import 'package:agc_conpany/servisers/auth_provider.dart';
import 'package:agc_conpany/ui/registration/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0)).then((v) async {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        // RouterClass.routerClass.pushWidget(LoginScreen());
      } else {
        // await Provider.of<AuthProvider>(context, listen: false)
        //     .getUserFromFirebase();
        //
        // RouterClass.routerClass.pushWidget(HomeScreen());
      }
    });
    return Scaffold(
      body:  SplashScreenView(
        navigateRoute: SingUP(),
        duration: 4000,
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
