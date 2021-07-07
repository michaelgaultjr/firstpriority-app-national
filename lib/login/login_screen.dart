import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/login/components/TopSignInPart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants.dart';

class LoginScreen extends StatelessWidget {
  static const resetPasswordUrl =
      "https://core.firstpriority.cc/Identity/Account/ForgotPassword";

  final AccountController _controller = Get.find<AccountController>();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopSignInPart(),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Email Address",
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontFamily: fontSchylerRegular),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                    ),
                  ),
                  // Bottom Part
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      child: Text("Sign In"),
                      onPressed: () async {
                        final result = await _controller.login(
                          _emailController.text,
                          _passwordController.text,
                        );

                        if (result.authenticated) return;

                        String errorMessage = "Invalid email or password.";

                        if (result.isLockedOut) {
                          errorMessage =
                              "Locked Out. Too many invalid login attempts.";
                        } else if (result.isNotAllowed) {
                          errorMessage = "Login disabled for this account.";
                        }

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text(errorMessage),
                              actions: [
                                TextButton(
                                  onPressed: Navigator.of(context).pop,
                                  child: Text("Close"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Trouble signing in?'),
                      SizedBox(width: 2.0),
                      TextButton(
                        onPressed: () async {
                          await canLaunch(resetPasswordUrl)
                              ? launch(resetPasswordUrl)
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Could not launch $resetPasswordUrl'),
                                  ),
                                );
                        },
                        child: Text("Reset your password."),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
