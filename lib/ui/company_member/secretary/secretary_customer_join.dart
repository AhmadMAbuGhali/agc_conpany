import 'package:agc_conpany/servisers/firebase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class SecretaryCustomerReq extends StatelessWidget {
  const SecretaryCustomerReq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<FireBaseProvider>(
            builder: (context,provider,x){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('طلبات الانضمام' ,
                  style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                ),
                SizedBox(height: 48.h,),
                Expanded(child: ListView.builder(
                    itemCount: provider.watingCustomer.length,
                    itemBuilder: (context,index){
                      return SecretaryJoinReq(provider.watingCustomer[index]);
                    })
                )

              ],
            );}
          ),
        ),
      ),
    );
  }
}
