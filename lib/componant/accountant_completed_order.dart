import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_manager.dart';
import '../resources/styles_manager.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:130.h ,
      margin: EdgeInsets.symmetric(vertical: 18.h,horizontal: 20.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
        color: ColorManager.white
        ,  boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   height: 100.h,
          //   width: 100.w,
          //   decoration: BoxDecoration(
          //       color: ColorManager.parent,
          //       borderRadius: BorderRadius.circular(70.r),
          //       // image: const DecorationImage(image: AssetImage(ImageAssets.productTest),fit: BoxFit.cover)
          //   ),
          //     child: ClipOval(
          //       child: Image.asset(ImageAssets.productTest,fit: BoxFit.contain,alignment: Alignment.topCenter,
          //       ),
          //     ),
          // ),
        Container(
            padding:   EdgeInsets.only(top: 5.h,right: 5.w),
            decoration: BoxDecoration(

            ),
            child: const CircleAvatar(
              radius: 38.0,
              backgroundImage:
              NetworkImage('https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
              backgroundColor: Colors.transparent,
            ),
          ),

          Padding(
            padding:   EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('هذا النص هو مثال لنص',style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),),
                SizedBox(height: 6.h,)
                ,Row(
                  children: [
                    Text('وزن 25 كجم: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    Text('100'  ,style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                    SizedBox(width: 15.w,),
                    Text('الزبون: ',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    Text('احمد سعيد',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                  ],
                ), SizedBox(height: 4.h,),

Row(
                  children: [
                    Text('وزن 50 كجم: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    Text('50'  ,style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                    SizedBox(width: 15.w,),
                    Text('رقم الهاتف :  ',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    Text('5217143',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                  ],
                ),SizedBox(height: 4.h,),

Row(
                  children: [
                    Text('الكمية: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    Text('150'  ,style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                    SizedBox(width: 15.w,),
                    Text(': تاريخ الطلب: ',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    Text('12/12/2021',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                  ],
                ),SizedBox(height: 4.h,),
                 Row(
                  children: [
                    Text('رقم الطلبية: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    Text('400'  ,style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                  ],
                ),



              ],
            ),
          ),
        ],),
    );
  }
}
