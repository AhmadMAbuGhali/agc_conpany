import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class WidgetSearchField extends StatelessWidget {

  TextInputType inputType;
  TextEditingController controller;
  Icon icon;
  Icon? endIcon;
  bool isPassword;

  WidgetSearchField({

    required this.inputType,
    required this.controller,
    required this.icon,
    this.endIcon,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}
