import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class DriverCustomerOrder extends StatelessWidget {
  DriverCustomerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'طلبات الزبائن',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s22),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return DriverAccetpOrder(
                        onAccept: () => showDialog(
                          context: context,
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
                                        onPressed: () {},
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
                        onReject: () => showDialog(
                          context: context,
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
                                        onPressed: () {},
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
                      );
                    },
                    itemCount: 10,
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
