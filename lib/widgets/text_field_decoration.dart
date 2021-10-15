import 'package:flutter/material.dart';

InputDecoration textFieldDeco({String? hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
    ),
  );
}
