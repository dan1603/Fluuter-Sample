import 'dart:async';

import 'package:finance_flutter_app/ui/home/home_screen.dart';
import 'package:finance_flutter_app/ui/login/login_screen.dart';
import 'package:finance_flutter_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> {
  bool isLoggedIn = false;

  startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool(Constant.prefAuthenticated);
    });
    print("[Splash] isLoggedIn = $isLoggedIn");
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  Future navigationPage() async {
    if (isLoggedIn == null || !isLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => LoginScreen()
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomeScreen()
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(Assets.logo),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              Strings.splashText,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}