import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/main.dart';
import 'package:binh_thuan/models/calender_model.dart';
import 'package:binh_thuan/models/login_model.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:binh_thuan/modules/exercise/exercise_screen.dart';
import 'package:binh_thuan/modules/schedule/table_calender.dart';
import 'package:binh_thuan/repo/repo/calender_repo.dart';
import 'package:binh_thuan/repo/repo/excercise_repo.dart';
import 'package:binh_thuan/router/app_pages.dart';
import 'package:binh_thuan/router/app_router.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import 'package:binh_thuan/main.dart' as main;

import '../../exercise/exercise_model.dart';
import '../../notification/noti_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.useRouter = false, required this.info});
  final HomeModel info;
  final bool useRouter;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late StudentModel student;
  @override
  void initState() {
    super.initState();
    student = widget.info.student;
  }


  // listenToNotifications() {
  //   if (kDebugMode) {
  //     print("Listening to notification");
  //   }
  //   LocalNotifications.onClickNotification.stream.listen((event) {
  //     if (kDebugMode) {
  //       print('${event}tesst');
  //     }
  //     Navigator.pushNamed(context, '/another', arguments: event);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(listNotification.length,
        (index) => NotificationItem(noti: listNotification[index]));
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 390.w,
                height: 350.h,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: 255.h,
                      image: const AssetImage(
                        'assets/images/home_background.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 71.h,
                    left: 30.w,
                    child: chatIcon(
                      context: context,
                      icon:
                          // 'assets/icons/message_icon.svg'
                          'assets/icons/chat.svg',
                    ),
                  ),
                  // Positioned(
                  //   top: 71.h,
                  //   left: 30.w,
                  //   child: Builder(
                  //     builder: (context) {
                  //       return InkWell(
                  //           onTap: () {
                  //             Scaffold.of(context).openDrawer();
                  //           },
                  //           child: SvgPicture.asset(
                  //               'assets/icons/three_stick_icon.svg'));
                  //     },
                  //   ),
                  // ),
                  Positioned(
                    top: 71.h,
                    right: 20.w,
                    child: GestureDetector(
                      onTap: () async {
                        main.listNotification =
                            await NotificationRepo().getListMessages();
                        AppRouter.toPage(
                          context,
                          AppPages.NotificationScreen,
                          arguments: {},
                        );
                      },
                      child: SvgPicture.asset('assets/icons/noti_icon.svg'),
                    ),
                  ),
                  Positioned(
                    top: 112.h,
                    left: 20.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 72.w,
                          height: 72.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  student.gender == 'Nam'
                                      ? 'assets/images/avatar_nam.jpg'
                                      : 'assets/images/avatar_nu.jpg',
                                ),
                                scale: 3),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student.fullName,
                              style: defaultBoldText.copyWith(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Mã học sinh : ${student.code}",
                              style: defaultBoldText.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 226.h,
                    left: 20.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      width: 350.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.1),
                            spreadRadius: 8,
                            blurRadius: 9,
                            offset: const Offset(4, 5),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Lớp',
                                style: defaultBoldText.copyWith(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12.sp,
                                    color: color666),
                              ),
                              Text(
                                student.nameClass,
                                style: defaultBoldText.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: keyBlack),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              List<ExcerciseModel> listExercises =
                                  await ExcerciseRepo().getListEcercise();
                              pushWithoutNavBar(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExerciseScreen(
                                    listExercises: listExercises,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 90.h,
                              width: 110.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bài tập chưa làm',
                                    style: defaultBoldText.copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12.sp,
                                      color: color666,
                                    ),
                                  ),
                                  Text(
                                    '${widget.info.unfinished} bài',
                                    style: defaultBoldText.copyWith(
                                      fontWeight: FontWeight.w200,
                                      color: keyBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Điểm trung bình',
                                style: defaultBoldText.copyWith(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12.sp,
                                    color: color666),
                              ),
                              Text(
                                widget.info.average.toStringAsFixed(1),
                                style: defaultBoldText.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: keyBlack),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      List<CalenderEventModel> listCalender =
                          await CalenderRepo().getCalender();
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                            builder: (_) => TableEventsExample(
                                  listCalender: listCalender,
                                )),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/calender.svg',
                      height: 86.h,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Bài tập
                  InkWell(
                    onTap: () async {
                      List<ExcerciseModel> listExercises =
                          await ExcerciseRepo().getListEcercise();
                      pushWithoutNavBar(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseScreen(
                                    listExercises: listExercises,
                                  )));
                    },
                    child: SvgPicture.asset(
                      'assets/icons/home_work.svg',
                      height: 86.h,
                    ),
                  ),
                  // Điểm số
                  // SvgPicture.asset(
                  //   'assets/icons/score.svg',
                  //   height: 86.h,
                  // ),
                  // Học phí
                  // GestureDetector(
                  //   onTap: () {
                  //     pushWithoutNavBar(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const TuitionScreen()));
                  //   },
                  //   child: SvgPicture.asset(
                  //     'assets/icons/tuition.svg',
                  //     height: 86.h,
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 15.h, 0, 5.h),
                child: Text('Đang diễn ra', style: defaultBoldText),
              ),
              // Container(
              //   width: 390.w,
              //   height: 100.h,
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(10.r)),
              //     boxShadow: [
              //       BoxShadow(
              //         color: kPrimaryColor.withOpacity(0.1),
              //         spreadRadius: 8,
              //         blurRadius: 6,
              //         offset: const Offset(4, 6),
              //       ),
              //     ],
              //     color: Colors.white,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text('Lorem ipsum',
              //               style: defaultBoldText.copyWith(fontSize: 18.sp)),
              //           Container(
              //             margin: const EdgeInsetsDirectional.only(
              //                 start: 1.0, end: 1.0),
              //             height: 1.h,
              //             width: 42.w,
              //             color: Colors.black,
              //           ),
              //           Text(
              //             'Tiết 8: Lorem ipsum dolor sit amet',
              //             style: defaultText14,
              //           ),
              //           Row(
              //             children: [
              //               Row(children: [
              //                 SvgPicture.asset('assets/icons/online.svg'),
              //                 SizedBox(
              //                   width: 10.w,
              //                 ),
              //                 Text(
              //                   '07:15 - 08:15',
              //                   style: defaultText14.copyWith(
              //                       color: const Color(0xff666666)),
              //                 ),
              //               ]),
              //             ],
              //           )
              //         ],
              //       ),
              //       Container(
              //         alignment: Alignment.center,
              //         margin: const EdgeInsets.all(6),
              //         height: 76.h,
              //         width: 76.w,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(8.r),
              //           ),
              //           color: const Color(0xffFF6667),
              //         ),
              //         child: GestureDetector(
              //           onTap: () {
              //             showDialog(
              //                 context: context,
              //                 builder: (_) => const CustomDialog());
              //           },
              //           child: Text('Vào \nhọc',
              //               style:
              //                   defaultBoldText.copyWith(color: Colors.white)),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              (widget.info.comming.isEmpty)
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
                        itemCount: widget.info.comming.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ComingLesson(
                            comingLessonModels: widget.info.comming[index],
                            id: widget.info.comming[index].id,
                          );
                        },
                      ),
                    ),

              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 15.w, 0, 0),
                child: Text('Thông báo', style: defaultBoldText),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 138.h,
                    width: 390.w,
                    child: PageView.builder(
                      padEnds: false,
                      controller: controller,
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: SlideEffect(
                        paintStyle: PaintingStyle.stroke,
                        activeDotColor: kPrimaryColor,
                        dotColor: kPrimaryColor,
                        dotHeight: 10.h,
                        dotWidth: 10.w),
                    onDotClicked: (index) {
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Lịch học sắp tới', style: defaultBoldText),
                    // Text(
                    //   'Xem thêm',
                    //   style: defaultText12.copyWith(
                    //     fontWeight: FontWeight.w500,
                    //     color: kPrimaryColor,
                    //     fontSize: 13.sp,
                    //   ),
                    // ),
                  ],
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                itemCount: widget.info.comming.length,
                itemBuilder: (BuildContext context, int index) {
                  return ComingLesson(
                    comingLessonModels: widget.info.comming[index],
                    id: widget.info.comming[index].id,
                  );
                },
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
