import 'package:binh_thuan/constants/string.dart';
import 'package:binh_thuan/main.dart' as main;
import 'package:binh_thuan/models/login_model.dart';
import 'package:binh_thuan/models/subject_models.dart';
import 'package:binh_thuan/modules/auth/login/login_screen.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:binh_thuan/modules/notification/noti_repo.dart';
import 'package:binh_thuan/repo/repo/home_repo.dart';
import 'package:binh_thuan/repo/repo/subject_repo.dart';
import 'package:binh_thuan/utils/onesignal.dart';
import 'package:flutter/material.dart';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:sp_util/sp_util.dart';

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
    main.listNotification = await NotificationRepo().getAllNotification();
    String token = SpUtil.getString(ConstString.token, defValue: '') ?? '';
    //sendUserTag(1423);

    if (token != '') {
      HomeModel info = await HomeRepo().home(token: token);
      List<SubjectModels> listSubjectModels =
          await SubjectRepo().subject(token: token);
      return BottomNavBar(
        info: info,
        listSubjectModel: listSubjectModels,
      );
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget child = EasySplashScreen(
      futureNavigator: checkToken(),
      logo: Image.asset(
        'assets/images/Logo.png',
        color: Colors.transparent,
      ),
      logoWidth: 170,
      backgroundImage: const AssetImage('assets/images/splash.png'),
    );

    return child;
  }
}
