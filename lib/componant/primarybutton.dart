import 'package:agc_conpany/themes/themes.dart';
import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
        alignment: Alignment.center,
        width: 253,
        height: 58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: orangeClr
        ),
        child: Text(label,style: const TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
