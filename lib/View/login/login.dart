import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackerkernel_task_mohit_verma/CustomWidgets/custom_textform.dart';
import 'package:hackerkernel_task_mohit_verma/ViewModel/login_viewmodel.dart';
import 'package:hackerkernel_task_mohit_verma/main.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Consumer<LoginViewmodel>(
              builder: (context, loginviewModel, _) {
                return Stack(
                  children: [
                    Form(
                      key: loginviewModel.formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: mq.height * 0.03,
                          ),
                          Container(
                              height: mq.height * 0.3,
                              width: mq.width,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/mental-health.png'),
                                fit: BoxFit.contain,
                              )),
                          SizedBox(
                            height: mq.height * 0.04,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: mq.width * 0.1),
                            child: Text(
                              'Login',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.alternate_email),
                              SizedBox(
                                width: mq.width * 0.05,
                              ),
                              Container(
                                width: mq.width * 0.7,
                                child: CustomTextFormField(
                                  controller: loginviewModel.emailControler,
                                  hintText: 'Email ID',
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter your email id';
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock),
                              SizedBox(
                                width: mq.width * 0.05,
                              ),
                              Container(
                                width: mq.width * 0.7,
                                child: CustomTextFormField(
                                  controller: loginviewModel.passControler,
                                  hintText: 'Password',
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter password';
                                    }
                                  },
                                ),
                              )
                            ],
                          ),

                          Container(
                            alignment: Alignment.centerRight,
                            margin:
                                EdgeInsets.only(right: mq.width * 0.1, top: 10),
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                          ),
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, '/home');
                              if (loginviewModel.formKey.currentState!
                                  .validate()) {
                                loginviewModel.loginForm(
                                    loginviewModel.emailControler.text,
                                    loginviewModel.passControler.text,
                                    context);
                              }
                            },
                            child: Container(
                              height: mq.height * 0.06,
                              width: mq.width * 0.8,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent),
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: mq.height * 0.1,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: mq.width * 0.4,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.grey)),
                                  ),
                                ),
                                SizedBox(
                                  width: mq.width * 0.01,
                                ),
                                Text('OR'),
                                SizedBox(
                                  width: mq.width * 0.01,
                                ),
                                Expanded(
                                  child: Container(
                                    // width: mq.width * 0.4,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.grey)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              children: [
                                TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to the Register screen
                                      // Use Navigator.of(context).pushNamed('/register') if you have named routes
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    loginviewModel.loading
                        ? Stack(
                            children: [
                              Container(
                                height: mq.height,
                                width: mq.width,
                                decoration: const BoxDecoration(),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 5.0, sigmaY: 5.0),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: mq.height * 0.45),
                                child: const Center(
                                  child: CupertinoActivityIndicator(
                                    color: Colors.black,
                                    radius: 15,
                                    animating: true,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
