import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../ui/navigations_bar/accountant_nav_bar.dart';

Widget WidgetTextField({
  required String hintText,
  required TextInputType inputType,
  required TextEditingController controller,
  required Icon icon,
  Icon? endIcon,
  bool isPassword = false,
}) =>
    TextFormField(
      style: TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: icon,
        suffixIcon: endIcon != null ? endIcon : null,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black, fontSize: 16),
        labelStyle: TextStyle(color: Colors.black, fontSize: 25),
      ),
    );

Widget AdminJR() => Container(
      width: 330.w,
      height: 150.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.16),
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15.r), color: ColorManager.white),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 5.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      IconAssets.person,
                      width: 25.w,
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('أحمد أبو غالي '),
                        Text('رقم الجوال : 0595511949'),
                        Text('المسمى الوظيفي : محاسب'),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),

                SizedBox(
                  height: 11.h,
                ),
                // Accept or reject
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 69.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'قبول',
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s10.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 69.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'رفض',
                          style: getRegularStyle(
                              color: ColorManager.reject,
                              fontSize: FontSize.s14.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.white,
                            side: BorderSide(
                              width: 1.0,
                              color: ColorManager.reject,
                            ),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
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
                    Spacer(),
                    SvgPicture.asset(
                      IconAssets.time,
                      width: 13.w,
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('منذ 3 ساعات ',
                        style: getRegularStyle(
                            color: ColorManager.grayTime,
                            fontSize: FontSize.s13)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

Widget OrderDetails() => Container(
      height: 70.h,
      margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(30.r)),
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'دقيق حيفا',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      'وزن 25 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s12.sp),
                    ),
                    Text(
                      '100',
                      style: getRegularStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget CustomerOrder() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5.h, right: 5.w),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'هذا النص هو مثال لنص',
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'وزن 25 كجم: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '100',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'الزبون: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        'احمد سعيد',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'وزن 50 كجم: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '50',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'رقم الهاتف :  ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '5217143',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'الكمية: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '150',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        ': تاريخ الطلب: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '12/12/2021',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 69.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => NavScreen()),
                          child: Text(
                            'قبول',
                            style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s10.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: ColorManager.primary,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s5))),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      SizedBox(
                        width: 69.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => NavScreen()),
                          child: Text(
                            'رفض',
                            style: getRegularStyle(
                                color: ColorManager.reject,
                                fontSize: FontSize.s14.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: ColorManager.white,
                              side: BorderSide(
                                width: 1.0,
                                color: ColorManager.reject,
                              ),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s5))),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      SvgPicture.asset(
                        IconAssets.time,
                        width: 13.w,
                        height: 13.h,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text('منذ 3 ساعات ',
                          style: getRegularStyle(
                              color: ColorManager.grayTime,
                              fontSize: FontSize.s13)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget SalespersonToAccountant() => Container(
      width: 330.w,
      height: 111.h,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.16),
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15.r), color: ColorManager.white),
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
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'تحويل الى المحاسب',
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s10.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SvgPicture.asset(
                      IconAssets.time,
                      width: 13.w,
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('منذ 3 ساعات ',
                        style: getRegularStyle(
                            color: ColorManager.grayTime,
                            fontSize: FontSize.s13)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

Widget WidgetSearchField({
  required TextInputType inputType,
  required TextEditingController controller,
  required Icon icon,
  Icon? endIcon,
  bool isPassword = false,
}) =>
    Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: isPassword,
        maxLines: 1,
        keyboardType: inputType,
        decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          suffixIcon: icon,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),

          hintStyle: TextStyle(color: Colors.black, fontSize: 16),
          labelStyle: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );

Widget SecreraryShowCustomerList() => Container(
      width: 350.w,
      height: 135.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.16),
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15.r), color: ColorManager.white),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 5.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      IconAssets.person,
                      width: 25.w,
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
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

