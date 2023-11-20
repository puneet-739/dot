import 'package:dot/commonWidgets/common_ui.dart';
import 'package:dot/commonWidgets/custom_button.dart';
import 'package:dot/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../commonWidgets/custom_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool signUp = false;

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
                title: '${signUp ? 'Enter' : ''} email',
                textFormFieldKey: emailKey,
                textFormFieldController: emailController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                title: '${signUp ? 'Enter' : ''} password',
                textFormFieldKey: passwordKey,
                textFormFieldController: passwordController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      signUp
                          ? setState(() {
                              signUp = false;
                            })
                          : () async {
                              var loginInfo = await FirebaseService.login(
                                  emailController.text,
                                  passwordController.text);
                              if (loginInfo is UserCredential) {
                                Navigator.pop(context);
                              }
                              CommonUI.showSnackBar(
                                  context,
                                  (loginInfo is UserCredential)
                                      ? 'Logged In Successfully'
                                      : loginInfo);
                            }();
                    },
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  CustomButton(
                    text: 'SignUp',
                    onPressed: () {
                      signUp
                          ? () async {
                              var signInInfo =
                                  await FirebaseService.createNewUser(
                                      emailController.text,
                                      passwordController.text);
                              if (signInInfo is UserCredential) {
                                Navigator.pop(context);
                              }
                              CommonUI.showSnackBar(
                                  context,
                                  (signInInfo is UserCredential)
                                      ? 'User Created Successfully'
                                      : signInInfo);
                            }()
                          : setState(() {
                              signUp = true;
                            });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
