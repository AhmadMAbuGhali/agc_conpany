import 'package:agc_conpany/componant/primarybutton.dart';
import 'package:agc_conpany/componant/sacandarybutton.dart';
import 'package:agc_conpany/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SacandaryButton(
          label: 'Test',
          onTap: () {},
          height: 40.h,
          width: 80.w,
          color: rejectClr,
        ),
      ),
    );
  }
}
