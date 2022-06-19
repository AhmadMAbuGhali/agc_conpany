
import 'package:agc_conpany/componant/componant.dart';
import 'package:agc_conpany/componant/dropDown.dart';
 import 'package:agc_conpany/model/product_model.dart';
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../resources/styles_manager.dart';
import '../../../servisers/firebase_provider.dart';

class UpdateProductScreen extends StatelessWidget {
   ProductModel productModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  UpdateProductScreen({Key? key,required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    nameController.text=productModel.productName;
    descriptionController.text=productModel.description;
    Provider.of<FireBaseProvider>(context,listen: false).dropdownValue2=productModel.wight;
    Provider.of<FireBaseProvider>(context,listen: false).dropdownValue=productModel.categoryName;
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
                        'تعديل المنتج',
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
                            provider.pickNewImage();
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
                            child: provider.file == null
                                ? Image(image:  NetworkImage(productModel.imagePath!))
                                : Image(image: FileImage(provider.file!)),
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
                  SizedBox(
                    height: 60.h,
                    child: CustomDropdownButton22(
                      buttonWidth: 335.w,
                      buttonHeight: 45.h,
                      dropdownWidth: 330.w,
                      dropdownHeight: 200.h,
                      buttonDecoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(12.r)),
                      valueAlignment: Alignment.centerRight,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                      ),
                      iconSize: 25,
                      hint: 'اختر التصنيف',
                      dropdownItems: provider.allCategoryname,
                      value: provider.dropdownValue,
                      onChanged: (value) {
                        provider.changeDrobDown(value!);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: CustomDropdownButton22(
                      buttonWidth: 335.w,
                      buttonHeight: 45.h,
                      dropdownWidth: 330.w,
                      dropdownHeight: 200.h,
                      buttonDecoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(12.r)),
                      valueAlignment: Alignment.centerRight,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                      ),
                      iconSize: 25,
                      hint: '',
                      dropdownItems: provider.wigthw,
                      value: provider.dropdownValue2,
                      onChanged: (value) {
                        provider.changeDrobDown2(value!);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
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
                          provider.updateProduct(name: nameController.text, disc: descriptionController.text, imagePath: productModel.imagePath!, productId: productModel.id!);
                          provider.file=null;
                          nameController.clear();
                          descriptionController.clear();
                          provider.dropdownValue2=provider.wigthw.first;
                          provider.dropdownValue=provider.allCategoryname.first;
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
                                ' تعديل المنتج  ',
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
