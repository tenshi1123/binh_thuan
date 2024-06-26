//custom widget
import 'dart:math';

import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../lesson_details/screen/lesson_details_screen.dart';

class ExampleDialog extends StatelessWidget {
  const ExampleDialog({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "This is a modal screen",
                textAlign: TextAlign.center,
                style: defaultText20.copyWith(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Return"),
                ),
              ),
            ],
          ),
        ),
      );
}

final _random = Random();

class ComingLesson extends StatelessWidget {
  const ComingLesson({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LessonDetailsScreen(),
          ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          width: 350.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 7), // changes position of shadow
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(6),
                height: 76.h,
                width: 76.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                  color: const Color(0xffF7926E),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Thứ 6',
                      style: defaultText12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 1.0, end: 1.0),
                      height: 1.h,
                      width: 42.w,
                      color: Colors.white,
                    ),
                    Text(
                      '27',
                      style: defaultText20.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'tháng 4',
                      style: defaultText12.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Toán',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/time_icon.svg'),
                      Text(
                        '  Thời gian: 07:15 - 08:00',
                        style: defaultText12,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/teacher_icon.svg'),
                      Text(
                        '  Giáo viên: HươngNN',
                        style: defaultText12,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
}

class CompleteLesson extends StatelessWidget {
  const CompleteLesson({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        width: 350.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 7), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              height: 76.h,
              width: 76.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                color: const Color(0xffC1CFE4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Thứ 6',
                    style: defaultText12.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 1.h,
                    width: 42.w,
                    color: Colors.white,
                  ),
                  Text(
                    '27',
                    style: defaultText20.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'tháng 4',
                    style: defaultText12.copyWith(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Toán',
                  style: defaultText16.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/time_icon.svg'),
                    Text(
                      '  Thời gian: 07:15 - 08:00',
                      style: defaultText12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/teacher_icon.svg'),
                    Text(
                      '  Giáo viên: HươngNN',
                      style: defaultText12,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}

class ItemTableCalender extends StatelessWidget {
  final Color color = listColor[_random.nextInt(listColor.length)];

  ItemTableCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        width: 350.w,
        height: 78.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 7), // changes position of shadow
            ),
          ],
          color: color,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              height: 68.h,
              width: 69.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Toán',
                    style: defaultBoldText.copyWith(
                      color: color,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 1.h,
                    width: 42.w,
                    color: color,
                  ),
                  Text(
                    '07:00',
                    style: defaultText20.copyWith(
                      fontWeight: FontWeight.w900,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•   Tiết 1',
                  style: defaultBoldText.copyWith(color: Colors.white),
                ),
                Text(
                  '•   Giáo viên: HươngNN',
                  style: defaultBoldText.copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      );
}

class NotificationItem extends StatelessWidget {
  final int title;

  const NotificationItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      width: 390.w,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        color: const Color(0xffDADEF1),
      ),
      child: Row(
        children: [
          Container(
            height: 76.h,
            width: 76.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              color: const Color(0xff6B7AC7),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/calender_icon.svg'),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title [Quan trọng] Thay đổi lịch học',
                  style: defaultText16.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipis cing elit, sed do eiusmod tempor...',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: defaultText14,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final String title;

  const CourseItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(8.r)),
        color: const Color(0xff6CC3C6),
        border: Border.all(width: 1, color: Colors.black54),
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 8.w, right: 0.0),
        visualDensity: VisualDensity(horizontal: 0, vertical: 0.h),
        leading: Container(
          height: 40.h,
          width: 40.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: defaultText12.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          'Giáo viên',
          style: defaultText12.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 45.h,
      width: 265.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(4, 7), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(Icons.menu),
          Text(
            '\r$title',
            style: defaultText16,
          )
        ],
      ),
    );
  }
}
