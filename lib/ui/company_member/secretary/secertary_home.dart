import 'dart:math' as math;


import 'package:agc_conpany/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../servisers/auth_provider.dart';
import '../../registration/login.dart';



class SecretaryHome extends StatelessWidget {

  List<String> MONTHS = [
    "يناير",
    "فبراير",
    "مارس",
    "أبريل",
    "مايو",
    "يونيو",
    "يوليو",
    "أغسطس",
    "سبتمبر",
    "أكتوبر",
    "نوفمبر",
    "ديسمبر"
  ];
  List<String> day = [
    'الأثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];
  ScrollController rrectController = ScrollController();
  DateTime now = new DateTime.now();
  String formattedDateTime() {
    return now.day.toString() + " " + MONTHS[now.month - 1];
  }

  String formattedDay() {
    return day[now.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180.h,
              decoration: const BoxDecoration(
                  color: Color(0xFF182B4C),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Stack(
                children: [
                  Positioned(
                      top: 30,
                      right: 16,
                      left: 0,
                      child: Row(
                        children: [
                          Text(
                            'أهلاً بك ' +AppConstants.loggedUser!.name!,
                            style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s30),
                          ),
                          const Spacer(),

                        ],
                      )),
                  Positioned(
                      top: 75,
                      right: 16,
                      left: 0,
                      child: Text(
                        formattedDateTime(),
                        style: getMediumStyle(color: ColorManager.textOrange,fontSize: FontSize.s20),
                      )),
                  Positioned(
                      top: 92,
                      right: 16,
                      left: 0,
                      child: Row(
                        children: [
                          Text(
                              formattedDay(),
                              style:getMediumStyle(color: ColorManager.white,fontSize: FontSize.s15)
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                Provider.of<AuthProvider>(context,listen: false).logOut();
                                Get.off(Login());
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                        'تسجيل الخروج',
                                        style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s13)),

                                    Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.logout,
                                            size: 27,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h, right: 16.w),
              child: Text(
                ' الاشعارات',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [

                ],

              ),
            ),

          ],
        ),
      ),
    );
  }
}
