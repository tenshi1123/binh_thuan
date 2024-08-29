import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pager/pager.dart';
import 'package:number_paginator/number_paginator.dart';

class TestDetailScreen extends StatefulWidget {
  const TestDetailScreen({super.key});

  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
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

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _numPages,
      (index) => Center(
        child: Text(
          "Page ${index + 1}",
          style: defaultText16,
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
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Column(
              children: [
                Text(
                  'Thời gian còn lại',
                  style: defaultText14,
                ),
                Text(
                  '12:34',
                  style: defaultText20,
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 35.h,
              width: 74.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.r,
                    ),
                  ),
                  color: rec21Red),
              child: Center(
                child: Text(
                  'Nộp bài',
                  style: defaultBoldText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
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
