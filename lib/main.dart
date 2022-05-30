import 'package:agc_conpany/controller/a.dart';
import 'package:agc_conpany/ui/company_member/accountant/add_product.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider())
  ], child:   MyApp()));
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
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
         return  GetMaterialApp(

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
            child:  AddProductScreen(),

         );

  }
}
