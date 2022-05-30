import 'package:agc_conpany/componant/componant.dart';
import 'package:agc_conpany/controller/a.dart';
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatelessWidget {
    TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('اضافة منتج'),),
      body: Consumer<AuthProvider>(
        builder: (context,provider,x){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
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
                onTap: (){
                  provider.pickNewImage();
                },
                child: Container(
                  height: 195.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(17.r),
                      color: ColorManager.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.16),
                        ),
                      ],
                  ),
                  child: provider.file==null? Center(child: Text('اضف صورة المنتج'),):Image(image: FileImage(provider.file!)),
                ),
              ),
            ),
          ),
              SizedBox(height: 25.h,),
              WidgetTextField(controller: nameController,hintText: 'اسم المنتج',inputType:TextInputType.text ),
              SizedBox(height: 25.h,),
              WidgetTextField(controller: nameController,hintText: 'اختر التصنيف',inputType:TextInputType.text ),
            ],
          ),
        );}
      ),
    );
  }
}
