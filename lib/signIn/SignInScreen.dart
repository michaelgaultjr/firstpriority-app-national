import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/signIn/components/TopSignInPart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants.dart';

class SignInScreen extends StatelessWidget {
  final AccountController _controller = Get.find<AccountController>();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            // decoration: gradientMainScreenBoxDecoration,
            child: Column(
              children: [
                TopSignInPart(),
                // Middle Part
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontFamily: fontSchylerRegular,
                          ),
                          decoration: inputEditTextDecoration.copyWith(
                            labelText: "Email",
                            labelStyle: labelStyleTextFormField,
                            hintStyle: hintStyleTextFormField,
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(fontFamily: fontSchylerRegular),
                          obscureText: true,
                          decoration: inputEditTextDecoration.copyWith(
                            labelText: "Password",
                            labelStyle: labelStyleTextFormField,
                            hintText: "Enter Password",
                            hintStyle: hintStyleTextFormField,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom Part
                Column(
                  children: [
                    ElevatedButton(
                      child: Text("Sign In"),
                      onPressed: () async {
                        await _controller.login(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Trouble signing in?',
                          style: getCustomTextProperties(
                              Colors.grey, 12, fontSchylerRegular, 0),
                        ),
                        SizedBox(width: 2.0),
                        Text(
                          'Reset your password.',
                          style: getCustomTextProperties(
                              colorDarkBlue1, 14, fontSchylerRegular, 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
