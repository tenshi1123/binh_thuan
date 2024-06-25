import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/subject_tab/schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabInfomation extends StatelessWidget {
  const TabInfomation({super.key});

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
              'Toán nâng cao',
              style: defaultBoldText.copyWith(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod dolore tempor incididunt ut labore et dolore magna aliqua.',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: defaultText14,
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
                    Text(
                      'Hình thức',
                      style: defaultText16,
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '18',
                      style: defaultBoldText,
                    ),
                    Text(
                      'HươngNN',
                      style: defaultBoldText,
                    ),
                    Text(
                      'Online/Lớp học qua Zoom',
                      style: defaultBoldText,
                    )
                  ],
                ),
              ],
            ),
            const Divider(),
            Text(
              'Kho tài liệu',
              style: defaultBoldText,
            ),
            const Expanded(child: InfoItem()),
          ],
        ),
      ),
    );
  }
}
