import 'package:dot/profilePage/login.dart';
import 'package:flutter/material.dart';

import '../commonWidgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      height: 100.0,
      color: Theme.of(context).splashColor,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40.0,
          ),
          const SizedBox(width: 20.0,),
          CustomButton(
            text: 'Login',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
          // signUpButton(context)
        ],
      ),
    );
  }
}
