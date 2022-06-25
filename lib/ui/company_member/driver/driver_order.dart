import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../servisers/firebase_provider.dart';

class DriverCustomerOrder extends StatelessWidget {
  DriverCustomerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.white,

        body: Consumer<FireBaseProvider>(builder: (index, provider, x) {
      return  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('طلبات الزبائن',style: getBoldStyle(color: ColorManager.primary),),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.orderDriver.length,
                    itemBuilder: (context,index) {
                      return DriverAccetpOrder(provider.orderDriver[index]);
                    },

                  ),
                ),



              ],
            ),
          );})
      ),
    );



  }
}
