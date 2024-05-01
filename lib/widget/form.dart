import 'package:flutter/material.dart';

final inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(horizontal: 20),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ), 
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  filled: true,
  fillColor: Color.fromRGBO(255, 255, 255, 0.63),
);

