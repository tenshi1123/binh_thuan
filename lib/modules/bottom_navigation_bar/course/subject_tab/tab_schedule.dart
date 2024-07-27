import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/models/lesson_model.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/subject_tab/schedule_item.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabSchedule extends StatelessWidget {
  final List<LichHocModels> lichHoc;
  final List<DocumentModel> document;

  const TabSchedule({
    super.key,
    required this.lichHoc,
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    // LichHocModels? firstDay =
    //     [...lichHoc.where((e) => e.statusValue == '0')].first;
    bool happenning =
        [...lichHoc.where((e) => e.statusValue == '0')].isNotEmpty &&
            [...lichHoc.where((e) => e.statusValue == '0')].first.day.day ==
                DateTime.now().day &&
            [...lichHoc.where((e) => e.statusValue == '0')].first.day.month ==
                DateTime.now().month;
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
                child: happenning
                    ? CompleteLesson(
                        lichHoc: [...lichHoc.where((e) => e.statusValue == '0')]
                            .first,
                        document: document,
                      )
                    : Text('Hiện không có lớp học nào ', style: defaultText14),
              ),
            ),
            Text(
              ' \rThời khóa biểu',
              style: defaultBoldText,
            ),
            Expanded(
                child: ScheduleItem(
              lichHocSaptoi: [...lichHoc.where((e) => e.statusValue == '0')],
              daHoanThanh: [...lichHoc.where((e) => e.statusValue == '1')],
              document: document,
            )),
          ],
        ),
      ),
    );
  }
}
