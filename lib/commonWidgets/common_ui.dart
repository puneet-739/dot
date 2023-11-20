import 'package:flutter/material.dart';

class CommonUI {
  // TO SHOW SNACK BAR
  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}