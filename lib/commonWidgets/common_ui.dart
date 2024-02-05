import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonUI {
  // TO SHOW SNACK BAR
  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  static testSnackBar(BuildContext context, String text, String copyString) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: copyString));
                    },
                    child: const Text('Copy FCM'))
              ],)
        ));
  }
}