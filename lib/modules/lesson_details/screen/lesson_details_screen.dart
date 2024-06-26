import 'dart:async';

import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/lesson_details/test_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({super.key});

  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  late Timer _timer;
  int _start = 200;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                RichText(
                  text: TextSpan(
                      text: '<',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: '  Chi tiết buổi học ',
                          style: defaultBoldText.copyWith(fontSize: 14.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).pop(),
                        )
                      ]),
                ),
                SizedBox(
                  width: 200.w,
                ),
                SvgPicture.asset('assets/icons/three_dots_icon.svg'),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const ItemDetails(),
            _tabSection(context),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "$_start",
                    style: defaultBoldText,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 57.h,
                  width: 152.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                    border: Border.all(
                      color: kPrimaryColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Xin nghỉ',
                      style: defaultBoldText,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    startTimer();
                  },
                  child: Container(
                    height: 57.h,
                    width: 152.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: rec21Red),
                    child: Center(
                      child: Text(
                        'Vào lớp',
                        style: defaultBoldText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 279.h,
      padding: EdgeInsets.only(left: 20.w, top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: rec27Teal,
            width: 20.w,
            style: BorderStyle.solid,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(4, 4.5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bài 8: Lorem ipsum dolor sit amet',
            style: defaultBoldText,
          ),
          Divider(
            color: keyBlack,
            indent: 0.w,
            endIndent: 240.w,
          ),
          Text(
            'Nội dung ',
            style: defaultBoldText.copyWith(fontSize: 14.sp),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            style: defaultText14,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Chuẩn bị',
            style: defaultBoldText.copyWith(fontSize: 14.sp),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            '• Lorem ipsum',
            style: defaultText14,
          ),
          Text(
            '• Seo do eiusm',
            style: defaultText14,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/time_icon.svg',
                color: keyBlack,
              ),
              Text(
                '  07:15 - 08:00 ',
                style: defaultText14,
              ),
              SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(
                'assets/icons/teacher_icon.svg',
                color: keyBlack,
              ),
              Text(
                '  HươngNN',
                style: defaultText14,
              ),
              SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(
                'assets/icons/book_online.svg',
                color: keyBlack,
              ),
              Text(
                '  Online',
                style: defaultText14,
              ),
            ],
          ),
          Text(
            '    Tiết 1',
            style: defaultText14,
          ),
        ],
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TabBar(tabs: [
          homeTab(title: "Tài liệu", isSeprator: false, hasNumber: false),
          homeTab(title: "Nhiệm vụ", hasNumber: false),
          homeTab(title: "Thắc mắc", hasNumber: false),
        ]),
        SizedBox(
          //Add this to give height
          height: MediaQuery.of(context).size.height * 0.4,
          child: TabBarView(children: [
            _document(),
            const MissionItem(),
            const Text("User Body"),
          ]),
        ),
      ],
    ),
  );
}

Widget _document() {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return const ExerciseItem();
      });
}

class MissionItem extends StatelessWidget {
  const MissionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (169.w / 98.h),
      children: List.generate(
        5,
        (i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TestScreen(),
                ),
              );
            },
            child: Container(
              width: 169.w,
              height: 98.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:
                          const Offset(4, 4.5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: rec27Teal,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.r),
                          ),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/home_work_icon.svg',
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Test 1',
                            style: defaultBoldText,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/time_icon.svg'),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                '15 phút',
                                style: defaultText14,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: rec27Teal,
                  ),
                  Text(
                    'Trắc nghiệm',
                    style: defaultText14,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
