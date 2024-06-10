import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder].
int ramSize = 0;
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(await builder());
}

class Downloadd {
  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    if (kDebugMode) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }
}
