import 'dart:async';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const AttendanceScreen(),
//     );
//   }
// }

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  static var countdownDuration1 = const Duration(minutes: 10);
  Duration duration1 = const Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;
  @override
  void initState() {
    int hours1;
    int mints1;
    int secs1;
    hours1 = int.parse("00");
    mints1 = int.parse("00");
    secs1 = int.parse("30");
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        _onWillPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Timer Example",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              _onWillPop();
            },
          ),
        ),
        body: Container(
          color: Colors.black12,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Count down timer",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                    child: buildTime1()),
              ]),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = const Duration());
    }
  }

  void startTimer1() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime1());
  }

  void addTime1() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration1.inHours);
    final minutes = twoDigits(duration1.inMinutes.remainder(60));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(header, style: const TextStyle(color: Colors.black45)),
        ],
      );
}
