import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/models/login_model.dart';
import 'package:binh_thuan/models/subject_models.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/course/subject_screen.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../../../repo/repo/subject_repo.dart';

class NestedScroll extends StatelessWidget {
  const NestedScroll({
    super.key,
    required this.info,
    required this.listSubjectModel,
  });
  final HomeModel info;
  final List<SubjectModels> listSubjectModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        //appBar: AppBar(automaticallyImplyLeading: false),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                chatIcon(
                  context: context,
                  icon: 'assets/icons/message_icon_blue.svg',
                ),
                SizedBox(
                  width: 240.w,
                ),
                GestureDetector(
                  onTap: () {
                    AppRouter.toPage(
                      context,
                      AppPages.NotificationScreen,
                      arguments: {},
                    );
                  },
                  child: Container(
                    height: 32.h,
                    width: 65.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: kPrimaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '  04',
                          style: defaultText12.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        SvgPicture.asset('assets/icons/noti_icon.svg')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '\t    Sắp diễn ra',
              style: defaultText16.copyWith(
                  fontWeight: FontWeight.bold, fontFamily: 'Nunito-Bold'),
            ),
            (info.comming.isEmpty)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hiện không có lớp học nào',
                          style: defaultText14),
                    ),
                  )
                : SizedBox(
                    width: 380.w,
                    height: 111.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      //itemExtent: 390.0.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      itemCount: info.comming.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ComingLesson(
                          comingLessonModels: info.comming[index],
                          id: info.comming[index].id,
                        );
                      },
                    ),
                  ),
            Text(
              '\t    Môn học của tôi',
              style: defaultText16.copyWith(fontFamily: 'Nunito-Bold'),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 570.h,
              child: ListView.builder(
                  itemCount: listSubjectModel.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 10.h),
                  //reverse: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          DetailSubjectModels detailSubject =
                              await SubjectRepo().detailSubject(
                                  id: listSubjectModel[index].id);
                          pushWithoutNavBar(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubjectScreen(
                                detailSubject: detailSubject,
                              ),
                            ),
                          );
                        },
                        child: CourseItem(
                          subject: listSubjectModel[index],
                          name: 'Tất cả',
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
    // DefaultTabController(
    //   length: tabs.length,
    //   child: NestedScrollView(
    //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //       return <Widget>[
    //         SliverOverlapAbsorber(
    //           handle:
    //               NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    //           sliver: SliverAppBar(
    //             flexibleSpace: SafeArea(
    //               child:

    //             pinned: false,
    //             toolbarHeight: (info.comming.isEmpty) ? 150.h : 220.h,
    //             forceElevated: innerBoxIsScrolled,
    //             // bottom: TabBar(
    //             //   tabs: tabs.map((String name) => Tab(text: name)).toList(),
    //             // ),
    //             backgroundColor: Colors.white,
    //           ),
    //         ),
    //       ];
    //     },
    //     body: Container(
    //       decoration: BoxDecoration(color: Colors.grey.shade300),
    //       //padding: EdgeInsets.only(bottom: 20.h),
    //       width: 390.w,
    //       child: AspectRatio(
    //         aspectRatio: 10 / 10,
    //         child: TabContainer(
    //           borderRadius: BorderRadius.circular(20.r),
    //           tabBorderRadius: BorderRadius.circular(30.r),
    //           tabEdge: TabEdge.top,
    //           curve: Curves.easeIn,
    //           transitionBuilder: (child, animation) {
    //             animation =
    //                 CurvedAnimation(curve: Curves.easeIn, parent: animation);
    //             return SlideTransition(
    //               position: Tween(
    //                 begin: const Offset(0.2, 0.0),
    //                 end: const Offset(0.0, 0.0),
    //               ).animate(animation),
    //               child: FadeTransition(
    //                 opacity: animation,
    //                 child: child,
    //               ),
    //             );
    //           },
    //           color: Colors.white,
    //           selectedTextStyle: defaultBoldText.copyWith(fontSize: 15.sp),
    //           unselectedTextStyle: defaultBoldText.copyWith(
    //               color: kPrimaryColor,
    //               fontSize: 13,
    //               fontWeight: FontWeight.w200),
    //           tabs: getTabs1(),
    //           children: getChildren1(listSubjectModel: listSubjectModel),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

const List<String> tabs = <String>['Tất cả', 'Đang học', 'Hoàn thành'];
List<Widget> getTabs1() {
  return tabs
      .map((e) => Text(
            e,
          ))
      .toList();
}

List<Widget> getChildren1({
  required List<SubjectModels> listSubjectModel,
}) {
  return tabs.map((String name) {
    return Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          key: PageStorageKey<String>(name),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12.0),
              sliver: SliverFixedExtentList(
                itemExtent: 136.h,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          DetailSubjectModels detailSubject =
                              await SubjectRepo().detailSubject(
                                  id: listSubjectModel[index].id);
                          pushWithoutNavBar(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubjectScreen(
                                detailSubject: detailSubject,
                              ),
                            ),
                          );
                        },
                        child: CourseItem(
                          subject: listSubjectModel[index],
                          name: 'Tất cả',
                        ),
                      ),
                    );
                  },
                  childCount: listSubjectModel.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }).toList();
}

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.subject, required this.name});
  final SubjectModels subject;
  final String name;
  @override
  Widget build(BuildContext context) {
    return (name != 'Tất cả' && name != subject.status)
        ? const SizedBox()
        : SizedBox(
            height: 117.h,
            child: Stack(
              children: [
                Positioned(
                  left: 0.w,
                  top: 0.h,
                  child: Image(
                    height: 117.h,
                    width: 350.w,
                    image: const AssetImage('assets/images/course_bg1.png'),
                    fit: BoxFit.fill,
                    //color: listColor[Random().nextInt(listColor.length)],
                    //color: Colors.pink.withOpacity(0.5),
                  ),
                ),
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: Container(
                //     height: 25.h,
                //     decoration: const BoxDecoration(color: Colors.transparent),
                //     child: Text(
                //       subject.statusValue == '1' ? ' Hoàn thành' : 'Đang học',
                //       style: defaultText12.copyWith(
                //         fontFamily: 'Nunito-Bold',
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 40.h,
                  left: 8.w,
                  child: Text(
                    subject.startDate,
                    style: defaultText14.copyWith(
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 128.w,
                  child: Text(
                    subject.endDate,
                    style: defaultText14.copyWith(
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5.h,
                  left: 8.w,
                  child: Text(
                    'Giáo viên: ${subject.teacherName}',
                    style: defaultText16.copyWith(
                      fontFamily: 'Nunito-Bold',
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      subject.subjectName,
                      style: defaultText16.copyWith(
                        fontFamily: 'Nunito-Bold',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
// class CommingLesson extends StatelessWidget {
//   const CommingLesson({super.key, required this.videoLesson});
//   final List<LessonModels> videoLesson;
//   final String id;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         ChiTietBuoiHocModel lessonModels = await LessonRepo().lessonDetails(id:id);
//         pushWithoutNavBar(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LessonDetailsScreen(
//               videoLesson: videoLesson,
//               chiTiet: lessonModels,
//               document: const [],
//               id: '',
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//         width: 200.w,
//         height: 110.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(8.r)),
//           boxShadow: [
//             BoxShadow(
//               color: kPrimaryColor.withOpacity(0.2),
//               spreadRadius: 3,
//               blurRadius: 7,
//               offset: const Offset(0, 1),
//             ),
//           ],
//           color: Colors.white,
//         ),
//         child: Row(
//           children: [
//             Container(
//               margin: const EdgeInsets.all(6),
//               height: 76.h,
//               width: 76.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(8.r),
//                 ),
//                 color: const Color(0xffF7926E),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'Thứ 6',
//                     style: defaultText12.copyWith(
//                       color: Colors.white,
//                     ),
//                   ),
//                   Container(
//                     margin:
//                         const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
//                     height: 1.h,
//                     width: 42.w,
//                     color: Colors.white,
//                   ),
//                   Text(
//                     '27',
//                     style: defaultText20.copyWith(
//                       fontWeight: FontWeight.w900,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'tháng 4',
//                     style: defaultText12.copyWith(
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             SizedBox(
//               height: 80.h,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Toán',
//                     style: defaultText16.copyWith(
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       SvgPicture.asset('assets/icons/time_icon.svg'),
//                       Text(
//                         ' 07:15 - 08:00',
//                         style: defaultText12,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       SvgPicture.asset('assets/icons/bookmark.svg'),
//                       Text(
//                         ' Buổi 9',
//                         style: defaultText12,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
