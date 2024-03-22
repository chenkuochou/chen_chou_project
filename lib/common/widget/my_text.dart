import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:flutter/material.dart';

Text myText(
  String text, {
  Color? color = MyPalette.neutral4,
  double? size,
  bool? bold,
  TextStyle? style,
}) =>
    Text(
      text,
      style: style ??
          TextStyle(
            color: color,
            fontSize: size,
            fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
          ),
    );
