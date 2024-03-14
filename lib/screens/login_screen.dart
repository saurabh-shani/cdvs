import 'dart:ui';

import 'package:cdv/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/Login_Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.red[900]!,
              Colors.red[800]!,
              Colors.red[400]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 125,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Directorate of Civil Defence,\nGovt of NCT of Delhi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),

                  // F_A(
                  //   1,
                  //   const Text(
                  //     "निदेशालय नागरिक सुरक्षा, राष्ट्रीय राजधानी क्षेत्र, दिल्ली सरकार",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Welcome to Civil Defence Management System",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'CDV LOGIN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        LoginWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
