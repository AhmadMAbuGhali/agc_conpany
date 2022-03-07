import 'package:agc_conpany/test.dart';
import 'package:agc_conpany/ui/nav_bar.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
              localizationsDelegates: [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                Locale(
                    'ar', 'SA'), // OR Locale('ar', 'AE') OR Other RTL locales
              ],
              locale: Locale(
                  'ar', 'SA'), // OR Locale('ar', 'AE') OR Other RTL locales,
              debugShowCheckedModeBanner: false,
              home: SplashScreenView(
                navigateRoute: Login(),
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
            ));
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}
