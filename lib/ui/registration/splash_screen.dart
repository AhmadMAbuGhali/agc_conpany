import 'package:agc_conpany/ui/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
