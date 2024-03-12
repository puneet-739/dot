import 'package:flutter/material.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Text(
            "Theme",
            style: TextStyle(fontSize: 20.0),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.light_mode,
                size: 30.0,
              ))
        ],
      ),
    );
  }
}
