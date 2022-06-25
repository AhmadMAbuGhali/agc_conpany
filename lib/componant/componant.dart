// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/customer_model.dart';
import 'package:agc_conpany/model/order.dart';
import 'package:agc_conpany/model/product_model.dart';
import 'package:agc_conpany/model/users.dart';
import 'package:agc_conpany/servisers/firebase_provider.dart';
import 'package:agc_conpany/ui/company_member/accountant/update_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../ui/navigations_bar/accountant_nav_bar.dart';

Widget WidgetTextField(
        {required String hintText,
        required TextInputType inputType,
        required TextEditingController controller,
        Icon? icon,
        Icon? endIcon,
        bool isPassword = false,
        required TextInputAction textInputAction}) =>
    TextFormField(
      style: TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      textInputAction: textInputAction,
      focusNode: FocusNode(),
      // showCursor: true,
      // readOnly: true,
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: icon != null ? icon : null,
        suffixIcon: endIcon != null ? endIcon : null,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black, fontSize: 16),
        labelStyle: TextStyle(color: Colors.black, fontSize: 25),
      ),
    );

Widget AdminJR(UserApp userApp) => Container(
      width: 330.w,
      height: 180.h,
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
                        Text(userApp.name!),
                        Text('رقم الجوال : ' + userApp.phonenumber!),
                        Text('المسمى الوظيفي : ' + userApp.jobtitle!),
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
                Consumer<FireBaseProvider>(builder: (context, provider, x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 69.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () {
                            log('accept');
                            userApp.isaccept = true;
                            provider.acceptedUser(userApp);
                            provider.deleteFromWating(userApp.id.toString());
                          },
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
                          onPressed: () {
                            userApp.isreject = true;
                            provider.rejectedUser(userApp);
                            provider.deleteFromWating(userApp.id.toString());
                          },
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
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );

Widget OrderDetails() => Container(
      height: 70.h,
      margin: EdgeInsets.symmetric(vertical: 18.h),
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

Widget CustomerOrder(
  Order order,
) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180.h,
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.company!,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'الزبون: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        order.customerName!,
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'رقم الهاتف :  ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        order.phone!,
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        ' تاريخ الطلب: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        order.date!,
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  Consumer<FireBaseProvider>(builder: (context, provider, x) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 55.w,
                          height: 20.h,
                          child: ElevatedButton(
                            onPressed: () {
                              log('accept order');
                              order.status = "accept";
                              provider.acceptedOrder(order);
                              provider.deleteFromOrderSalesPerson(
                                  order.id.toString());
                            },
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
                          width: 60.w,
                          height: 20.h,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.deleteFromOrderSalesPerson(
                                  order.id.toString());
                            },
                            child: Text(
                              'رفض',
                              style: getRegularStyle(
                                  color: ColorManager.reject,
                                  fontSize: FontSize.s10.sp),
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
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget SalespersonToAccountant(Order order) => Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
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
                      'الزبون :' + "" + order.customerName!,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Text('المخبز :' + "" + order.company!,
                        style: TextStyle(fontSize: 12.sp)),
                    SizedBox(
                      width: 70.w,
                    ),
                    Text('رقم الهاتف :' + "" + order.phone!,
                        style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Consumer<FireBaseProvider>(builder: (context, provider, x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 129.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () {
                            log('accept order to Accountent');
                            order.status = "acceptToAccountent";
                            provider.acceptedOrdertoAccountent(order);
                            provider
                                .deleteFromOrderAccountant(order.id.toString());
                          },
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
                      Text(order.date!,
                          style: getRegularStyle(
                              color: ColorManager.grayTime,
                              fontSize: FontSize.s13)),
                    ],
                  );
                })
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

Widget SecreraryShowCustomerList(CustomerModel customerModel) => Container(
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
                        Text(customerModel.name),
                        Text('رقم الجوال : ' + customerModel.phoneNumber),
                        Text('المخبز : ' + customerModel.bakeryName),
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

Widget SecretaryJoinReq(CustomerModel customerModel) => Container(
      width: 330.w,
      height: 170.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
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
                        Text(customerModel.name),
                        Text('رقم الجوال : ' + customerModel.phoneNumber),
                        Text('المخبز : ' + customerModel.bakeryName),
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

                Consumer<FireBaseProvider>(builder: (context, provider, x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 69.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () {
                            log('accept');
                            customerModel.isAccept = true;
                            provider.acceptedCustomer(customerModel);
                            provider.deleteFromWatingCustomer(
                                customerModel.id.toString());
                          },
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
                          onPressed: () {
                            customerModel.isReject = true;
                            provider.rejectedCustomer(customerModel);
                            provider.deleteFromWatingCustomer(
                                customerModel.id.toString());
                          },
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
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );

Widget AccountantAddCategory(CategoryModel categoryModel, BuildContext context,
        TextEditingController controller) =>
    GestureDetector(
      onTap: () => {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            title: Center(
                child: Text(
              'عدل اسم الصنف',
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s24),
            )),
            content: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                hintText: 'عدل اسم التصنيف',
              ),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 30.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Provider.of<FireBaseProvider>(context, listen: false)
                              .updateCatogryname(
                                  controller.text, categoryModel.id.toString());
                          Get.back();
                        },
                        child: Text(
                          'اضافة',
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s13),
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
                      width: 100.w,
                      height: 30.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'الغاء',
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s13),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.white,
                            side: BorderSide(
                              width: 1.0,
                              color: ColorManager.black,
                            ),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 15.h),
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
                categoryModel.categoryName!,
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s15),
              ),
              Spacer(),
              IconButton(
                  onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            title: Center(
                                child: Text(
                              'عدل اسم الصنف',
                              style: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s24),
                            )),
                            content: TextFormField(
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: 'عدل اسم التصنيف',
                              ),
                            ),
                            actions: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      height: 30.h,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'اضافة',
                                          style: getRegularStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s13),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: ColorManager.primary,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s5))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      height: 30.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'الغاء',
                                          style: getRegularStyle(
                                              color: ColorManager.black,
                                              fontSize: FontSize.s13),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: ColorManager.white,
                                            side: BorderSide(
                                              width: 1.0,
                                              color: ColorManager.black,
                                            ),
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s5))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      },
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
      height: 180.h,

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
          Container(
            padding: EdgeInsets.only(top: 5.h, right: 3.w),
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
                      'الزبون: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      'احمد سعيد',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
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
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
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
                      'وزن 50 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '50',
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
                    SizedBox(
                      width: 15.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
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
              ],
            ),
          ),
        ],
      ),
    );

