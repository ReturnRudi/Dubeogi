import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 12.0,
        fontFamily: 'Paybooc',
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
      textAlign: align ?? TextAlign.start,
    );
  }

  TextAlign? align;
}
