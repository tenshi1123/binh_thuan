import 'package:binh_thuan/modules/app.dart';
import 'package:binh_thuan/modules/notification/noti_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:binh_thuan/modules/app.dart';

final navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldState> key = GlobalKey();

List<NotiModel> listNotification = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //await LocalNotifications.init();
  await SpUtil.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initializeDateFormatting().then((_) => runApp(const App()));
  });
  //handle in terminated state
  // var initialNotification =
  //     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  // if (initialNotification?.didNotificationLaunchApp == true) {
  //   // LocalNotifications.onClickNotification.stream.listen((event) {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     // print(event);
  //     navigatorKey.currentState!.pushNamed('/another',
  //         arguments: initialNotification?.notificationResponse?.payload);
  //   });
  // }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initializeDateFormatting().then((_) => runApp(const App()));
  });
  //appRunner: () => runApp(const App()),
}
