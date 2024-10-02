import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hackerkernel_task_mohit_verma/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var islog;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      checkLoginStatus(context);
    });
  }

  // Check if the user is already logged in
  Future<void> checkLoginStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      log('user is loggedin');
      Navigator.pushReplacementNamed(context, '/home'); // Navigate to home page
    } else {
      log('user is not loggedin');
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: mq.height,
          width: mq.width,
          margin: EdgeInsets.only(top: mq.height * 0.4),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Splash Screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'HackerKernel task By Mohit Verma',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
