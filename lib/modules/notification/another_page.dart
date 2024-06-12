import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thông báo",
          style: defaultText20.copyWith(
            color: keyWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: keyWhite),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
          child: Text(
        data.toString(),
        style: const TextStyle(color: Colors.black),
      )),
    );
  }
}
