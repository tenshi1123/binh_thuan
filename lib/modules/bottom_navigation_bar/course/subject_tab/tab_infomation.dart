import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/subject_tab/schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/lesson_model.dart';

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
              child: TaiLieuTabBar(
                videoLesson: detailSubject.lesson,
                taiLieu: detailSubject.document,
              ),
              // ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     padding: const EdgeInsets.all(8),
              //     itemCount: detailSubject.subjectsChapters.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return SubjectChapter(
              //         taiLieu: detailSubject.subjectsChapters[index],
              //         videoContent: '',
              //         isVideo: false,
              //       );
              //     }),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectChapter extends StatelessWidget {
  const SubjectChapter(
      {super.key,
      this.taiLieu,
      required this.videoContent,
      required this.isVideo});
  final SubjectChapterModels? taiLieu;

  final String videoContent;
  final bool isVideo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 83.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(4, 4.5), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  6.r,
                ),
              ),
            ),
            child: SvgPicture.asset(
              isVideo
                  ? 'assets/icons/video_icon.svg'
                  : 'assets/icons/home_work_icon.svg',
              width: 18.w,
              height: 18.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 8.w),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(
              //   isVideo
              //       ? videoContent != ''
              //           ? videoValue[1]
              //           : videoLesson!.name
              //       : taiLieu!.name,
              //   style: defaultBoldText,
              // ),
              // Text(
              //   isVideo ? 'video' : taiLieu!.fileType,
              //   style: defaultText14.copyWith(color: color999),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
