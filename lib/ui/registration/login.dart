import 'package:agc_conpany/componant/input_feild.dart';
import 'package:agc_conpany/ui/nav_bar.dart';
import 'package:agc_conpany/ui/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../componant/primarybutton.dart';

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
                  const Positioned(
                    top: 40,
                    right: 150,
                    left: 0,
                    child: const Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                    top: 90,
                    right: 170,
                    left: 0,
                    child: const Text(
                      'مرحباً ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                    top: 150,
                    right: 120,
                    left: 0,
                    child: const Text(
                      'سجل الدخول للمتابعة ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
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
                icon: const Icon(Icons.lock, color: Colors.black),
                isPassword: true,
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'هل نسيت كلمة المرور ؟',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  )),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: PrimaryButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavScreen()),
                  );
                },
                label: 'تسجيل الدخول ',
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 115),
              child: Row(
                children: [
                  Text(
                    ' ليس لديك حساب؟  ',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SingUP()),
                        );
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
