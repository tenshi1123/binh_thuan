import 'package:binh_thuan/modules/app.dart';
import 'package:binh_thuan/modules/notification/local_notification.dart';
import 'package:binh_thuan/modules/notification/noti_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sp_util/sp_util.dart';

final navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldState> key = GlobalKey();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
List<NotiModel> listNotification = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await LocalNotifications.init();
  await SpUtil.getInstance();

//  handle in terminated state
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
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://4a127fb84c4d974e54fe42431517a7ed@o4507695073263616.ingest.us.sentry.io/4507695076147200';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    // appRunner: () =>
    //     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    //         .then((_) {
    //   initializeDateFormatting().then((_) => runApp(const   App()));
    // }),
    appRunner: () => runApp(const App()),
  );
}
