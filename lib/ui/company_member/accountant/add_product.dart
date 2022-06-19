import 'dart:io';

import 'package:agc_conpany/componant/componant.dart';
import 'package:agc_conpany/controller/add_product_controller.dart';
import 'package:agc_conpany/model/product_model.dart';
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/servisers/fb_firestore_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../model/categpry_model.dart';
import '../../../resources/styles_manager.dart';
import '../../../servisers/firebase_provider.dart';

class AddProductScreen extends StatelessWidget {
  static const Map<String, bool> wight = {'50': false, '100': true};
  static const Map<int, String> categoryList = {
    0: 'اختر تصنيف',
    1: 'حيفا',
    2: 'القدس',
    3: 'مندوب مبيعات ',
    4: 'أمين مخازن',
    5: 'سائق',
  };
  static const Map<int, String> wightList = {
    0: 'اختر وزن',
    1: '50 كيلو غرام ',
    2: '100 كيلو غرام ',

  };

  Future<List<CategoryModel>>? category;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final AddProductController controller =
      Get.put(AddProductController(), permanent: true);
  String? dropdownValue = "اختر تصنيف";
  String? dropdownWightValue ='اختر وزن';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Consumer<FireBaseProvider>(builder: (context, provider, x) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 27.h),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                    child: Text(
                      'أضافة منتج',
                      style: getBoldStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 32.0,
                  ),
                )
              ]),
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
                    child: InkWell(
                      onTap: () {
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
                        child:
                            Obx(() => controller.selectedImagePath.value == ''
                                ? Center(
                                    child: Text('اضف صورة المنتج'),
                                  )
                                : Image.file(
                                    File(controller.selectedImagePath.value),
                                    fit: BoxFit.contain,
                                  )),
                      ),
                    ),
                  )),
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                child: DropdownButtonFormField<String>(
                  // margin: EdgeInsets.only(top: 20.h, left: 40.w, right: 40.w),
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  value: dropdownValue,
                  items: AddProductScreen.categoryList
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
                  onChanged: (newValue) {
                    controller.setSelected(newValue!);
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                child: DropdownButtonFormField<String>(
                  // margin: EdgeInsets.only(top: 20.h, left: 40.w, right: 40.w),
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  value: dropdownWightValue,
                  items: AddProductScreen.wightList
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
                  onChanged: (newValue) {
                    controller.setSelected(newValue!);
                  },
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: TextField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration.collapsed(hintText: "وصف المنتج"),
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
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<FireBaseProvider>(context, listen: false)
                          .addProduct(ProductModel(
                              productName: nameController.text,
                              description: descriptionController.text,
                              imagePath: controller.selectedImagePath.value,
                              wight50: controller.checkBox50.value,
                              category: controller.selected.value ,
                              wight100: controller.checkBox100.value));
                      Get.back();
                    },
                    child: Container(
                      width: 253,
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: Text(
                        '  إضافة المنتج',
                        style: getBoldStyle(color: ColorManager.white),
                      )),
                    ),
                  ))
            ],
          ),
        ),
      );
    })));
  }

// Future<void> _save() async {
//   widget._productModel ==
//       await FbFireStoreProduct().createProduct(productModel: productModel);
// }
//
// ProductModel get productModel {
//   ProductModel productModel = ProductModel(
//       wight50: false,
//       wight100: false,
//       imagePath: "",
//       productName: "",
//       description: "",
//       category: '');
//   if (widget._productModel != null) {
//     productModel.id = widget._productModel!.id;
//   }
//   productModel.wight50 = controller.checkBox50.value;
//   productModel.wight100 = controller.checkBox100.value;
//   productModel.quantity = 0;
//   productModel.imagePath = controller.selectedImagePath.value;
//   productModel.category = controller.selected.value;
//   productModel.productName = nameController.text;
//   productModel.description = descriptionController.text;
//
//   return productModel;
// }

}
