import 'package:dot/profilePage/login.dart';
import 'package:dot/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../commonWidgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print('data: ${snapshot.data}');
        return Container(
          padding: const EdgeInsets.only(left: 10.0),
          height: 100.0,
          color: Theme.of(context).splashColor,
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: snapshot.hasData
                    ? Text(
                        snapshot.data!.email![0].toUpperCase(),
                        style: const TextStyle(fontSize: 28.0),
                      )
                    : null,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (snapshot.hasData) Text(snapshot.data!.email!),
                  Row(
                    children: [
                      CustomButton(
                        text: 'Login',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                      ),
                      const SizedBox(width: 10.0),
                      if (snapshot.hasData)
                        CustomButton(
                          text: 'Logout',
                          onPressed: () {
                            FirebaseService.logout();
                          },
                        ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
