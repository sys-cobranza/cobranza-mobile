import 'dart:async';

import 'package:cobranza/themes/app_theme.dart';
import 'package:cobranza/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const ROUTE_NAME = "/splash";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const ANIMATION_SECONDS = 1;
  bool isShown = false;
  Timer timer;

  Future hasLogin() async {
    /*UserEntity userEntity = await UserBiz.getUser();
    if (userEntity != null) {
      Provide.value<UserProvide>(context).updateUser(userEntity);
      Navigator.of(context).pushReplacementNamed(HomePage.ROUTE_NAME);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.ROUTE_NAME);
    }*/
    Navigator.of(context).pushReplacementNamed(LoginPage.ROUTE_NAME);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: ANIMATION_SECONDS + 1), () {
      hasLogin();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          isShown = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: AnimatedDefaultTextStyle(
                child: Text(
                  "SYS COBRANZA",
                ),
                style: isShown
                    ? TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColorDark)
                    : TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontSize: 36,
                        fontWeight: FontWeight.w200,
                        color: Colors.blue,
                      ),
                duration: const Duration(seconds: ANIMATION_SECONDS),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FlatButton(
                child: Text(
                  "Cobranza App",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w800),
                ),
                onPressed: () {
                  hasLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
