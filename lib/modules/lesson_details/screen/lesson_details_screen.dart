import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../bottom_navigation_bar/course/subject_tab/schedule_item.dart';

class LessonDetailsScreen extends StatelessWidget {
  const LessonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Added
      initialIndex: 0,
      child: Scaffold(
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
                Text(
                  '<  Chi tiết buổi học ',
                  style: defaultBoldText.copyWith(fontSize: 14.sp),
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
            const Expanded(child: InfoItem()),
          ],
        )),
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
            color: Colors.grey.withOpacity(0.2),
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
          )
        ],
      ),
    );
  }
}
