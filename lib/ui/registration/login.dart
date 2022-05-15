
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/ui/admin/admin_home.dart';
import 'package:agc_conpany/ui/navigations_bar/salesperson_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/secretary_nav_bar.dart';
import 'package:agc_conpany/ui/navigations_bar/accountant_nav_bar.dart';
import 'package:agc_conpany/ui/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../componant/componant.dart';
import '../../resources/color_manager.dart';
import '../admin/admin_nav_bar.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 353.3.h,
              width: 416.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    height: 353.h,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/loginui.jpeg'),
                      )),
                    ),
                  ),
                      Positioned(
                    top: 40,
                    right: 150,
                    left: 0,
                    child: Text(
                      'تسجيل الدخول ',
                      style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s18),
                    ),
                  ),
                    Positioned(
                    top: 90,
                    right: 170,
                    left: 0,
                    child:   Text(
                      'مرحباً ',
                      style:  getRegularStyle(color: ColorManager.white,fontSize: FontSize.s30),
                    ),
                  ),
                    Positioned(
                    top: 150,
                    right: 120,
                    left: 0,
                    child:   Text(
                      'سجل الدخول للمتابعة ',
                      style:  getMediumStyle(color: ColorManager.white,fontSize: FontSize.s20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 325.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 64.h, left: 25.w, right: 25.w),
              child: WidgetTextField(
                hintText: 'البريد الالكتروني ',
                inputType: TextInputType.emailAddress,
                controller: emailController,
                icon: const Icon(
                  Icons.alternate_email,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: 325.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 38.h, left: 25.w, right: 25.w),
              child: WidgetTextField(
                hintText: 'كلمة المرور',
                inputType: TextInputType.visiblePassword,
                controller: passController,
                icon: const Icon(Icons.lock, color: Colors.black),
                isPassword: true,
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding:   EdgeInsets.only(right: 20.w),
              child: TextButton(
                  onPressed: () {},
                  child:   Text(
                    'هل نسيت كلمة المرور ؟',
                    textAlign: TextAlign.right,
                    style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                  )),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 60.w),
              child: SizedBox(
                width: 253.w,
                height: 50.h,
                child: ElevatedButton(onPressed: () => Get.to(()=>SalespersonNavBar()),
                  child:const Text('تسجيل الدخول'),),
              )
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 115),
              child: Row(
                children: [
                  Text(
                    ' ليس لديك حساب؟',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                      Get.to(SingUP());
                      },
                      child: const Text(
                        'تسجيل',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
