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
import '../../../resources/values_manager.dart';

class DriverDeleveryOrder extends StatelessWidget {
    DriverDeleveryOrder({Key? key}) : super(key: key);
TextEditingController numberOfOrder=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(
          builder: (context,provider,x){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: [
                Text('تسليم  الطلبات',
                  style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                ),

                ListView.builder(
                  itemBuilder:(context, index) {
                    return DriverToCustomer(
                      order:   provider.orderDriverpinding[index]
                    ,
                        onPress:()=> showDialog(
                      context: context,
                      builder: (ctx) =>  AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        title: Center(child: Text('أدخل رقم الطلبية',style: getBoldStyle(color: ColorManager.textOrange,fontSize: FontSize.s24),)),
                        content:   SizedBox(
                          height: 50,
                          child: TextField(
                            controller: numberOfOrder,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
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
                                    provider.orderDriverpinding[index].orderNumber=numberOfOrder.text;
                                  provider.addToCompleteOrder(provider.orderDriverpinding[index]);
                                  provider.deleteFromOrderDriverpinding(provider.orderDriverpinding[index].id!);
                                  }, child: Text('ارسال',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s13),),style: ElevatedButton.styleFrom(
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
                                  }, child: Text('الغاءا',style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s13),),style: ElevatedButton.styleFrom(
                                      primary: ColorManager.white,
                                      side: BorderSide(width: 1.0, color: ColorManager.black,),elevation: 1, shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(AppSize.s5))
                                  ),),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ));
                  } ,itemCount:provider.orderDriverpinding.length,),

              ],
            ),
          );}
        ),
      ),
    );
  }
}
