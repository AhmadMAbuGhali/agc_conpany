import 'package:agc_conpany/componant/input_feild.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../componant/primarybutton.dart';

class SingUP extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Accountant';

  // List of items in our dropdown menu
  var items = [
    'Accountant',
    'secretary',
    'Storekeeper',
    'Driver',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 334.h,
              width: 416.w,
              child: Stack(
                children: [
                  Positioned(
                    top: -19,
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
                    top: 21,
                    right: 120,
                    left: 0,
                    child: const Text(
                      'تسجيل حساب جديد ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                    top: 71,
                    right: 165,
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
                    top: 131,
                    right: 120,
                    left: 0,
                    child: const Text(
                      'أنشئ حسابك للمتابعة ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 40.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'الأسم ',
                inputType: TextInputType.text,
                controller: nameController,
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
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
              margin: EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'كلمة المرور',
                inputType: TextInputType.visiblePassword,
                controller: passController,
                icon: const Icon(Icons.lock, color: Colors.black),
                isPassword: true,
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'الهاتف',
                inputType: TextInputType.phone,
                controller: phoneController,
                icon: const Icon(Icons.phone, color: Colors.black),
                isPassword: true,
              ),
            ),
            Container(
              width: 295.w,
              height: 45.h,
              margin: EdgeInsets.only(top: 20.h, left: 40.w, right: 40.w),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.work,
                    color: Colors.black,
                  ),
                ),
                value: dropdownvalue,
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (vlaue) {
                  dropdownvalue = vlaue!;
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            PrimaryButton(
              onTap: () {},
              label: 'تسجيل',
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'لديك حساب مسبقا؟  ',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: const Text(
                      ' تسجيل الدخول ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
