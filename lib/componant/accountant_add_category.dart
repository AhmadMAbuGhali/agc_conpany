import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AccountantAddCategory extends StatelessWidget {
  const AccountantAddCategory({
    Key? key,
    required this.label,
    required this.onTap,

  }) : super(key: key);

  final String label;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        height: 41.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: ColorManager.white,
            boxShadow:  [
        BoxShadow(
        color: ColorManager.black.withOpacity(0.16),
         blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      ),
      ],
            border: Border.all(
              color: Colors.white60,
              width: 1,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label,style:  getBoldStyle(color: ColorManager.black,fontSize: FontSize.s15) ,),
          Spacer(),
          IconButton(onPressed: onTap, icon: Icon(Icons.edit,size: 17,color: ColorManager.gray)),
          Text("تعديل" , style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s15),)
          ],

        )
      ),
    );
  }
}