Widget SecretaryJoinReq() => Container(
      width: 330.w,
      height: 150.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.16),
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15.r), color: ColorManager.white),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 5.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      IconAssets.person,
                      width: 25.w,
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
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

                SizedBox(
                  height: 11.h,
                ),
                // Accept or reject
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 69.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'قبول',
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s10.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 69.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'رفض',
                          style: getRegularStyle(
                              color: ColorManager.reject,
                              fontSize: FontSize.s14.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.white,
                            side: BorderSide(
                              width: 1.0,
                              color: ColorManager.reject,
                            ),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
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
                    Spacer(),
                    SvgPicture.asset(
                      IconAssets.time,
                      width: 13.w,
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('منذ 3 ساعات ',
                        style: getRegularStyle(
                            color: ColorManager.grayTime,
                            fontSize: FontSize.s13)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

Widget AccountantAddCategory({
  required String label,
  required Function() onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: double.infinity,
          height: 41.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: ColorManager.white,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.black.withOpacity(0.16),
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(
                color: Colors.white60,
                width: 1,
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s15),
              ),
              Spacer(),
              IconButton(
                  onPressed: onTap,
                  icon: Icon(Icons.edit, size: 17, color: ColorManager.gray)),
              Text(
                "تعديل",
                style: getMediumStyle(
                    color: ColorManager.gray, fontSize: FontSize.s15),
              )
            ],
          )),
    );

Widget CompletedOrder() => Container(
      height: 135.h,

      // margin: EdgeInsets.symmetric(vertical: 18.h,horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
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
            padding: EdgeInsets.only(top: 5.h, right: 5.w),
            decoration: BoxDecoration(),
            child: const CircleAvatar(
              radius: 38.0,
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
              backgroundColor: Colors.transparent,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'هذا النص هو مثال لنص',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      'وزن 25 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '100',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'الزبون: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      'احمد سعيد',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      'وزن 50 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '50',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'رقم الهاتف :  ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '5217143',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      'الكمية: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '150',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      ': تاريخ الطلب: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '12/12/2021',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      'رقم الطلبية: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '400',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget AccountantNotification() => Container(
      width: 330.w,
      height: 111.h,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.16),
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15.r), color: ColorManager.white),
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
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'تحويل الى امين المخزن',
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s10.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 69.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'رفض',
                          style: getRegularStyle(
                              color: ColorManager.reject,
                              fontSize: FontSize.s14.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.white,
                            side: BorderSide(
                              width: 1.0,
                              color: ColorManager.reject,
                            ),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset(
                      IconAssets.time,
                      width: 13.w,
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('منذ 3 ساعات ',
                        style: getRegularStyle(
                            color: ColorManager.grayTime,
                            fontSize: FontSize.s13)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

Widget AccountantProductWidget() => Container(
      height: 130.h,
      margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
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
            margin: EdgeInsets.only(top: 15.h, right: 15.w),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(30.r)),
            child: const CircleAvatar(
              radius: 45.0,
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
              backgroundColor: Colors.transparent,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'دقيق حيفا',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      'الكمية المتوفرة في المخزن',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s10.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'وزن 25 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s12.sp),
                    ),
                    Text(
                      '100',
                      style: getRegularStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'الكمية المتوفرة في المخزن',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s10.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'وزن 50 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s12.sp),
                    ),
                    Text(
                      '50',
                      style: getRegularStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'تعديل',
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s10.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 70.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'حذف',
                          style: getRegularStyle(
                              color: ColorManager.reject,
                              fontSize: FontSize.s14.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.white,
                            side: BorderSide(
                              width: 1.0,
                              color: ColorManager.reject,
                            ),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget AdminMember() => Container(
      width: 350.w,
      height: 135.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.16),
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15.r), color: ColorManager.white),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 5.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      IconAssets.person,
                      width: 25.w,
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('أحمد أبو غالي '),
                        Text('رقم الجوال : 0595511949'),
                        Text('المسمى الوظيفي : محاسب'),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),

                // Accept or reject
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 121.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'تغيير كلمة المرور ',
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s10.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 117.w,
                      height: 20.h,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => NavScreen()),
                        child: Text(
                          'تعطيل الحساب ',
                          style: getRegularStyle(
                              color: ColorManager.reject,
                              fontSize: FontSize.s14.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.white,
                            side: BorderSide(
                              width: 1.0,
                              color: ColorManager.reject,
                            ),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
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
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
