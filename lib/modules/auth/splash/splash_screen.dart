import 'package:binh_thuan/modules/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:easy_splash_screen/easy_splash_screen.dart';

import '../../app.dart';

class SplashScreenApp extends StatefulWidget {
  const SplashScreenApp({super.key});

  @override
  State<SplashScreenApp> createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  NavigatorState get navigator => navigatorKey.currentState!;

  BuildContext get navigatorContext => navigator.context;
  @override
  void initState() {
    super.initState();
  }

  Future<Widget> checkToken() async {
    return const LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    late Widget child = EasySplashScreen(
      durationInSeconds: 5,
      futureNavigator: checkToken(),
      logo: Image.network(
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
      logoWidth: 170,
      loaderColor: Colors.white,
      backgroundColor: Colors.white,
    );

    return child;
  }
}
