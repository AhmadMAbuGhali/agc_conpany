import 'package:agc_conpany/resources/theme_manager.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:agc_conpany/ui/registration/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) =>  MyApp()));
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
        builder: (context , child) {
     return   GetMaterialApp(

            useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),

            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale(
                  'ar', 'SA'), // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            locale: const Locale('ar', 'SA'),
            // OR Locale('ar', 'AE') OR Other RTL locales,
            debugShowCheckedModeBanner: false,
            // theme: getApplicationTheme(),
            home: child,
          );

          },
child: SplashScreen(),

         );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(+
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}
