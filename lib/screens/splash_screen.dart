import 'dart:async';
import 'dart:ui';

import 'package:cdv/drawer/drawer_page.dart';
import 'package:cdv/screens/login_screen.dart';
import 'package:cdv/services/repPainter_new.dart';
import 'package:cdv/services/rpsPainter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isJailBroken = false;
  bool canMockLocation = false;

  @override
  void initState() {
    super.initState();
    _mockCheckForSession().whenComplete(() async {
      Timer(Duration(seconds: 5),
          () => finalKeys == null ? _navigateToLogin() : _navigateToHome());
    });
  }

  String? finalKeys;
  Future _mockCheckForSession() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var checkMobileNumber = sharedPreferences.getString('mobilenumber');
    setState(() {
      finalKeys = checkMobileNumber;
    });
    print(checkMobileNumber);
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => DrawerPage(),
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      ),
    );
  }

  double round = 20.0, elevate = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.red[900]!,
                Colors.red[800]!,
                Colors.red[400]!,
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width / 1.4,
                    MediaQuery.of(context).size.height),
                painter: RPSCustomPainter(Colors.deepOrange[600]!),
              ),
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width / 1.5,
                    MediaQuery.of(context).size.height),
                painter: RPSCustomPainternew(Colors.red[800]!),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(25),
                  // height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15,
                        sigmaY: 15,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white60,
                              Colors.white10,
                            ],
                          ),
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            width: 2,
                            color: Colors.white30,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset('assets/images/logo.png'),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Civil Defence \n Volunteer',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Mobile Application',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
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
