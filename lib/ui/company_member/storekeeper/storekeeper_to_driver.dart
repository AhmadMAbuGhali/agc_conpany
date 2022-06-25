import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../servisers/firebase_provider.dart';

class StoreKeeperTransferOrderToDriver extends StatelessWidget {
  const StoreKeeperTransferOrderToDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(builder: (index, provider, x) {
      return  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              Text('تحويل الطلبات',
                style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: provider.StoreKeeperOrderAccept.length,
                  itemBuilder:(context, index) {
                    return StoreKeeperToDriver(provider.StoreKeeperOrderAccept[index]);
                  } ,),
              ),

            ],
          ),
        );})
      ),
    );
  }
}
