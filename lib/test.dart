import 'package:agc_conpany/componant/primarybutton.dart';
import 'package:agc_conpany/componant/sacandarybutton.dart';
import 'package:agc_conpany/themes/themes.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SacandaryButton( label: 'Test',onTap: (){},height: 40,width: 80,color: rejectClr,),
      ),
    );
  }
}
