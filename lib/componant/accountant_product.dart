import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/ui/navigations_bar/accountant_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
class AccountantProductWidget extends StatelessWidget {
  const AccountantProductWidget({Key? key}) : super(key: key);

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
            margin:   EdgeInsets.only(top: 15.h,right: 15.w),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(30.r)
            ),
            child: const CircleAvatar(
              radius: 45.0,
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
                SizedBox(height: 6.h,),
                Text('دقيق حيفا',style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),),
                SizedBox(height: 6.h,)
                ,Row(
                  children: [
                    Text('الكمية المتوفرة في المخزن',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s10.sp),),
                    SizedBox(width: 15.w,),
                    Text('وزن 25 كجم: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s12.sp),),
                    Text('100'  ,style: getRegularStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),

                  ],
                ), SizedBox(height: 10.h,),
                Row(
                  children: [
                    Text('الكمية المتوفرة في المخزن',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s10.sp),),
                    SizedBox(width: 15.w,),
                    Text('وزن 50 كجم: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s12.sp),),
                    Text('50'  ,style: getRegularStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),

                  ],
                )
                ,SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70.w,
                      height: 20.h,
                      child: ElevatedButton(onPressed: () => Get.to(()=>NavScreen()),
                        child: Text('تعديل',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s10.sp),)
                        ,style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSize.s5))
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,)
                    , SizedBox(
                      width: 70.w,
                      height: 20.h,
                      child: ElevatedButton(onPressed: () => Get.to(()=>NavScreen()),
                        child:Text('حذف',style: getRegularStyle(color: ColorManager.reject,fontSize: FontSize.s14.sp),)
                        ,style: ElevatedButton.styleFrom(
                            primary: ColorManager.white,
                            side: BorderSide(width: 1.0, color: ColorManager.reject,),elevation: 1, shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s5))
                        ),),
                    ),
                  ],
                ),



              ],
            ),
          ),
        ],),
    );
  }
}