Widget AccountantTransferorders(Order order) => Container(
      height: 120.h,
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
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
            padding: EdgeInsets.only(top: 15.h, right: 2.w, left: 5.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الزبون :' + "" + order.customerName!,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text('المخبز :' + "" + order.company!,
                        style: TextStyle(fontSize: 12.sp)),
                    Text('رقم الهاتف :' + "" + order.phone!,
                        style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Consumer<FireBaseProvider>(builder: (context, provider, x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w,
                        height: 25.h,
                        child: ElevatedButton(
                          onPressed: () {
                            log('Accountent Order');
                            order.status = "shipping";
                            provider.OrdertoStoreKeper(order);
                            provider
                                .deleteFromOrderAccountant(order.id.toString());
                          },
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
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 69.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () {
                            provider
                                .deleteFromOrderAccountant(order.id.toString());
                          },
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
                        width: 3.w,
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
                  );
                })
              ],
            ),
          )
        ],
      ),
    );

Widget AccountantProductWidget(ProductModel productModel) => Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(
        vertical: 18.h,
      ),
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
            margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(30.r)),
            child: CircleAvatar(
              radius: 45.0,
              backgroundImage: NetworkImage(productModel.imagePath!),
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  productModel.productName + productModel.wight,
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text(
                      'الكمية المتوفرة في المخزن:',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s10.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      productModel.quantity.toString(),
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
                        onPressed: () => Get.to(() =>
                            UpdateProductScreen(productModel: productModel)),
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
                        onPressed: () => Get.to(() => AccountantNavBar()),
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

Widget AdminMember(UserApp userApp) => Container(
      width: 350.w,
      height: 160.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
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
                        Text(userApp.name!),
                        Text('رقم الجوال : ' + userApp.phonenumber!),
                        Text('المسمى الوظيفي : ' + userApp.jobtitle!),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),

// Accept or reject
                Consumer<FireBaseProvider>(builder: (context, provider, x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 121.w,
                        height: 25.h,
                        child: ElevatedButton(
                          onPressed: () {
// log('accept');
// userApp.isaccept=true;
// provider.acceptedUser(userApp);
// provider.deleteFromWating(userApp.id.toString());
                          },
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
                        width: 127.w,
                        height: 25.h,
                        child: ElevatedButton(
                          onPressed: () {
                            provider.disableUser(userApp.id!);
                          },
                          child: Text(
                            'تعطيل الحساب',
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
                    ],
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );

Widget StoreKeeperToDriver(Order order) => Container(
      width: 330.w,
      height: 130.h,
      margin: EdgeInsets.symmetric(vertical: 20.h),
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
                    Text(
                      'الزبون :' + " " + order.customerName!,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Text('المخبز :' + "" + order.company!,
                        style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('رقم الهاتف :' + "" + order.phone!,
                        style: TextStyle(fontSize: 12.sp)),
                    SizedBox(
                      width: 80.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Consumer<FireBaseProvider>(builder: (context, provider, x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 129.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () {
                            log(' order To Driver');
                            order.status = "shipped";

                            provider.OrdertoDriver(order);

                          },
                          child: Text(
                            'تحويل الى السائق',
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
                  );
                })
              ],
            ),
          )
        ],
      ),
    );

Widget addToStake(
        {required Function() onTap, required ProductModel productModel}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 350.w,
        margin: EdgeInsets.symmetric(vertical: 18.h),
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
              // margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(30.r)),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(productModel.imagePath!),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    productModel.productName,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  SizedBox(
                    width: 240.w,
                    child: Row(
                      children: [
                        Text(
                          productModel.wight,
                          style: getMediumStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s12.sp),
                        ),
                        Text(
                          '',
                          style: getRegularStyle(
                              color: ColorManager.gray,
                              fontSize: FontSize.s14.sp),
                        ),
                        Spacer(),
                        Text(
                          'اضعط هنا لاضافة كمية',
                          style: getMediumStyle(color: ColorManager.textOrange),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget DriverAccetpOrder(BuildContext ctx, Order order) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180.h,
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
              padding: EdgeInsets.only(top: 50.h, right: 2.w),
              decoration: BoxDecoration(),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
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
                        'الزبون: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        order.customerName!,
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
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
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'رقم الهاتف :  ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        order.phone!,
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
                        ' تاريخ الطلب: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        order.date!,
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  Consumer<FireBaseProvider>(builder: (context, provider, x) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 55.w,
                          height: 20.h,
                          child: ElevatedButton(
                            onPressed: () => showDialog(
                              context: ctx,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                title: Center(
                                    child: Text(
                                  'هل استلمت اكمية ؟',
                                  style: getBoldStyle(
                                      color: ColorManager.textOrange,
                                      fontSize: FontSize.s24),
                                )),
                                actions: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 100.w,
                                          height: 30.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              log(' Watting Accept');
                                              order.status = "shipped";
                                              order.isQuantityFull =true;
                                              provider.OrdertoDriver(order);
                                              provider.deleteFromOrderStoreKeeper(
                                                  order.id.toString());
                                            },
                                            child: Text(
                                              'نعم',
                                              style: getRegularStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s13),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: ColorManager.primary,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.s5))),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100.w,
                                          height: 30.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              'لا',
                                              style: getRegularStyle(
                                                  color: ColorManager.black,
                                                  fontSize: FontSize.s13),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: ColorManager.white,
                                                side: BorderSide(
                                                  width: 1.0,
                                                  color: ColorManager.black,
                                                ),
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.s5))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                          width: 60.w,
                          height: 20.h,
                          child: ElevatedButton(
                            onPressed: () => showDialog(
                              context: ctx,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                title: Center(
                                    child: Text(
                                  'هل أنت متأكد من الرفض ؟',
                                  style: getBoldStyle(
                                      color: ColorManager.textOrange,
                                      fontSize: FontSize.s24),
                                )),
                                actions: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 100.w,
                                          height: 30.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              order.isQuantityFull = false;
                                            },
                                            child: Text(
                                              'نعم',
                                              style: getRegularStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s13),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: ColorManager.primary,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.s5))),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100.w,
                                          height: 30.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              'لا',
                                              style: getRegularStyle(
                                                  color: ColorManager.black,
                                                  fontSize: FontSize.s13),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: ColorManager.white,
                                                side: BorderSide(
                                                  width: 1.0,
                                                  color: ColorManager.black,
                                                ),
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.s5))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            child: Text(
                              'رفض',
                              style: getRegularStyle(
                                  color: ColorManager.reject,
                                  fontSize: FontSize.s10.sp),
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
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget DriverToCustomer({required Function() onPress}) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180.h,
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
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 3.w),
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
                      SizedBox(
                        width: 10.w,
                      ),
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
                    ],
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
                        width: 6.w,
                      ),
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
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
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
                        width: 150.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: onPress,
                          child: Text(
                            'تأكيد تسليم الطلبية',
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
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget WidgetTextFieldProudct({
  required String hintText,
  required TextInputType inputType,
  required TextEditingController controller,
  Icon? icon,
  Icon? endIcon,
  bool isPassword = false,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
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
        keyboardType: inputType,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          prefixIcon: icon != null ? icon : null,
          suffixIcon: endIcon != null ? endIcon : null,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16),
          labelStyle: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );

Widget ChooseCategory() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('إختر تصنيف'),
          Icon(Icons.keyboard_arrow_down_sharp),
        ],
      ),
    );
