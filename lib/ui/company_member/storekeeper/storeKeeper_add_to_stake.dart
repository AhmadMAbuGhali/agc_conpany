

import 'package:agc_conpany/servisers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class StoreKeeperAddToStake extends StatelessWidget {
    StoreKeeperAddToStake({Key? key}) : super(key: key);
TextEditingController controllerQuntity =TextEditingController();
int quntity=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(
          builder: (context,provider,x){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text('المخزن ',
                  style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                ),

                SizedBox(height: 48.h,),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.allProduct.length,
                    itemBuilder:(context, index) {
                      return addToStake(onTap: ()=> showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        title: Center(child: Text('اضف كمية دقيق حيفا',style: getBoldStyle(color: ColorManager.textOrange,fontSize: FontSize.s24),)),
                        content:  SizedBox(
                          height: 50,
                          child: TextField(
                            controller:controllerQuntity ,
                            decoration:const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'ادخل الكمية الموجودة ',
                            ),

                          ),
                        ),
                        actions: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  height: 30.h,
                                  child: ElevatedButton(onPressed: (){
                                    quntity=int.parse(controllerQuntity.text)+provider.allProduct[index].quantity;

                                    provider.updateProductQuntity(quantity: quntity.toString(), productId: provider.allProduct[index].id!);
                                    controllerQuntity.clear();
                                    Get.back();
                                  }, child: Text('اضافة',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s13),),style: ElevatedButton.styleFrom(
                                      primary: ColorManager.primary,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(AppSize.s5))
                                  ),),
                                ),   SizedBox(
                                  width: 100.w,
                                  height: 30.h,
                                  child: ElevatedButton(onPressed: (){
                                    Get.back();
                                  }, child: Text('الغاء',style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s13),),style: ElevatedButton.styleFrom(
                                      primary: ColorManager.white,
                                      side: BorderSide(width: 1.0, color: ColorManager.black,),elevation: 1, shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(AppSize.s5))
                                  ),),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),),productModel: provider.allProduct[index]);
                    } ,

                  ),
                ),
              ],
            ),
          );}
        ),
      ),
    );
  }
}
