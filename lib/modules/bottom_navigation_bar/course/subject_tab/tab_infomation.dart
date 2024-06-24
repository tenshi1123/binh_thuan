import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/subject_tab/schedule_item.dart';
import 'package:flutter/material.dart';

class TabInfomation extends StatelessWidget {
  const TabInfomation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Toán nâng cao',
          style: defaultBoldText,
        ),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod dolore tempor incididunt ut labore et dolore magna aliqua.',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        Row(
          children: [
            Column(
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
            Column(
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
        const Expanded(child: ScheduleItem()),
      ],
    );
  }
}
