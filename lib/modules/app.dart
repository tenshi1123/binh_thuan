import 'dart:async';
import 'package:binh_thuan/modules/notification/notification_screen.dart';
import 'package:binh_thuan/modules/notification/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auth/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final StreamController<bool> mainController = StreamController<bool>();
Stream<bool> stream = mainController.stream;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  //  to listen to any notification clicked or not
  listenToNotifications() {
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.pushNamed(context, '/another', arguments: event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bình Thuận',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          //home: const SplashScreenApp(),
          routes: {
            '/': (context) => const SplashScreenApp(),
            '/another': (context) => const NotificationScreen(),
          },
        );
      },
    );
  }
}
