import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../componant/componant.dart';

class Notifiction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(actions: [

        Icon(
          Icons.notifications,
          size: 30,
          color: ColorManager.primary,
        ),
        SizedBox(width: 35.w,),
      ],),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(itemBuilder:(context, index) {
          return AccountantNotification();
        } ,itemCount: 10,))
    );
  }
}
