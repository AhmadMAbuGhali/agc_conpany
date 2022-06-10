
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../componant/componant.dart';

class AccountantCategoeies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.white,

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('الأصناف',style: getBoldStyle(color: ColorManager.primary),),
                AccountantAddCategory(label: "دقيق حيفا", onTap: (){
    showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.r),
    ),
    title: Center(child: Text('اضف اسم الصنف',style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s24),)),
    content: TextFormField(
    decoration: new InputDecoration(
    border: new OutlineInputBorder(
    borderSide: new BorderSide(color: Colors.teal)
    ),
    hintText: 'عدل اسم التصنيف',
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
    child: ElevatedButton(onPressed: (){}, child: Text('اضافة',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s13),),style: ElevatedButton.styleFrom(
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
    ),
    ); }),
              ],
            ),
          ),
        floatingActionButton:FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add,size: 40,),
            backgroundColor: ColorManager.button,
            onPressed: (){
                showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  title: Center(child: Text('اضف اسم الصنف',style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s24),)),
                  content: TextFormField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
                      ),
                      hintText: 'ادخل اسم التصنيف',
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
                            child: ElevatedButton(onPressed: (){}, child: Text('اضافة',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s13),),style: ElevatedButton.styleFrom(
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
                ),
              );
            }
        ) ,
      ),
    );
  }
}
