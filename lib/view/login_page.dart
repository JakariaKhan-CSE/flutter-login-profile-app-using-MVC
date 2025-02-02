import 'package:flutter/material.dart';
import 'package:flutter_login_profile_app/controller/loginProvider.dart';
import 'package:provider/provider.dart';

import '../model/loginModel.dart';
import 'common/customButton.dart';
import 'common/customTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // dispose use for release memory
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        elevation: 15,
        centerTitle: true,
      ),
      body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: loginNotifier.loginFormKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Welcome Back!',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const Text('Fill the details to login to your account',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    controller: email,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains(
                              "@")) // email filed jodi empty hoi and @ na thake tahole invalid message return korbe
                      {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: password,
                    hintText: "Password",
                    keyboardType: TextInputType.text,
                    validator: (password) {
                      if (password!.isEmpty ||
                          password.length <
                              6) // email filed jodi empty hoi and @ na thake tahole invalid message return korbe
                      {
                        return "Please enter at least 6 digit password";
                      }
                      return null;
                    },
                    obscureText: loginNotifier.obsecureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginNotifier.obsecureText =
                            !loginNotifier.obsecureText;
                      },
                      child: loginNotifier.obsecureText
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      text: 'Login',
                      onTap: () {
                        if (loginNotifier.validateAndSave()) {
                          LoginModel model = LoginModel(
                              email: email.text.trim(),
                              password: password.text.trim());

                          loginNotifier.userLogin(model,context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('SignIn Failed'),backgroundColor: Colors.red));
                        }
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
