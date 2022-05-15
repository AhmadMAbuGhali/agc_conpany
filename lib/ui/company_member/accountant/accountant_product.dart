
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../componant/componant.dart';



class AccountantProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: const Text('المنتجات'),
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(itemBuilder:(context, index) {

            if(index==9){
              return Column(children: [
                AccountantProductWidget(),
                SizedBox(height: 20.h,)
              ],);
            }
            return AccountantProductWidget();
          } ,itemCount: 10,)),
    );
  }
}
