import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hackerkernel_task_mohit_verma/CustomWidgets/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewmodel extends ChangeNotifier {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  // Login method
  Future<String?> loginForm(
      String email, String password, BuildContext context) async {
    final String url = "https://reqres.in/api/login"; // Complete API endpoint

    try {
      log('email:: ' + email);
      log('password:: ' + password);
      // Making the POST request
      loading = true;
      notifyListeners();
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      // Checking if the request was successful
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log('responseData: $responseData');
        // Extracting the token from the response
        String token = responseData['token'];
        // Save login status and token to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', token);
        log('stored token:: ' + prefs.getString('token').toString());
        Navigator.pushReplacementNamed(
            context, '/home'); // Navigate to home page
        // Navigator.pushNamed(context, '/home');
        return token;
      } else {
        // Handle error response
        print("Login failed with status code: ${response.statusCode}");
        Utils.flushBarErrorMessage('Incorrect credentials', context);
        return null;
      }
    } catch (e) {
      Utils.flushBarErrorMessage('Network issue occure', context);
      log("An error occurred: $e");
      return null;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
