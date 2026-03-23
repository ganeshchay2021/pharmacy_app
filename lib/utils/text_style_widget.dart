import 'package:flutter/material.dart';

class TextStyleWidget {
  //text styles for heatlines text
  static TextStyle headlineTextStyle(double size, {Color? color=Colors.black}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "Poppins-semiBold",
    );
  }

  //text styles for light text
  static TextStyle lightTextStyle(double size, {Color? color=Colors.black}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "Poppins",
    );
  }
}
