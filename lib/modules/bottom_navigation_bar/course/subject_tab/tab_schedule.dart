import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/subject_tab/schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabSchedule extends StatelessWidget {
  final String name;
  const TabSchedule({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' \tĐang diễn ra',
              style: defaultBoldText,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Hiện không có lớp học nào', style: defaultText14),
              ),
            ),
            Text(
              ' \rThời khóa biểu',
              style: defaultBoldText,
            ),
            const Expanded(child: ScheduleItem()),
          ],
        ),
      ),
    );
  }
}
