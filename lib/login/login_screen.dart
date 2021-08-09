import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/login/components/TopSignInPart.dart';
import 'package:first_priority_app/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  static const resetPasswordUrl =
      "https://core.firstpriority.cc/Identity/Account/ForgotPassword";

  static const createAccountUrl = "https://core.firstpriority.cc/register";

  final AccountController _controller = Get.find<AccountController>();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TopSignInPart(),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Email Address",
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.required,
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
                        if (!_formKey.currentState.validate()) return;

                        final result = await _controller.login(
                          _emailController.text,
                          _passwordController.text,
                        );

                        if (result.authenticated) return;

                        String errorMessage = "Invalid email or password.";

                        if (result.isLockedOut) {
                          errorMessage =
                              "Locked out. Too many invalid login attempts.";
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () async {
                          await canLaunch(createAccountUrl)
                              ? launch(createAccountUrl)
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Could not launch $createAccountUrl'),
                                  ),
                                );
                        },
                        child: Text("Register here!"),
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
