import 'package:flutter/material.dart';
import 'package:ui_test/utils/screen_routes.dart';
import 'package:ui_test/widgets/snackbar.dart';

import '../resources/Authentication/login_fetch.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late Object loginInfo;
  bool loggedIn = true;
  bool isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/welcome.png",
                    fit: BoxFit.cover,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onTap: () {
                              setState(() {});
                            },
                            textInputAction: TextInputAction.next,
                            controller: usernameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Username',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username can't be empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onTap: () {
                              setState(() {});
                            },
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password can't be empty";
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 60.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (isLoading) return;
                          setState(() {
                            isLoading = true;
                          });

                          var loginInfo = await fetchLogin(
                              usernameController.text.toString(),
                              passwordController.text.toString());

                          if (!mounted) return;

                          if (loginInfo.accessToken != null) {
                            setState(() {
                              loggedIn = true;
                            });
                          } else if (loginInfo.errorDescription != null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(buildSnackBar(loginInfo.errorDescription));
                          }

                          if (loggedIn) {
                            setState(() {
                              Navigator.pushNamed(context, MyRoute.mainRoute);
                              isLoading = false;
                              loggedIn = false;
                            });
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: const StadiumBorder(),
                          minimumSize: const Size.fromHeight(60)),
                      child: isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.0,
                      )
                          : const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, MyRoute.registerRoute);
                      });
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.grey[700],
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
