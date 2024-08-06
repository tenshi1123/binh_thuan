import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/detail_subject_models.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_container/tab_container.dart';
import 'subject_tab/tab_infomation.dart';
import 'subject_tab/tab_schedule.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen(
      {super.key, this.useRouter = false, required this.detailSubject});
  final bool useRouter;
  final DetailSubjectModels detailSubject;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                flexibleSpace: SizedBox(
                  width: 390.w,
                  height: 170.h,
                  child: Stack(children: [
                    Positioned(
                      top: 0.h,
                      left: 0.h,
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        height: 170.h,
                        image: const AssetImage(
                          'assets/images/appbar_background2.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      left: 20.w,
                      child: chatIcon(
                          context: context,
                          icon: 'assets/icons/message_icon.svg'),
                      //SvgPicture.asset('assets/icons/message_icon.svg'),
                    ),
                    Positioned(
                      top: 50.h,
                      left: 300.w,
                      child: GestureDetector(
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
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.r)),
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  04',
                                    style: defaultText12.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Nunito-Bold'),
                                  ),
                                  SvgPicture.asset('assets/icons/noti_icon.svg')
                                ])),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      left: 120.w,
                      child: Text(
                        widget.detailSubject.info.subjectName,
                        style: defaultText20.copyWith(
                          color: Colors.white,
                          fontFamily: 'Nunito-Bold',
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0.h,
                        left: 10.w,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ))
                  ]),
                ),
                automaticallyImplyLeading: false,
                pinned: false,
                toolbarHeight: 122.h,
                forceElevated: innerBoxIsScrolled,
                // bottom: TabBar(
                //   tabs: tabs.map((String name) => Tab(text: name)).toList(),
                // ),
                backgroundColor: Colors.white,
              ),
            ),
          ];
        },
        body: Container(
          decoration: const BoxDecoration(color: kPrimaryColor),
          width: 390.w,
          child: AspectRatio(
            aspectRatio: 12 / 8,
            child: TabContainer(
              controller: TabController(
                length: 2,
                vsync: this,
              ),
              borderRadius: BorderRadius.circular(20),
              tabBorderRadius: BorderRadius.circular(30),
              tabEdge: TabEdge.top,
              curve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                animation =
                    CurvedAnimation(curve: Curves.easeIn, parent: animation);
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.2, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              color: Colors.white,
              selectedTextStyle: defaultBoldText.copyWith(
                fontSize: 15.sp,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
              unselectedTextStyle: defaultBoldText.copyWith(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none),
              tabs: _getTabs1(),
              children: getChildren2(widget.detailSubject),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _getTabs1() {
  return [
    const Text(
      'Lịch học',
    ),
    const Text(
      'Thông tin',
    )
  ];
}

List<Widget> getChildren2(DetailSubjectModels detailSubject) {
  return [
    TabSchedule(
      lichHoc: detailSubject.lichHoc,
      document: detailSubject.document,
    ),
    // TabExercise(
    //   name: _tabs[1],
    // ),
    TabInfomation(
      detailSubject: detailSubject,
    )
  ];
}

// class Schedule extends StatelessWidget {
//   const Schedule({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.vertical,
//         padding: const EdgeInsets.all(8),
//         itemCount: 4,
//         itemBuilder: (BuildContext context, int index) {
//           return const CommingLesson(
//             videoLesson: [],
//           );
//         });
//   }
// }

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
