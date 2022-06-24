import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';
import '../../../resources/styles_manager.dart';
import '../../../servisers/firebase_provider.dart';

class Transferorders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Consumer<FireBaseProvider>(builder: (index, provider, x) {
      return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  'تحويل الطلبات',
                  style: getBoldStyle(color: ColorManager.primary),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:  provider.orderAccountent.length,
                    itemBuilder: (context, index) {
                      return AccountantTransferorders(provider.orderAccountent[index]);
                    },
                  ),
                ),

              ],
            )),
          ]),
        );})
      ),
    );
  }
}
