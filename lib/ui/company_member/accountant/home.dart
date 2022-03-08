import 'dart:math' as math;
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAccountant extends StatelessWidget {
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
              height: 133.h,
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
                            'أهلاً بك أحمد',
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications,
                                size: 27,
                                color: Colors.white,
                              ))
                        ],
                      )),
                  Positioned(
                      top: 75,
                      right: 16,
                      left: 0,
                      child: Text(
                        formattedDateTime(),
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      )),
                  Positioned(
                      top: 92,
                      right: 16,
                      left: 0,
                      child: Row(
                        children: [
                          Text(
                            formattedDay(),
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    const Text(
                                      'تسجيل الخروج',
                                      style: TextStyle(color: Colors.white),
                                    ),
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
                'اخر الاشعارات',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
