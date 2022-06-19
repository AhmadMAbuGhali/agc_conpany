
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:agc_conpany/servisers/firebase_provider.dart';
import 'package:agc_conpany/ui/company_member/accountant/add_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';



class AccountantProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<FireBaseProvider>(
            builder: (context,provider,x) {

            return Column(
              children: [
                Text('المنتجات',style: getBoldStyle(color: ColorManager.primary),),
                Expanded(child: ListView.builder(
                  itemCount: provider.allProduct.length,
                    itemBuilder: (context,index){
                      return AccountantProductWidget(provider.allProduct[index]);
                    },
                     )),

                GestureDetector(
                 onTap: ()=>Get.to(AddProductScreen()),
                  child: Container(
                    width:253 ,
                    height: 45,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child:Center(child: Text('  إضافة منتج جديد',style: getBoldStyle(color: ColorManager.white),)) ,
                  ),
                )

              ],
            );}
          ),
        )
      ),
    );
  }
}
