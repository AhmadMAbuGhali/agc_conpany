import 'package:agc_conpany/servisers/firebase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class StoreKeeperCustomerOrder extends StatelessWidget {
  const StoreKeeperCustomerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
          Consumer<FireBaseProvider>(
            builder: (context,provider,x){
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'طلبات الزبائن',
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s22),
                    ),
                    ListView.builder(

                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: ()=> Get.to(OrderDetails()),
                            child:  CustomerOrderStoreKeeper(provider.orderStoreKeeper[index])
                        );},
                      itemCount: provider.orderStoreKeeper.length,
                    ),
                  ],
                ),
              );}
          ),


      ),
    );
  }
}
