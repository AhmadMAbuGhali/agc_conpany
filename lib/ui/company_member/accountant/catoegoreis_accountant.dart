import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:agc_conpany/servisers/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';
import '../../../servisers/fb_firestore_category.dart';

class AccountantCategoeies extends StatefulWidget {
  @override
  State<AccountantCategoeies> createState() => _AccountantCategoeiesState();
  CategoryModel? _categoryModel;
}

class _AccountantCategoeiesState extends State<AccountantCategoeies> {
  TextEditingController categoryNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Stream categoryStream = FirebaseFirestore.instance.collection('Category').snapshots();
    categoryNameController = TextEditingController();


    // _tapGestureRecognizer.onTap = _navigateToRegister;
  }

  @override
  void dispose() {
    categoryNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Consumer<FireBaseProvider>(
            builder: (context, provider, x) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Text(
                      'الأصناف',
                      style: getBoldStyle(color: ColorManager.primary),
                    ),
                    Expanded(child: ListView.builder(
                      itemCount: provider.allCategory.length,
                        itemBuilder:(context,index){
                        return AccountantAddCategory(provider.allCategory[index],context);
                        }
                    )
                    )

                  ],
                ),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: new Icon(
              Icons.add,
              size: 40,
            ),
            backgroundColor: ColorManager.button,
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) =>
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      title: Center(
                          child: Text(
                            'اضف اسم الصنف',
                            style: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s24),
                          )),
                      content: TextField(
                        controller: categoryNameController,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
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
                                child: ElevatedButton(
                                  onPressed: () {
                                    _save();
                                    Get.back();
                                  },
                                  child: Text(
                                    'اضافة',
                                    style: getRegularStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s13),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: ColorManager.primary,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(AppSize.s5))),
                                ),
                              ),
                              SizedBox(
                                width: 100.w,
                                height: 30.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'الغاء',
                                    style: getRegularStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s13),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: ColorManager.white,
                                      side: BorderSide(
                                        width: 1.0,
                                        color: ColorManager.black,
                                      ),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(AppSize.s5))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              );
            }),
        // u
      ),
    );
  }

  Future<void> _save() async {
    widget._categoryModel ==
        await FbFireStoreCategory()
            .createCategory(categoryModel: categoryModel);
  }

  CategoryModel get categoryModel {
    CategoryModel categoryModel = CategoryModel(categoryName: "");
    if (widget._categoryModel != null) {
      categoryModel.id = widget._categoryModel!.id;
    }
    categoryModel.categoryName = categoryNameController.text;

    return categoryModel;
  }
}
