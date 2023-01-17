import 'package:flutter/material.dart';

class TextFieldBorder {
  static OutlineInputBorder fieldBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(20),
  );
}
}