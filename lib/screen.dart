import 'package:flutter/material.dart';

class Screen {
  static double calculateFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.08;
  }
}
//double fontSize = Screen.calculateFontSize(context);