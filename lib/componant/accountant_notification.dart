import 'package:agc_conpany/componant/accountant_button_reject.dart';
import 'package:agc_conpany/componant/accountant_button_trans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountantNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 330.w,
      height: 111.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 5.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الزبون :أحمد محمود',
                      style: TextStyle(fontSize: 12.sp),

                    ),
                    Text('المخبز :العائلات', style: TextStyle(fontSize: 12.sp)),
                    Text('رقم الهاتف :8765432',
                        style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'الصنف :شوال زيرو 200',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text('الكمية :250 ', style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24.h,
                      width: 122.w,
                      child: AccountantNotiTrans(
                        label: 'تحويل الي أمين المخزن',
                        onTap: () {},
                      ),
                    ),
                    AccountantButtonReject(
                      label: 'رفض',
                      onTap: () {},
                      color: Colors.transparent,
                      width: 69.w,
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 15,
                        ),
                        Text('منذ 3 ساعات ', style: TextStyle(fontSize: 12.sp)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
