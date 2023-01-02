import 'package:flutter/material.dart';
import 'package:ui_test/utils/screen_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Username",
                        label: Text("Enter Username"),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        label: Text("Enter Password"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 60.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (isLoading) return;
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(Duration(seconds: 2));

                    setState(() {
                      Navigator.pushNamed(context, MyRoute.mainRoute);
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.0,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: StadiumBorder(),
                      minimumSize: Size.fromHeight(60)),
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
    );
  }
}
