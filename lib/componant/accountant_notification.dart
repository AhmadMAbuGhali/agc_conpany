import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../resources/assets_manager.dart';
import '../ui/navigations_bar/nav_bar.dart';

class AccountantNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 330.w,
      height: 111.h,
      margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الزبون :أحمد محمود',
                      style: TextStyle(fontSize: 12.sp),

                    ),
                    Text('المخبز :العائلات', style: TextStyle(fontSize: 12.sp)),
                    Text('رقم الهاتف :8765432',
                        style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'الصنف :شوال زيرو 200',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text('الكمية :250 ', style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 129.w,
                      height: 20.h,
                      child: ElevatedButton(onPressed: () => Get.to(()=>NavScreen()),
                        child: Text('تحويل الى امين المخزن',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s10.sp),)
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
                      width: 69.w,
                      height: 20.h,
                      child: ElevatedButton(onPressed: () => Get.to(()=>NavScreen()),
                        child:Text('رفض',style: getRegularStyle(color: ColorManager.reject,fontSize: FontSize.s14.sp),)
                          ,style: ElevatedButton.styleFrom(
                              primary: ColorManager.white,
                              side: BorderSide(width: 1.0, color: ColorManager.reject,),elevation: 1, shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s5))
                          ),),
                    ),
                    SizedBox(width: 10.w,),
                    // Container(
                    //   height: 24.h,
                    //   width: 122.w,
                    //   child: AccountantNotiTrans(
                    //     label: 'تحويل الي أمين المخزن',
                    //     onTap: () {},
                    //   ),
                    // ),
                    // AccountantButtonReject(
                    //   label: 'رفض',
                    //   onTap: () {},
                    //   color: Colors.transparent,
                    //   width: 69.w,
                    //   height: 24.h,
                    // ),
                    SvgPicture.asset(
                      IconAssets.time,width: 13.w,height: 13.h,
                    ),
                    SizedBox(width: 6.w,),
                    Text('منذ 3 ساعات ', style: getRegularStyle(color: ColorManager.grayTime,fontSize: FontSize.s13)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
