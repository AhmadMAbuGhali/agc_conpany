

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class StoreKeeperAddToStake extends StatelessWidget {
  const StoreKeeperAddToStake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text('تفاصيل الطلبية ',
                    style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                  ),



                  SizedBox(height: 48.h,),
                  SizedBox(
                    width: 350.w,
                    height: 80.h,
                    child: ListView.builder(

                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder:(context, index) {

                        return addToStake();
                      } ,itemCount: 10,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
