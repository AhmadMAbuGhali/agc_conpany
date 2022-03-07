import 'package:agc_conpany/componant/input_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        children: [
            Container(
              height: 353.3.h,
              width: 416.w,
              child: Stack(

                children: [
                  Positioned(
                    right: -25,
                    height: 353.h,
                    width: 416.w,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/dark.png'),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 64.h, left: 40.w, right: 40.w),
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
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 38.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'كلمة المرور',
                inputType: TextInputType.visiblePassword,
                controller: passController,
                icon: Icon(Icons.lock, color: Colors.black),
                isPassword: true,
              ),
            ),
        ],
      ),
          )),
    );
  }
}
