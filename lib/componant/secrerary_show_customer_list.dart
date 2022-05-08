import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../resources/assets_manager.dart';
import '../ui/navigations_bar/nav_bar.dart';

class SecreraryShowCustomerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 350.w,
      height: 135.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.black.withOpacity(0.16),
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15.r), color: ColorManager.white),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 5.w),
            child: Column(
              children: [
               Row(
                 children: [
                   SvgPicture.asset(
                     IconAssets.person,width: 25.w,height: 25.h,
                   ),
                   SizedBox(width: 10.w,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('أحمد أبو غالي '),
                       Text('رقم الجوال : 0595511949'),
                       Text('المخبز : العائلات'),
                     ],
                   )
                 ],
               ),
                SizedBox(
                  height: 11.h,
                ),


                // Accept or reject
               
              ],
            ),
          )
        ],
      ),
    );
  }
}
