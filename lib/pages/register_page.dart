import 'package:flutter/material.dart';
import 'package:ui_test/resources/Registration/register_user.dart';
import 'package:ui_test/widgets/snackbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _usernameChanged = false;
  bool _emailChanged = false;
  bool _passwordChanged = false;
  bool _confirmPasswordChanged = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                expandedHeight: MediaQuery.of(context).size.width,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/register.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height - 50,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Column(
                      children: [
                        const Text(
                          'Register',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        const Divider(thickness: 1.5),
                        const SizedBox(height: 25),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            TextFormField(
                              onTap: () {
                                setState(() {
                                  _usernameChanged = true;
                                });
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _usernameController,
                              validator: (username) {
                                if (isValidUsername(username!) ||
                                    _usernameChanged) {
                                  return null;
                                }
                                return "Username must contain at-least 3 characters";
                              },
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username *',
                              ),
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              onTap: () {
                                setState(() {
                                  _emailChanged = true;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              validator: (email) {
                                if (isValidEmail(email!) || _emailChanged) {
                                  return null;
                                }
                                return "Enter a valid student email";
                              },
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email *',
                              ),
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              onTap: () {
                                setState(() {
                                  _passwordChanged = true;
                                });
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _passwordController,
                              validator: (password) {
                                if (isPasswordValid(password) ||
                                    _passwordChanged) {
                                  return null;
                                } else {
                                  return "Password must be at-least 6 characters, including UPPERCASE\nlowercase and numbers";
                                }
                              },
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password *',
                              ),
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              onTap: () {
                                setState(() {
                                  _confirmPasswordChanged = true;
                                });
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _confirmPasswordController,
                              validator: (confirmPassword) {
                                if (isConfirmPasswordValid(
                                        _passwordController.text.toString(),
                                        _confirmPasswordController.text
                                            .toString()) ||
                                    _confirmPasswordChanged) {
                                  return null;
                                }
                                return "Password didn't match";
                              },
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirm Password *',
                              ),
                            )
                          ]),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 60.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _usernameChanged = false;
                                _emailChanged = false;
                                _passwordChanged = false;
                                _confirmPasswordChanged = false;
                              });

                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                setState(() {
                                  isLoading = true;
                                });

                                var registerInfo = await registerUser(
                                    _usernameController.text.toString(),
                                    _emailController.text.toString(),
                                    _passwordController.text.toString(),
                                    _confirmPasswordController.text.toString());

                                if (!mounted) return;

                                if (registerInfo.error != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      errorSnackBar(registerInfo.error));
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else if (registerInfo.message != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      successSnackBar(registerInfo.message));
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[800],
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
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ],
                    ),
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

bool isValidUsername(String username) {
  final hasManyCharacters =
      RegExp(r'^.{3,128}$', dotAll: true).hasMatch(username);
  return hasManyCharacters;
}

/// Validates email string, *non ascii characters are not accepted*
bool isValidEmail(String email) {
  final pattern = RegExp(r'^[a-zA-Z0-9.]+@[a-z]+(?:\.[a-z]+)*$');
  final domain = RegExp(r'@pcampus.edu.np');
  return pattern.hasMatch(email.trim()) && domain.hasMatch(email.trim());
}

/// Password is valid if it has an uppercase, lowercase, number, symbol and has at least 8 characters
bool isPasswordValid(String? password) {
  final containsUpperCase = RegExp(r'[A-Z]').hasMatch(password!);
  final containsLowerCase = RegExp(r'[a-z]').hasMatch(password);
  final containsNumber = RegExp(r'\d').hasMatch(password);
  //final containsSymbols = RegExp(r'[`~!@#$%^&*()_+\\\-={}\[\]/.,<>;]').hasMatch(password);
  final hasManyCharacters = RegExp(r'^.{8,128}$', dotAll: true)
      .hasMatch(password); // This is variable

  return containsUpperCase &&
      containsLowerCase &&
      containsNumber &&
      hasManyCharacters;
}

bool isConfirmPasswordValid(String? password, String? confirmPassword) {
  if (password == confirmPassword) {
    return true;
  } else {
    return false;
  }
}
