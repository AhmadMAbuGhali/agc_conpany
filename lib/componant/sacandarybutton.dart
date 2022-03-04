import 'package:agc_conpany/themes/themes.dart';
import 'package:flutter/material.dart';

class SacandaryButton extends StatelessWidget {
  const SacandaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.height,
    required this.width,
    required this.color,
    required this.isFill,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final double height;
  final double width;
  final Color color;
  final bool isFill;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  isFill
      ?Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ):Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.transparent,
          border: Border.all(
        color: color,

        ),
        ),
        alignment: Alignment.center,
        width: width,
        height: height,

        child: Text(
          label,
          style:  TextStyle(color: color, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
