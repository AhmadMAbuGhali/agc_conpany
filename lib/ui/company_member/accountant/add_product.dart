import 'dart:io';

import 'package:agc_conpany/componant/componant.dart';
import 'package:agc_conpany/controller/add_product_controller.dart';
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../resources/styles_manager.dart';

class AddProductScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  String? dropdownValue = "اختر تصنيف";
  static const Map<String, bool> wight = {'50': false, '100': true};
  static const Map<int, String> categoryList = {
    0: 'اختر تصنيف',
    1: 'حيفا',
    2: 'القدس',
    3: 'مندوب مبيعات ',
    4: 'أمين مخازن',
    5: 'سائق',
  };


    @override
    Widget build(BuildContext context) {
      final AddProductController controller = Get.put(AddProductController());
      return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 27.h),
                child: Column(
                  children: [
                    Text(
                      'أضافة منتج',
                      style: getBoldStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(17.r),
                        dashPattern: const <double>[8, 4],
                        color: ColorManager.black,
                        strokeCap: StrokeCap.butt,
                        strokeWidth: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          child:InkWell(
                            onTap: (){
                              controller.getImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: 195.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.r),
                                color: ColorManager.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(0.16),
                                  ),
                                ],
                              ),
                              child:Obx(
                                      ()=> controller.selectedImagePath.value == ''?
                                  Center(
                                    child: Text('اضف صورة المنتج'),
                                  )
                                      : Image.file(File(controller.selectedImagePath.value),
                                    fit: BoxFit.contain,)

                              ),
                            ) ,
                          ),
                        )
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    WidgetTextFieldProudct(
                        controller: nameController,
                        hintText: 'اسم المنتج',
                        inputType: TextInputType.text),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: ColorManager.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 60.h,
                      padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      child: DropdownButtonFormField<String>(
                        // margin: EdgeInsets.only(top: 20.h, left: 40.w, right: 40.w),
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        value: dropdownValue,
                        items: categoryList
                            .map((int num, String value) {
                          return MapEntry(
                              num,
                              DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ));
                        })
                            .values
                            .toList(),
                        onChanged: (vlaue) {
                          dropdownValue = vlaue!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.r),
                        color: ColorManager.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      width: double.infinity,
                      child: Obx(
                            () => Column(
                          children: [
                            Text("الاوزان المتاحة"),
                            CheckboxListTile(
                              title: Text("50 كيلو"),
                              value: controller.checkBox50.value,
                              onChanged: (value) {
                                controller.checkBox50.value =
                                !controller.checkBox50.value;
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            CheckboxListTile(
                              title: Text("100 كيلو"),
                              value: controller.checkBox100.value,
                              onChanged: (value) {
                                controller.checkBox100.value =
                                !controller.checkBox100.value;
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.r),
                        color: ColorManager.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      child: TextField(
                        maxLines: 4,
                        decoration:
                        InputDecoration.collapsed(hintText: "وصف المنتج"),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.r),
                        color: ColorManager.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorManager.primary,
                          elevation: 0.0,
                        ),

                        onPressed: () {},
                        child: Text('إضافة المنتج'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    }
  }
