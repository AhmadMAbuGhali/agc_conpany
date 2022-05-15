import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../componant/componant.dart';



class AccountantCompletedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(actions: [
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 10.w),
            child: Icon(
              Icons.filter_alt,
              size: 30,
              color: ColorManager.primary,
            ),
          ),
        ],),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: ElevatedButton(onPressed: (){},child: Text('الطلبات المكتملة',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s13),),style: ElevatedButton.styleFrom(
            primary: ColorManager.primary,
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12))
            ),),),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:(context, index) {
                    return CompletedOrder();
                  } ,itemCount: 10,),
                ],
              ),
            ))
    );
  }
}
