
import 'package:agc_conpany/servisers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../componant/componant.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
class AdminMemberJoin extends StatelessWidget {
  const AdminMemberJoin({Key? key}) : super(key: key);

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
                Text("طلبات الانضمام",
                  style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                ),
                SizedBox(height: 48.h,),
          Expanded(
            child: ListView.builder(itemCount:provider.watingUser.length ,itemBuilder:
            (context,index){
             return  AdminJR(provider.watingUser[index]);
            
            }),
          )
              ],
            ),
          );}
        ),
      ),
    );
  }
}
