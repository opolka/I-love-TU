import 'package:flutter/material.dart';

double screenWidth = 0;
double screenHeight = 0;
bool isRegister = false;
final List<Map<String, dynamic>> subjectAddList = [];

double app_font_bold() {
  //430=promax
  //932=promax
  if (screenWidth == 430 && screenHeight == 932) {
    return screenWidth / 27;
  } else {
    return screenWidth / 27;
  }
}
 bool cheeckDuplicateSubject(String subjectid) {
    for (var data in subjectAddList) {
      if (data['id'] == subjectid) {
        return true;
      }
    }
    return false;
  }

double padding_register_right() {
  if (screenWidth == 430 && screenHeight == 932) {
    return 50;
  } else {
    return 50;
  }
}

Container getBlock() {
  return Container(
    height: screenHeight,
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 230, 143),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60))),
  );
}
