import 'dart:convert';

import 'package:http/http.dart';

import 'Login_Parse.dart';

Future<Login> fetchLogin(String username, String password) async {
  final Response response =
      await post(Uri.parse("https://10.0.2.2:5001/connect/token"), headers: {
    "Content-Type": "application/x-www-form-urlencoded",
  }, body: {
    "client_id": "attendr",
    "client_secret": "clientsecret",
    "grant_type": "password",
    "username": username,
    "password": password,
  });

  var loginInfo = Login.fromJson(jsonDecode(response.body));

  if (response.statusCode == 200 || response.statusCode == 400) {
    print("Login Successful");
    return loginInfo;
  }
  else {
    print("Login Failed");
    throw Exception('Failed to Login...');
  }
}
