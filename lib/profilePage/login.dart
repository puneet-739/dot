import 'package:dot/commonWidgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../commonWidgets/custom_textformfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                title: 'username',
                textFormFieldKey: usernameKey,
                textFormFieldController: usernameController,
              ),
              const SizedBox(height: 20.0,),
              CustomTextFormField(
                title: 'password',
                textFormFieldKey: passwordKey,
                textFormFieldController: passwordController,
              ),
              const SizedBox(height: 20.0,),
              CustomButton(
                text: 'Login',
                onPressed: () {  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
