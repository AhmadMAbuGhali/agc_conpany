import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';
import '../../../servisers/firebase_provider.dart';



class AccountantCompletedOrders extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(
          builder: (context, provider, x) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("الطلبات المكتملة  ",
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s22),
                  ),
                  Expanded(child: ListView.builder(itemBuilder:(context,index){
                    return CompletedOrder(provider.completedOrder[index]);
                  }, itemCount: provider.completedOrder.length,)),


                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
