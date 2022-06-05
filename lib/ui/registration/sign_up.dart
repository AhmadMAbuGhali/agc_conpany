import 'package:agc_conpany/servisers/auth_provider.dart';
import 'package:agc_conpany/ui/navigations_bar/accountant_nav_bar.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../componant/componant.dart';


class SingUP extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // Initial Selected Value
  String? dropdownValue = "محاسب";
  String? name;
  String? email;
  String? password;
  int? phoneNumber;
  String? listItem;

  static const Map<int,String> companyMemberList = {
    1 : 'محاسب',
    2 : 'سكرتير',
    3 :'مندوب مبيعات ',
    4 :'أمين مخازن',
    5 :'سائق'
  };


  // List of items in our dropdown menu
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context,provider,x){
        return SafeArea(
            child: Form(
              key: _signUpFormKey,
              child: SingleChildScrollView(

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
                            child:  Text(
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
                            child: Text(
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
                            child: Text(
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
                    Padding(
                      padding:EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
                      child: WidgetTextField(
                        hintText: 'الأسم ',
                        inputType: TextInputType.text,
                        controller: nameController,
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        textInputAction: TextInputAction.next
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
                      child: WidgetTextField(
                        hintText: 'البريد الالكتروني ',
                        inputType: TextInputType.emailAddress,
                        controller: emailController,
                        icon: const Icon(
                          Icons.alternate_email,
                          color: Colors.black,
                        ),
                          textInputAction: TextInputAction.next
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),child: WidgetTextField(
                        hintText: 'كلمة المرور',
                        inputType: TextInputType.visiblePassword,
                        controller: passController,
                        icon: const Icon(Icons.lock, color: Colors.black),
                        isPassword: true,
                          textInputAction: TextInputAction.next
                      ),

                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w), child: WidgetTextField(
                        hintText: 'الهاتف',
                        inputType: TextInputType.phone,
                        controller: phoneController,
                        icon: const Icon(Icons.phone, color: Colors.black),
                        isPassword: true,
                          textInputAction: TextInputAction.done
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w), child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.work,
                            color: Colors.black,
                          ),
                        ),
                        value: dropdownValue,
                        items: companyMemberList.map((int num,String value) {
                          return MapEntry(num,
                              DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ));

                        }).values.toList(),
                        onChanged: (vlaue) {
                          dropdownValue = vlaue!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: ElevatedButton(onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        _signUpFormKey.currentState!.save();
                        provider.register(context, nameController.text, emailController.text, passController.text, String, dropdownValue, phoneController.text);
                      }
                      },
                          child:Text('تسجيل'),)
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
                             Get.off(Login());
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
              ),
            ));}
      ),
    );
  }
}
