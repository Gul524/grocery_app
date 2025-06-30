import 'package:flutter/material.dart';

class AppFontsStyle {
  static TextStyle largeHeadingBold(BuildContext context, bool isBold) {
    return TextStyle(
      fontSize: 20,
      fontWeight: !isBold ? FontWeight.normal : FontWeight.bold,
      color: Theme.of(context).primaryColorDark,
    );
  }

  static TextStyle mediumHeadingBold(BuildContext context, bool isBold) {
    return TextStyle(
      fontSize: 15,
      fontWeight: !isBold ? FontWeight.normal : FontWeight.bold,
      color: Theme.of(context).primaryColorDark,
    );
  }
}
