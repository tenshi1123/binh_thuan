import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/subject_tab/schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabInfomation extends StatelessWidget {
  const TabInfomation({
    super.key,
    required this.detailSubject,
  });
  final DetailSubjectModels detailSubject;

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
              detailSubject.info.subjectName,
              style: defaultBoldText.copyWith(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số tiết',
                      style: defaultText16,
                    ),
                    Text(
                      'Giáo viên',
                      style: defaultText16,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailSubject.lichHoc.length.toString(),
                      style: defaultBoldText,
                    ),
                    Text(
                      detailSubject.info.teacherName,
                      style: defaultBoldText,
                    ),
                    // Text(
                    //   'Online/Lớp học qua Zoom',
                    //   style: defaultBoldText,
                    // )
                  ],
                ),
              ],
            ),
            const Divider(),
            Text(
              'Kho tài liệu',
              style: defaultBoldText,
            ),
            Expanded(
                child: InfoItem(
              videoLesson: detailSubject.lesson,
              taiLieu: detailSubject.document,
            )),
          ],
        ),
      ),
    );
  }
}
