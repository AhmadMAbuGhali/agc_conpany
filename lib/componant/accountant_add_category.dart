import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/themes.dart';

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

        width: double.infinity,
        height: 41.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.transparent,
            boxShadow:  [
        BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
      ],
            border: Border.all(
              color: Colors.white60,
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(label,style: titleStyle ,),
            Spacer(),
            IconButton(onPressed: onTap, icon: Icon(Icons.edit)),
             const Text("تعديل " , style: TextStyle(
               color: Colors.grey
             ),)
            ],

          ),
        )
      ),
    );
  }
}
