import 'package:agc_conpany/componant/accountant_notification.dart';
import 'package:agc_conpany/componant/join_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AdminJoinReq extends StatelessWidget {
  const AdminJoinReq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text('طلبات الانضمام'),
                  SizedBox(height: 25.h,),
                  AdminJR(),
                ],
              ),
            ),
          


    );
  }
}
