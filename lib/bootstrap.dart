import 'dart:async';
import 'package:flutter/material.dart';

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder].
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  //await LocalNotifications.init();
  //await Firebase.initializeApp();
  runApp(await builder());
}
