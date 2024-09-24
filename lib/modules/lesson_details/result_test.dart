import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';

class ResultTestScreen extends StatefulWidget {
  const ResultTestScreen({super.key});

  @override
  State<ResultTestScreen> createState() => _ResultTestScreenState();
}

class _ResultTestScreenState extends State<ResultTestScreen> {
  //int _currentPage = 1;
  //@override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Pagination Example"),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 200,
  //             margin: const EdgeInsets.all(32),
  //             color: Colors.blue,
  //             child: Center(
  //               child: Text(
  //                 "PAGE: $_currentPage",
  //                 style: const TextStyle(color: Colors.white, fontSize: 20),
  //               ),
  //             ),
  //           ),
  //           Pager(
  //             currentPage: _currentPage,
  //             totalPages: 5,
  //             onPageChanged: (page) {
  //               setState(() {
  //                 _currentPage = page;
  //               });
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  final int _numPages = 10;
  int _currentPage = 0;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _numPages,
      (index) => SizedBox(
        height: 500.h,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 21.h,
                  width: 21.w,
                  decoration: const BoxDecoration(
                    color: keyBlack,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: defaultText16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 304.w,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do?",
                    style: defaultText16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  //tristate: true,
                  value: isChecked,
                  shape: const CircleBorder(),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                SizedBox(
                  width: 304.w,
                  child: Text(
                    "A. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.",
                    style: defaultText16,
                  ),
                ),
              ],
            ),
            const Answer(
              title:
                  'B. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
            ),
            const Answer(
              title:
                  'C. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
            ),
            const Answer(
              title:
                  'D. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Test 8 : AM GM',
          style: defaultBoldText.copyWith(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 350.w,
          height: 110.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 7), // changes position of shadow
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đề bài:',
                style: defaultBoldText,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                style: defaultText14,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        pages[_currentPage],
      ]),
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: NumberPaginator(
          // by default, the paginator shows numbers as center content
          numberPages: _numPages,
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}

class Answer extends StatefulWidget {
  const Answer({super.key, required this.title});
  final String title;
  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Checkbox(
          //tristate: true,
          value: isChecked,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        SizedBox(
          width: 304.w,
          child: Text(
            widget.title,
            style: defaultText16,
          ),
        ),
      ],
    );
  }
}
