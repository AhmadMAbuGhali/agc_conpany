import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../componant/componant.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
class AdminCompanyMember extends StatelessWidget {
  const AdminCompanyMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("الأعضاء",
                    style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                  ),
                SizedBox(height: 48.h,),
                  AdminMember(),
                  SizedBox(height: 48.h,),
                  AdminMember(),
                  SizedBox(height: 48.h,),
                  AdminMember(),
                  SizedBox(height: 48.h,),
                  AdminMember(),
                  SizedBox(height: 48.h,),
                  AdminMember(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
