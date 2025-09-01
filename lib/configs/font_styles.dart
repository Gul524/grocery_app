import 'package:flutter/material.dart';

class AppFontsStyle {
  static TextStyle largeHeadingBold(
    BuildContext context, {
    bool isBold = true,
    bool isDisable = false,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 20,
      fontWeight: !isBold ? FontWeight.normal : FontWeight.bold,
      color:
          (color == null)
              ? isDisable
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).primaryColorDark
              : color,
    );
  }

  static TextStyle mediumHeadingBold(
    BuildContext context, {
    bool isBold = true,
    bool isDisable = false,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 15,
      fontWeight: !isBold ? FontWeight.normal : FontWeight.bold,
      color:
          (color == null)
              ? isDisable
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).primaryColorDark
              : color,
    );
  }

  static TextStyle smallHeadingBold(
    BuildContext context, {
    bool isBold = true,
    bool isDisable = false,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12,
      fontWeight: !isBold ? FontWeight.normal : FontWeight.bold,
      color:
          (color == null)
              ? isDisable
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).primaryColorDark
              : color,
    );
  }
}
