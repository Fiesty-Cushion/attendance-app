import 'dart:convert';

import 'package:http/http.dart';

import 'Register_Parse.dart';

Future<Register> registerUser(String username, String email, String password, String confirmPassword) async{


  final Response response = await post(Uri.parse("https://10.0.2.2:5001/account/register"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      })
  );

  var registerInfo = Register.fromJson(jsonDecode(response.body));

  if (response.statusCode == 200 || response.statusCode == 400) {
    print("Registration Successful");
    return registerInfo;
  }
  else {
    print("Registration Failed");
    throw Exception('Failed to Register...');

  }

}